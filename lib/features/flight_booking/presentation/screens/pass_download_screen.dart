import 'dart:developer';

import 'package:barcode/barcode.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/features/bottom_navigation/bottom_nav_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/services/barcode_service.dart';
import '../../../../core/services/firebase_notification_service.dart';
import '../../../../core/services/pdf_generator.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../../models/payment_verify_res_model.dart';
import '../widgets/launge_access_widget.dart';

class PassDownloadScreen extends StatefulWidget {
  final PaymentVerifiedModel data;
  const PassDownloadScreen({super.key, required this.data});

  @override
  State<PassDownloadScreen> createState() => _PassDownloadScreenState();
}

class _PassDownloadScreenState extends State<PassDownloadScreen> {
  final SearchData searchData = SearchData();
  String barCodeSvg = '';

  @override
  void initState() {
    log(':::: ${widget.data.booking?.bookingReference}');
    log(':::: ${widget.data.booking}');
    log(':::: ${widget.data.payment}');
    Future.delayed(Duration.zero, () async {
      barCodeSvg = BarcodeService.buildBarcode(
        Barcode.code39(),
        widget.data.booking?.bookingReference ?? 'No-ref-id',
        width: 300,
        height: 80,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: Center(
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    //nav Controller
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AppCustomAppbar(
                        isBackButtonRequired: false,
                        centerTitle: 'E-Boarding Pass',
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                            width: AppHelpers.getScreenWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 16,
                                  width: 40,
                                  color: AppColors.grey,
                                ),
                                Text(
                                  '${widget.data.payment?.paymentReference}'
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...widget.data.booking!.flightData!.itineraries!.map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 90,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.segments?.first.departure?.iataCode ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                          AppHelpers.formatDateTime(
                                              DateTime.parse(e.segments!.first
                                                      .departure!.at ??
                                                  ''),
                                              pattern: 'hh:mm'),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                        AppHelpers.formatDateTime(
                                          DateTime.parse(
                                              e.segments!.first.departure!.at ??
                                                  ''
                                                      ''),
                                          pattern: 'dd MMM, yyyy',
                                        ),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        'T${e.segments!.first.departure!.terminal ?? 1}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: width * 0.25,
                                    child: Column(
                                      children: [
                                        AppHelpers.svgAsset(
                                            assetName: 'flight', width: 100),
                                        Column(
                                          children: [
                                            const Text(
                                              '2H',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Divider(
                                              thickness: 0.5,
                                              color: AppColors.primary
                                                  .withOpacity(0.3),
                                            ),
                                            Text(
                                              e.segments?.length == 1
                                                  ? 'Non-Stop'
                                                  : '${(e.segments!.length - 1)} Stop(s)',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 90,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        e.segments?.last.arrival?.iataCode ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        AppHelpers.formatDateTime(
                                            DateTime.parse(e
                                                    .segments?.last.arrival?.at
                                                    .toString() ??
                                                ''),
                                            pattern: 'hh:mm'),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        AppHelpers.formatDateTime(
                                            DateTime.now(),
                                            pattern: 'dd MMM, yyyy'),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black),
                                      ),
                                      Text(
                                        'T${e.segments!.first.arrival!.terminal ?? 1}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          DottedBorder(
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            child: Column(
                              children: [
                                ...widget
                                    .data.booking!.travellerDetails!.adults!
                                    .map(
                                  (e) => ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          AppColors.grey.withOpacity(0.2),
                                      child: const Icon(
                                        Icons.person,
                                        size: 18,
                                      ),
                                    ),
                                    title: Text(
                                      '${e.firstName} ${e.lastName}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: Text(
                                      'DOB: ${e.dateOfBirth} | Nationality: ${e.nationality}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                ...widget
                                    .data.booking!.travellerDetails!.children!
                                    .map(
                                  (e) => ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          AppColors.grey.withOpacity(0.2),
                                      child: const Icon(
                                        Icons.person,
                                        size: 18,
                                      ),
                                    ),
                                    title: Text(
                                      '${e.firstName} ${e.lastName}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: Text(
                                      'DOB: ${e.dateOfBirth} | Nationality: ${e.nationality}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                ...widget
                                    .data.booking!.travellerDetails!.infants!
                                    .map(
                                  (e) => ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          AppColors.grey.withOpacity(0.2),
                                      child: const Icon(
                                        Icons.person,
                                        size: 18,
                                      ),
                                    ),
                                    title: Text(
                                      '${e.firstName} ${e.lastName}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: Text(
                                      'DOB: ${e.dateOfBirth} | Nationality: ${e.nationality}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipPath(
                        clipper: TicketClipper(),
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            width: width,
                            height: 120,
                            child: SizedBox(
                              height: 73,
                              child: SvgPicture.string(
                                barCodeSvg,
                                width: 300,
                                height: 80,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: AppHelpers.getScreenHeight(context) * 0.24,
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, -4),
              ),
            ],
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const LaungeAccessWidget(),
              const SizedBox(
                height: 8,
              ),
              AppPrimaryButton(
                title: 'Download Pass',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                isLoading: false,
                bgColor: AppColors.primary,
                onPressed: () async {
                  try {
                    Uint8List ticket =
                        await PdfService().generateTicket(data: widget.data);
                    log(ticket.length.toString());
                    String? path = await savePdfToMobileStorage(
                        ticket, '${widget.data.booking?.bookingReference}.pdf');
                    if (path != null) {
                      FirebaseNotificationService instance =
                          FirebaseNotificationService.instance;

                      AppHelpers.showSnackBar(
                          context, 'Ticket Downloaded to Download Ticket');
                      return;
                    }
                    AppHelpers.showSnackBar(
                        context, 'Permission Denied to Download Ticket');
                  } catch (e) {
                    log('$e');
                    AppHelpers.showSnackBar(
                        context, 'Error Downloading Ticket');
                  }
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                  onPressed: () {
                    context.goNamed(BottomNavModule.name);
                  },
                  child: const Text(
                    'Book another flight',
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

getDuration({required String duration}) {
  //input PT6H35M
  duration = duration.replaceAll('PT', '');
  String hr = duration.split('H')[0].trim();
  String mn = duration.split('H')[1].split('M')[0].trim();

  return '${hr}H ${mn}M';
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 20.0),
    );
    path.addOval(
      Rect.fromCircle(
          center: Offset(size.width, size.height / 2), radius: 20.0),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
