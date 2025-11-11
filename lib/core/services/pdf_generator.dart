import 'dart:developer';
import 'dart:io';

import 'package:barcode/barcode.dart';
import 'package:excellistravel/core/services/barcode_service.dart';
import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../features/flight_booking/models/payment_verify_res_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfService {
  final pdf = pw.Document();
  Future<Uint8List> generateTicket({
    required PaymentVerifiedModel data,
  }) async {
    try {
      final img = await rootBundle.load('assets/images/dark_app_logo.png');
      final imageBytes = img.buffer.asUint8List();
      pw.Image logo = pw.Image(pw.MemoryImage(imageBytes));
      String barCodeSvg = '';
      barCodeSvg = BarcodeService.buildBarcode(
        Barcode.code39(),
        data.booking?.bookingReference ?? 'No-ref-id',
        width: 120,
        height: 50,
      );
      final doc =
          pw.Document(title: 'E-Ticket: ${data.booking?.bookingReference}');

      final headerStyle = pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 18,
        color: PdfColors.blue800,
      );
      final subHeaderStyle = pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 12,
        color: PdfColors.grey700,
      );
      final sectionTitleStyle = pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 14,
        color: PdfColors.blueGrey700,
      );
      final tableHeaderStyle = pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 8,
        color: PdfColors.white,
      );

      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          header: (context) => _header(
              context: context, image: imageBytes, barCodeSvg: barCodeSvg),
          build: (pw.Context context) {
            return [
              pw.Center(child: pw.Text('itinerary', style: headerStyle)),
              pw.SizedBox(height: 5),
              pw.Center(
                  child: pw.Text(
                      'Booking Reference: ${data.booking?.bookingReference}',
                      style: const pw.TextStyle(
                          fontSize: 10, color: PdfColors.red700))),
              pw.Divider(color: PdfColors.blueGrey),
              pw.SizedBox(height: 10),

              // 2. Passenger Roster (List of Passengers)
              pw.Text(
                  'Passenger Roster (${data.booking?.flightData?.travelerPricings?.length} Total)',
                  style: sectionTitleStyle),
              pw.SizedBox(height: 5),
              _buildPassengerTable(
                  data.booking!.travellerDetails!, tableHeaderStyle),
              pw.SizedBox(height: 20),

              // 3. Detailed Flight Itinerary
              pw.Text('Flight Itinerary Details', style: sectionTitleStyle),
              pw.Divider(color: PdfColors.blueGrey),

              // Loop through multiple Itineraries (e.g., Outbound and Return)
              ...data.booking!.flightData!.itineraries!.map((itinerary) {
                return _buildItinerarySegment(itinerary, tableHeaderStyle);
              }),

              // Forces the pricing summary to the bottom of the page/last page
              pw.Spacer(),

              // 4. Pricing Summary
              pw.Container(
                  alignment: pw.Alignment.bottomRight,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text('Pricing Summary (INR)',
                            style: sectionTitleStyle),
                        pw.Divider(color: PdfColors.blueGrey),
                        _buildPriceRow('Base Fare:',
                            '${data.booking!.fareDetails!.markup!}'),
                        _buildPriceRow(
                            'Taxes & Fees:',
                            data.booking!.fareDetails!.taxes!
                                .toStringAsFixed(2)),
                        pw.Divider(color: PdfColors.black, thickness: 1),
                        _buildPriceRow(
                            'TOTAL PAID:',
                            data.booking!.fareDetails!.taxesWithMarkup!
                                .toStringAsFixed(2),
                            isTotal: true),
                      ])),
            ];
          },
        ),
      );

      return doc.save();
    } catch (e) {
      log("Error generating PDF: $e");
      rethrow;
    }
  }
}

String _formatDateTime(DateTime dt) {
  // Simple formatting for PDF display
  return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
}

pw.Widget _header(
    {required pw.Context context,
    required Uint8List? image,
    required String barCodeSvg}) {
  return pw.Container(
    padding: const pw.EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    height: 92,
    decoration: const pw.BoxDecoration(
      border:
          pw.Border(bottom: pw.BorderSide(color: PdfColors.grey, width: 1.5)),
    ),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.SizedBox(
          width: 120,
          height: 60,
          child: pw.Image(pw.MemoryImage(image!)),
        ),
        pw.SvgImage(svg: barCodeSvg)
      ],
    ),
  );
}

pw.Widget _buildPassengerTable(
    TravellerDetails passengers, pw.TextStyle headerStyle) {
  return pw.TableHelper.fromTextArray(
    border: null,
    headerDecoration: const pw.BoxDecoration(color: PdfColors.teal700),
    headerStyle: headerStyle,
    rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
            bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey300))),
    columnWidths: {
      0: const pw.FlexColumnWidth(3),
      1: const pw.FlexColumnWidth(1),
      2: const pw.FlexColumnWidth(1),
      3: const pw.FlexColumnWidth(3),
    },
    headers: ['NAME', 'TYPE', 'GENDER', 'DOB'],
    data: passengers.adults!
        .map((Adult p) => [
              '${p.firstName}${p.lastName ?? 'N/A'} | Phone: ${p.nationality ?? 'N/A'}',
              'ADULT',
              p.title?.toUpperCase(),
              _formatDateTime(DateTime.parse(p.dateOfBirth!))
                  .split(' ')[0], // Date only
            ])
        .toList(),
  );
}

pw.Widget _buildItinerarySegment(
    Itinerary itinerary, pw.TextStyle headerStyle) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: itinerary.segments!.map((segment) {
      return pw.Padding(
        padding: const pw.EdgeInsets.only(top: 10, bottom: 10),
        child: pw.Container(
          padding: const pw.EdgeInsets.all(8),
          decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.blueGrey200),
              borderRadius: pw.BorderRadius.circular(4)),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
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
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.blueGrey600),
                headerStyle: headerStyle,
                data: <List<String>>[
                  [
                    segment.carrierCode ?? 'N/A',
                    segment.aircraft?.code ?? 'N/A',
                    segment.duration ?? 'N/A',
                    segment.carrierCode ?? 'N/A',
                    segment.carrierCode ?? 'N/A',
                  ]
                ],
                headers: [
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
                children: [
                  _buildEndpointCard('DEPARTURE', segment.departure),
                  _buildEndpointCard('ARRIVAL', segment.arrival),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}

pw.Widget _buildEndpointCard(String title, Arrival? endpoint) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(5),
    decoration: pw.BoxDecoration(
        color: PdfColors.grey100, borderRadius: pw.BorderRadius.circular(3)),
    width: 250, // Fixed width for alignment
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
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
          'Time: ${_formatDateTime(DateTime.parse(endpoint!.at!))}',
          style: const pw.TextStyle(fontSize: 9),
        ),
      ],
    ),
  );
}

// Helper function for building the pricing rows
pw.Row _buildPriceRow(String label, String amount, {bool isTotal = false}) {
  return pw.Row(
    mainAxisSize: pw.MainAxisSize.min,
    children: [
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
}

/// Saves the PDF data (Uint8List) to the device's Downloads/Documents folder.
Future<String?> savePdfToMobileStorage(
    Uint8List pdfBytes, String fileName) async {
  if (Platform.isAndroid) {
    Permission permission = Permission.manageExternalStorage;
    var status = await permission.request();
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
      String newPath = directory.path
          .replaceAll("Android/data/com.excellistravel", "ExcellisTravel");
      directory = Directory(newPath);
    }
  } else if (Platform.isIOS) {
    // For iOS, save to the Documents directory.
    directory = await getApplicationDocumentsDirectory();
  }

  if (directory == null) {
    print("Could not determine storage directory.");
    return null;
  }

  // Create the directory if it doesn't exist
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }

  try {
    // 3. Construct the full file path
    final file = File('${directory.path}/$fileName');

    // 4. Write the Uint8List bytes to the file
    await file.writeAsBytes(pdfBytes, flush: true);

    print('PDF saved successfully to: ${file.path}');
    return file.path;
  } catch (e) {
    print('Error saving PDF: $e');
    return null;
  }
}
