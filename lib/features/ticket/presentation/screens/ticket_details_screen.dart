import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/services/file_downloader.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../models/ticket_model.dart';
import '../widgets/billing_info_widget.dart';

class TicketDetailsScreen extends StatelessWidget {
  const TicketDetailsScreen({super.key, required this.ticketData});
  final Booking? ticketData;

  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);

    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppCustomAppbar(
                    start:
                        '${ticketData?.flightData?.itineraries?.first.segments?.first.departure?.iataCode}',
                    end:
                        '${ticketData?.flightData?.itineraries?.first.segments?.last.arrival?.iataCode}',
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 45,
                              width: width,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: AppColors.info,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    '${ticketData?.bookingReference}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ))),

                          ...ticketData!.flightData!.itineraries!.map(
                            (Itinerary e) => DottedBorder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              dashPattern: const <double>[8, 4],
                              customPath: (Size size) => Path()
                                ..moveTo(0, size.height)
                                ..relativeLineTo(size.width, 0),
                              color: AppColors.grey,
                              strokeWidth: 0.5,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                          height: 90,
                                          width: width * 0.25,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${e.segments?.first.departure?.iataCode}',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                AppHelpers.formatDateTime(
                                                    DateTime.parse(
                                                        '${e.segments?.first.departure?.at}'),
                                                    pattern: 'dd MMM, yyyy'),
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.grey),
                                              ),
                                              Text(
                                                AppHelpers.formatDateTime(
                                                    DateTime.parse(
                                                        '${e.segments?.first.departure?.at}'),
                                                    pattern: 'hh:mm'),
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.grey),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                          width: width * 0.25,
                                          child: Column(
                                            children: <Widget>[
                                              AppHelpers.svgAsset(
                                                  assetName: 'flight',
                                                  width: 100),
                                              const Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 90,
                                        width: width * 0.25,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              '${e.segments?.last.arrival?.iataCode}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              AppHelpers.formatDateTime(
                                                  DateTime.parse(
                                                      '${e.segments?.last.arrival?.at}'),
                                                  pattern: 'dd MMM, yyyy'),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.grey),
                                            ),
                                            Text(
                                              AppHelpers.formatDateTime(
                                                  DateTime.parse(
                                                      '${e.segments?.last.arrival?.at}'),
                                                  pattern: 'hh:mm'),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...ticketData!
                                      .flightData!.itineraries!.first.segments!
                                      .map(
                                    (Segment e) => ExpansionTile(
                                      collapsedShape: const Border(),
                                      shape: const Border(),
                                      tilePadding: const EdgeInsets.all(0),
                                      childrenPadding: const EdgeInsets.all(0),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                            'assets/images/airlines/${e.carrierCode}.png'),
                                      ),
                                      title: Text(
                                        '${e.carrierCode} -  ${getDuration(time: e.duration!)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '${e.number} | ${e.aircraft?.code}',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      children: <Widget>[
                                        ListTile(
                                          leading: AppHelpers.svgAsset(
                                              assetName: 'from', isIcon: true),
                                          title: const Text(
                                            'Departure ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          subtitle: Text(
                                            AppHelpers.formatDateTime(
                                                DateTime.parse(
                                                    e.departure?.at ?? ''),
                                                pattern:
                                                    'dd MMM, yyyy | hh:mm'),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black
                                                // color: AppColors.grey
                                                ),
                                          ),
                                          trailing: Text(
                                            '${e.departure?.iataCode}',
                                            style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        ListTile(
                                          leading: AppHelpers.svgAsset(
                                              assetName: 'from', isIcon: true),
                                          title: const Text('Arrival',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700)),
                                          subtitle: Text(
                                            AppHelpers.formatDateTime(
                                                DateTime.parse(
                                                    e.arrival?.at ?? ''),
                                                pattern:
                                                    'dd MMM, yyyy | hh:mm'),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black
                                                // color: AppColors.grey
                                                ),
                                          ),
                                          trailing: Text(
                                            '${e.arrival?.iataCode}',
                                            style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Passenger Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                          ...ticketData!.travellerDetails!.adults!.map(
                            (Adult adult) => ListTile(
                              leading: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                              ),
                              title: Text(
                                '${adult.firstName ?? 'N/A'} ${adult.lastName ?? 'N/A'}',
                              ),
                              subtitle: Text(
                                '${adult.dateOfBirth ?? 'N/A'} | ${adult.open ?? 'N/A'}',
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Billing Information',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: BillingInfo(
                              billingAddress: ticketData?.billingAddress,
                              contactDetails: ticketData?.contactDetails,
                            ),
                          ),
                          const SizedBox(height: 45),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 16),
                          //   child: FareBreakdownCard(),
                          // ),
                          const SizedBox(height: 45),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.4,
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '₹${ticketData?.totalAmount}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  Text(
                    '${ticketData?.paymentStatus}'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: ticketData?.paymentStatus == 'paid'
                            ? AppColors.success
                            : AppColors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.4,
              height: 45,
              child: AppPrimaryButton(
                  onPressed: ticketData?.bookingStatus == 'confirmed'
                      ? () async {
                          try {
                            Fluttertoast.showToast(msg: 'Downloading...');
                            final bool res =
                                await FileDownloaderService.saveFile(
                              baseFare: '${ticketData?.fareDetails?.baseFare}',
                              totalFare:
                                  '${ticketData?.fareDetails?.totalFare}',
                              markupPrice:
                                  '${(ticketData?.fareDetails?.totalFare ?? 0.00) - (ticketData?.fareDetails?.baseFare ?? 0.00)}',
                              bokkingRefId: '${ticketData?.bookingReference}',
                              showDownloadProgress: (count, total) {
                                log('$count $total');
                                log('${(count / total) * 100}');
                              },
                            );

                            if (res) {
                              Fluttertoast.showToast(
                                  msg: 'Downloaded successfully');
                            }
                          } catch (e) {
                            Fluttertoast.showToast(msg: '$e');
                          }
                        }
                      : null,
                  bgColor: ticketData?.bookingStatus == 'confirmed'
                      ? AppColors.primary
                      : AppColors.grey,
                  style: const TextStyle(fontSize: 14, color: AppColors.white),
                  title: 'Download',
                  isLoading: false),
            )
          ],
        ),
      ),
    );
  }
}

String getDuration({required String time}) {
  int minute = 0;
  int hours = 0;

  time.split('H').forEach((String element) {
    if (element.contains('M')) {
      minute = int.parse(element.split('M')[0]);
    } else {
      if (element.contains('PT')) {
        hours = int.parse(element.split('PT')[1]);
      }
    }
  });
  return '${hours}H ${minute}M';
}
