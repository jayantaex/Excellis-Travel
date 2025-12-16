import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/services/file_downloader.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../../utils/airline_info_provider.dart';
import '../../data/models/ticket_model.dart';
import '../widgets/billing_info_widget.dart';
import '../widgets/segment_card.dart' show SegmentCard;

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key, required this.ticketData});
  final Booking? ticketData;

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  AirlineInfoProvider airlineInfoProvider = AirlineInfoProvider();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {});
    super.initState();
  }

  // String _airlineName = '';
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
                        '${widget.ticketData?.flightData?.itineraries?.first.segments?.first.departure?.iataCode}',
                    end:
                        '${widget.ticketData?.flightData?.itineraries?.first.segments?.last.arrival?.iataCode}',
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
                                    '${widget.ticketData?.bookingReference}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ))),
                          ...widget.ticketData!.flightData!.itineraries!.map(
                            (Itinerary e) => DottedBorder(
                              options: CustomPathDottedBorderOptions(
                                customPath: (Size size) => Path()
                                  ..moveTo(0, size.height)
                                  ..relativeLineTo(size.width, 0),
                                dashPattern: <double>[5, 5],
                                color: AppColors.grey.withValues(alpha: 0.5),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.grey),
                                                ),
                                                Text(
                                                  AppHelpers.formatDateTime(
                                                      DateTime.parse(
                                                          '${e.segments?.first.departure?.at}'),
                                                      pattern: 'hh:mm'),
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                    ...widget.ticketData!.flightData!
                                        .itineraries!.first.segments!
                                        .map(
                                      (Segment e) => SegmentCard(data: e),
                                    ),
                                  ],
                                ),
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
                          ...widget.ticketData!.travellerDetails!.adults!.map(
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
                                '${adult.firstName ?? ''} ${adult.lastName ?? ''}',
                              ),
                              subtitle: adult.dateOfBirth?.isEmpty ?? true
                                  ? null
                                  : Text(
                                      AppHelpers.formatDate(
                                          DateTime.parse(adult.dateOfBirth ??
                                              DateTime.now().toString()),
                                          pattern: 'dd MMM yyy'),
                                    ),
                            ),
                          ),
                          ...widget.ticketData!.travellerDetails!.children!.map(
                            (child) => ListTile(
                              leading: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                              ),
                              title: Text(
                                '${child.firstName ?? ''} ${child.lastName ?? ''}',
                              ),
                              subtitle: child.dateOfBirth?.isEmpty ?? true
                                  ? null
                                  : Text(
                                      AppHelpers.formatDate(
                                          DateTime.parse(child.dateOfBirth ??
                                              DateTime.now().toString()),
                                          pattern: 'dd MMM yyy'),
                                    ),
                            ),
                          ),
                          ...widget.ticketData!.travellerDetails!.infants!.map(
                            (infant) => ListTile(
                              leading: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                              ),
                              title: Text(
                                '${infant.firstName ?? ''} ${infant.lastName ?? ''}',
                              ),
                              subtitle: infant.dateOfBirth?.isEmpty ?? true
                                  ? null
                                  : Text(
                                      AppHelpers.formatDate(
                                          DateTime.parse(infant.dateOfBirth ??
                                              DateTime.now().toString()),
                                          pattern: 'dd MMM yyy'),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Billing Information',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: BillingInfo(
                              billingAddress: widget.ticketData?.billingAddress,
                              contactDetails: widget.ticketData?.contactDetails,
                              billingDate: widget.ticketData?.createdAt,
                            ),
                          ),
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
                    '₹${widget.ticketData?.totalAmount}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  Text(
                    '${widget.ticketData?.paymentStatus}'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: widget.ticketData?.paymentStatus == 'paid'
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
                  onPressed: widget.ticketData?.bookingStatus == 'confirmed'
                      ? () async {
                          try {
                            Fluttertoast.showToast(msg: 'Downloading...');
                            final bool res =
                                await FileDownloaderService.saveFile(
                              baseFare:
                                  '${(widget.ticketData?.fareDetails?.totalFare ?? 0.0) - (widget.ticketData?.fareDetails?.markup ?? 0.0)}',
                              totalFare:
                                  '${widget.ticketData?.fareDetails?.totalFare}',
                              markupPrice:
                                  '${(widget.ticketData?.fareDetails?.markup ?? 0.00)}',
                              bokkingRefId:
                                  '${widget.ticketData?.bookingReference}',
                              showDownloadProgress: (count, total) {},
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
                  bgColor: widget.ticketData?.bookingStatus == 'confirmed'
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
