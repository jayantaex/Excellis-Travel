import 'dart:developer';
import 'dart:io';
import 'package:barcode/barcode.dart';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../features/flight_booking/models/payment_verify_res_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/app_helpers.dart';
import 'barcode_service.dart';

class PdfService {
  final pw.Document pdf = pw.Document();
  Future<Uint8List> generateTicket({
    required PaymentVerifiedModel data,
  }) async {
    try {
      final ByteData img =
          await rootBundle.load('assets/images/dark_app_logo.png');
      final Uint8List imageBytes = img.buffer.asUint8List();
      String barCodeSvg = '';
      barCodeSvg = BarcodeService.buildBarcode(
        Barcode.code39(),
        data.booking?.bookingReference ?? 'No-ref-id',
        width: 120,
        height: 50,
      );
      final pw.Document doc = pw.Document(
        title: '${data.booking?.bookingReference}',
        author: 'Excellis Travel',
      );

      final pw.TextStyle sectionTitleStyle = pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 14,
        color: PdfColors.blueGrey700,
      );
      final pw.TextStyle tableHeaderStyle = pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 8,
        color: PdfColors.white,
      );

      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          header: (pw.Context context) => _header(
            bookingId: data.booking?.bookingReference ?? '',
            context: context,
            image: imageBytes,
            barCodeSvg: barCodeSvg,
            bookingDate: data.booking?.createdAt ?? DateTime.now(),
            bookingStatus: data.booking?.bookingStatus ?? '',
          ),
          build: (pw.Context context) => <pw.Widget>[
            pw.SizedBox(height: 20),
            pw.Text('Flight Itinerary Details(${data.booking?.pnrNumber})',
                style: sectionTitleStyle),
            _buildPassengerTable(
                data.booking!.travellerDetails!, tableHeaderStyle,
                pnr: data.booking?.pnrNumber ?? '-',
                seat: data.booking?.seatSelections?.first.seatNumber ??
                    'NOT FOUND',
                ticketNo: data.booking?.seatSelections?.first.ticketNumber ??
                    'NOT FOUND'),
            pw.SizedBox(height: 20),

            // 3. Detailed Flight Itinerary
            pw.Text('Flight Itinerary Details', style: sectionTitleStyle),
            pw.Divider(color: PdfColors.blueGrey),

            // Loop through multiple Itineraries (e.g., Outbound and Return)
            ...data.booking!.flightData!.itineraries!.map(
                (Itinerary itinerary) =>
                    _buildItinerarySegment(itinerary, tableHeaderStyle)),

            // Forces the pricing summary to the bottom of the page/last page
            pw.Spacer(),

            // 4. Pricing Summary
            pw.Container(
                alignment: pw.Alignment.bottomRight,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: <pw.Widget>[
                      pw.SizedBox(height: 10),
                      pw.Text('Pricing Summary (INR)',
                          style: sectionTitleStyle),
                      pw.Divider(color: PdfColors.blueGrey),
                      _buildPriceRow('Base Fare:',
                          '${data.booking!.fareDetails!.markup!}'),
                      _buildPriceRow('Taxes & Fees:',
                          data.booking!.fareDetails!.taxes!.toStringAsFixed(2)),
                      pw.Divider(color: PdfColors.black, thickness: 1),
                      _buildPriceRow(
                          'TOTAL PAID:',
                          data.booking!.fareDetails!.taxesWithMarkup!
                              .toStringAsFixed(2),
                          isTotal: true),
                    ])),
          ],
        ),
      );

      return doc.save();
    } catch (e) {
      log('Error generating PDF: $e');
      rethrow;
    }
  }
}

pw.Widget _header({
  required pw.Context context,
  required Uint8List? image,
  required String barCodeSvg,
  required DateTime bookingDate,
  required String bookingStatus,
  required String bookingId,
}) =>
    pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      height: 80,
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.grey400, width: 1.2),
        ),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: <pw.Widget>[
          pw.SizedBox(
            width: 100,
            height: 60,
            child: pw.Image(pw.MemoryImage(image!)),
          ),
          pw.SizedBox(
            width: 230,
            height: 120,
            child: pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: <pw.Widget>[
                pw.Text('Ticket: $bookingStatus'.toUpperCase(),
                    style: const pw.TextStyle(fontSize: 10)),
                pw.Text('Booking ID: $bookingId'.toUpperCase(),
                    style: const pw.TextStyle(fontSize: 10)),
                pw.Text(
                  'Date: ${AppHelpers.formatDate(bookingDate, pattern: 'dd-MM-yyyy')} |  ${AppHelpers.formatDate(bookingDate, pattern: 'hh:mm a')}'
                      .toUpperCase(),
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          pw.SvgImage(svg: barCodeSvg)
        ],
      ),
    );

pw.Widget _buildPassengerTable(
        TravellerDetails passengers, pw.TextStyle headerStyle,
        {required String pnr,
        required String seat,
        required String ticketNo}) =>
    pw.TableHelper.fromTextArray(
      border: null,
      headerDecoration: const pw.BoxDecoration(color: PdfColors.orange500),
      headerStyle: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 8,
        color: PdfColors.white,
      ),
      cellStyle: pw.TextStyle(
        fontWeight: pw.FontWeight.normal,
        fontSize: 8,
        color: PdfColors.black,
      ),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey300),
        ),
      ),
      columnWidths: <int, pw.TableColumnWidth>{
        0: const pw.FlexColumnWidth(3),
        1: const pw.FlexColumnWidth(),
        2: const pw.FlexColumnWidth(),
        3: const pw.FlexColumnWidth(),
        4: const pw.FlexColumnWidth(2),
        5: const pw.FlexColumnWidth(2),
      },
      headers: <String>['NAME', 'TYPE', 'DOB', 'PNR', 'E-TICKET NO.', 'SEAT'],
      data: passengers.adults!
          .map((Adult p) => <String>[
                '${p.firstName} ${p.lastName ?? 'N/A'}'.toUpperCase(),
                'ADULT',
                AppHelpers.formatDate(DateTime.parse(p.dateOfBirth!),
                    pattern: 'dd-MM-yy'),
                pnr,
                ticketNo,
                seat
              ])
          .toList(),
    );

pw.Widget _buildItinerarySegment(
        Itinerary itinerary, pw.TextStyle headerStyle) =>
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: itinerary.segments!
          .map((Segment segment) => pw.Padding(
                padding: const pw.EdgeInsets.only(top: 10, bottom: 10),
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.blueGrey200),
                      borderRadius: pw.BorderRadius.circular(4)),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <pw.Widget>[
                      pw.Text(
                          '${segment.departure?.at} to ${segment.arrival?.at} (${segment.duration})',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 11,
                              color: PdfColors.black)),
                      pw.SizedBox(height: 5),
                      // Segment Flight Details Table
                      pw.TableHelper.fromTextArray(
                        border: null,
                        headerDecoration: const pw.BoxDecoration(
                            color: PdfColors.blueGrey600),
                        headerStyle: headerStyle,
                        data: <List<String>>[
                          <String>[
                            segment.carrierCode ?? 'N/A',
                            segment.aircraft?.code ?? 'N/A',
                            segment.duration ?? 'N/A',
                            segment.carrierCode ?? 'N/A',
                            segment.carrierCode ?? 'N/A',
                          ]
                        ],
                        headers: <String>[
                          'FLIGHT NO.',
                          'AIRLINE',
                          'CLASS',
                          'AIRCRAFT',
                          'CONF. NO.'
                        ],
                      ),
                      pw.SizedBox(height: 8),

                      // Arrival/Departure Endpoint Details (Inline Row)
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: <pw.Widget>[
                          _buildEndpointCard('DEPARTURE', segment.departure),
                          _buildEndpointCard('ARRIVAL', segment.arrival),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );

pw.Widget _buildEndpointCard(String title, Arrival? endpoint) => pw.Container(
      padding: const pw.EdgeInsets.all(5),
      decoration: pw.BoxDecoration(
          color: PdfColors.grey100, borderRadius: pw.BorderRadius.circular(3)),
      width: 250, // Fixed width for alignment
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Text(title,
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 8,
                  color: PdfColors.black)),
          pw.SizedBox(height: 2),
          pw.Text(
            '${endpoint?.iataCode} | Terminal: ${endpoint?.terminal}',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Text(
            'Time: ${AppHelpers.formatDate(DateTime.parse(endpoint!.at!))}',
            style: const pw.TextStyle(fontSize: 9),
          ),
        ],
      ),
    );

// Helper function for building the pricing rows
pw.Row _buildPriceRow(String label, String amount, {bool isTotal = false}) =>
    pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      children: <pw.Widget>[
        pw.Text(
          label,
          style: pw.TextStyle(
            fontWeight: isTotal ? pw.FontWeight.bold : pw.FontWeight.normal,
            fontSize: isTotal ? 12 : 9,
          ),
        ),
        pw.SizedBox(width: 10),
        pw.SizedBox(
          width: 80,
          child: pw.Text(
            'USD \$$amount',
            textAlign: pw.TextAlign.right,
            style: pw.TextStyle(
                fontWeight: isTotal ? pw.FontWeight.bold : pw.FontWeight.normal,
                fontSize: isTotal ? 12 : 9,
                color: isTotal ? PdfColors.red : PdfColors.black),
          ),
        ),
      ],
    );

/// Saves the PDF data (Uint8List) to the device's Downloads/Documents folder.
Future<String?> savePdfToMobileStorage(
    Uint8List pdfBytes, String fileName) async {
  if (Platform.isAndroid) {
    const Permission permission = Permission.manageExternalStorage;
    final PermissionStatus status = await permission.request();
    log('status: $status');
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return null;
    }
  }

  Directory? directory;

  if (Platform.isAndroid) {
    directory = await getExternalStorageDirectory();
    if (directory != null) {
      final String newPath = directory.path
          .replaceAll('Android/data/com.excellistravel', 'ExcellisTravel');
      directory = Directory(newPath);
    }
  } else if (Platform.isIOS) {
    // For iOS, save to the Documents directory.
    directory = await getApplicationDocumentsDirectory();
  }

  if (directory == null) {
    return null;
  }

  // Create the directory if it doesn't exist
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }

  try {
    // 3. Construct the full file path
    final File file = File('${directory.path}/$fileName');

    // 4. Write the Uint8List bytes to the file
    await file.writeAsBytes(pdfBytes, flush: true);

    return file.path;
  } catch (e) {
    return null;
  }
}
