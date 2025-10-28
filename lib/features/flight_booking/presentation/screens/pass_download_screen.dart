import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/services/barcode_service.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../widgets/launge_access_widget.dart';

class PassDownloadScreen extends StatefulWidget {
  const PassDownloadScreen({super.key});

  @override
  State<PassDownloadScreen> createState() => _PassDownloadScreenState();
}

class _PassDownloadScreenState extends State<PassDownloadScreen> {
  final SearchData searchData = SearchData();
  String barCodeSvg = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      barCodeSvg = BarcodeService.buildBarcode(
        Barcode.code39(),
        'CODE 39',
        width: 300,
        height: 80,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18),
            topEnd: Radius.circular(18),
          ),
        ),
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
                        centerTitle: 'E-Boarding Pass',
                      )),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TicketWidget(
                      isCornerRounded: true,
                      width: AppHelpers.getScreenWidth(context),
                      height: AppHelpers.getScreenHeight(context) * 0.45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25),
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
                                  searchData.ticketData[0].tag != null
                                      ? Text(
                                          'GA752319084'.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(searchData.ticketData[0].start!,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600)),
                                        const Text(
                                          'Jakarta',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.2,
                                    child: Column(
                                      children: [
                                        AppHelpers.svgAsset(
                                            assetName: 'flight',
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
                                                0.2),
                                        Text(
                                          getDuration(
                                              min: searchData
                                                  .ticketData[0].duration!),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 60,
                                  width:
                                      AppHelpers.getScreenWidth(context) * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(searchData.ticketData[0].end!,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                      const Text(
                                        'Tokyo',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: AppHelpers.getScreenWidth(context),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.35,
                                    child: AppPrimaryInput(
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enable: false,
                                      label: 'Seat Class',
                                      maxCharacters: 10,
                                      controller: TextEditingController(
                                          text: 'Business Class'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.35,
                                    child: AppPrimaryInput(
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enable: false,
                                      label: 'Boarding Time',
                                      maxCharacters: 10,
                                      controller: TextEditingController(
                                          text: 'Jun 07, 23:45'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: AppHelpers.getScreenWidth(context),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.35,
                                    child: AppPrimaryInput(
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enable: false,
                                      label: 'Departure',
                                      maxCharacters: 10,
                                      controller: TextEditingController(
                                          text: 'Jun 08, 00:30'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.35,
                                    child: AppPrimaryInput(
                                      enable: false,
                                      label: 'Arrival',
                                      maxCharacters: 10,
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      controller: TextEditingController(
                                          text: 'Jun 08, 07:40'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 73,
                              child: SvgPicture.string(
                                barCodeSvg,
                                width: 300,
                                height: 80,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
            const Spacer(),
            const AppPrimaryButton(
              title: 'Download Pass',
              isLoading: false,
              bgColor: AppColors.primary,
            ),
            const SizedBox(height: 8),
            TextButton(
                onPressed: () {},
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
    );
  }
}

getDuration({required int min}) {
  String hours = (min / 60).floor().toString();
  String minutes = (min % 60).toString();
  return '${hours}h ${minutes}m';
}
