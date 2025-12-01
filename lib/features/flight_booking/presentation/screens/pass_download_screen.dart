import 'package:barcode/barcode.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/services/barcode_service.dart';
import '../../../../core/services/file_downloader.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';
import '../../data/models/payment_verify_res_model.dart';

class PassDownloadScreen extends StatefulWidget {
  const PassDownloadScreen({super.key, required this.data});
  final PaymentVarifiedDataModel data;

  @override
  State<PassDownloadScreen> createState() => _PassDownloadScreenState();
}

class _PassDownloadScreenState extends State<PassDownloadScreen> {
  String barCodeSvg = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      barCodeSvg = BarcodeService.buildBarcode(
        Barcode.code39(),
        widget.data.bookingReference ?? 'No-ref-id',
        width: 250,
        height: 60,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);
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

                    Expanded(
                        child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 40,
                                          color: AppColors.grey,
                                        ),
                                        Text(
                                          '${widget.data.bookingReference}'
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
                                  ...?widget.data.flightData?.itineraries!.map(
                                    (e) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 90,
                                          width: width * 0.25,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.segments?.first.departure
                                                        ?.iataCode ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                  AppHelpers.formatDateTime(
                                                      DateTime.parse(e
                                                              .segments!
                                                              .first
                                                              .departure!
                                                              .at ??
                                                          ''),
                                                      pattern: 'hh:mm'),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                AppHelpers.formatDateTime(
                                                  DateTime.parse(e
                                                          .segments!
                                                          .first
                                                          .departure!
                                                          .at ??
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
                                                    assetName: 'flight',
                                                    width: 100),
                                                Column(
                                                  children: [
                                                    Text(
                                                      getDuration(
                                                          duration: e
                                                                  .segments!
                                                                  .first
                                                                  .duration ??
                                                              ''),
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
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
                                            children: [
                                              Text(
                                                e.segments?.last.arrival
                                                        ?.iataCode ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                AppHelpers.formatDateTime(
                                                    DateTime.parse(e.segments
                                                            ?.last.arrival?.at
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
                                                    DateTime.parse(e.segments
                                                            ?.last.arrival?.at
                                                            .toString() ??
                                                        ''),
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
                                        ...?widget
                                            .data.travellerDetails?.adults!
                                            .map(
                                          (e) => ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: CircleAvatar(
                                              backgroundColor: AppColors.grey
                                                  .withOpacity(0.2),
                                              child: const Icon(
                                                Icons.person,
                                                size: 18,
                                              ),
                                            ),
                                            title: Text(
                                              '${e.firstName} ${e.lastName}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            subtitle: Text(
                                              'ADULT | DOB:  ${e.dateOfBirth != null ? AppHelpers.formatDate(e.dateOfBirth!, pattern: 'dd MMM yyy') : 'N/A'} | Nationality: ${e.nationality}',
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        ...?widget
                                            .data.travellerDetails?.children!
                                            .map(
                                          (e) => ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: CircleAvatar(
                                              backgroundColor: AppColors.grey
                                                  .withOpacity(0.2),
                                              child: const Icon(
                                                Icons.person,
                                                size: 18,
                                              ),
                                            ),
                                            title: Text(
                                              '${e.firstName} ${e.lastName}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            subtitle: Text(
                                              'CHILD | DOB: ${e.dateOfBirth != null ? AppHelpers.formatDate(e.dateOfBirth!, pattern: 'dd MMM yyy') : 'N/A'} | Nationality: ${e.nationality}',
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        ...?widget
                                            .data.travellerDetails?.infants!
                                            .map(
                                          (e) => ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: CircleAvatar(
                                              backgroundColor: AppColors.grey
                                                  .withOpacity(0.2),
                                              child: const Icon(
                                                Icons.person,
                                                size: 18,
                                              ),
                                            ),
                                            title: Text(
                                              '${e.firstName} ${e.lastName}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            subtitle: Text(
                                              'INFANT | DOB: ${e.dateOfBirth != null ? AppHelpers.formatDate(e.dateOfBirth!, pattern: 'dd MMM yyy') : 'N/A'} | Nationality: ${e.nationality}',
                                              style: const TextStyle(
                                                  fontSize: 10,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: SizedBox(
                                        height: 73,
                                        child: SvgPicture.string(
                                          barCodeSvg,
                                          width: 200,
                                          height: 80,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
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
              // const LaungeAccessWidget(),
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
                    Fluttertoast.showToast(msg: 'Downloading...');
                    final bool res = await FileDownloaderService.saveFile(
                      baseFare:
                          '${(widget.data.fareDetails?.totalFare ?? 0.00) - (widget.data.fareDetails?.markup ?? 0.00)}',
                      totalFare: '${widget.data.fareDetails?.totalFare}',
                      markupPrice: '${widget.data.fareDetails?.markup ?? 0.00}',
                      bokkingRefId: '${widget.data.bookingReference}',
                      showDownloadProgress: (count, total) {},
                    );

                    if (res) {
                      Fluttertoast.showToast(msg: 'Downloaded successfully');
                    }
                  } catch (e) {
                    Fluttertoast.showToast(msg: '$e');
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

String getDuration({required String duration}) {
  //input PT6H35M
  duration = duration.replaceAll('PT', '');
  final String hr = duration.split('H')[0].trim();
  final String mn = duration.split('H')[1].split('M')[0].trim();

  return '${hr}H ${mn}M';
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

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
