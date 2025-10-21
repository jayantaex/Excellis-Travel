import 'package:flutter/material.dart';
import 'package:reiselab/core/widgets/primary_input.dart';
import 'package:reiselab/features/flight_booking/models/ticket_data_model.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../widgets/nav_bar.dart';

class PaymentDetailsScreen extends StatelessWidget {
  PaymentDetailsScreen({super.key});
  SearchData searchData = SearchData();

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Navbar(
                      onBcakClicked: () {
                        Navigator.pop(context);
                      },
                      onMoreClicked: () {},
                      centerTitle: 'Payment Details',
                      trailing: CircleAvatar(
                        backgroundColor: AppColors.black.withOpacity(0.1),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share_rounded,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TicketWidget(
                      isCornerRounded: true,
                      width: AppHelpers.getScreenWidth(context),
                      height: AppHelpers.getScreenHeight(context) * 0.65,
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
                                    width: 100,
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
                                    width: 100,
                                    child: Column(
                                      children: [
                                        AppHelpers.svgAsset(
                                            assetName: 'flight', width: 100),
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
                                  width: 100,
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
                                        0.38,
                                    child: AppPrimaryInput(
                                      enable: false,
                                      label: 'Seat Class',
                                      maxCharacters: 10,
                                      controller: TextEditingController(
                                          text: 'Business Class'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.38,
                                    child: AppPrimaryInput(
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
                                        0.38,
                                    child: AppPrimaryInput(
                                      enable: false,
                                      label: 'Departure',
                                      maxCharacters: 10,
                                      controller: TextEditingController(
                                          text: 'Jun 08, 00:30'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.38,
                                    child: AppPrimaryInput(
                                      enable: false,
                                      label: 'Arrival',
                                      maxCharacters: 10,
                                      controller: TextEditingController(
                                          text: 'Jun 08, 07:40'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            const PassenderInfo(),
                            const SizedBox(height: 12),
                            const PassenderInfo(),
                            const Spacer(),
                            const BaggageInfo(),
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
      ),
      bottomNavigationBar: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const AppPrimaryButton(
              title: 'Pay Now',
              isLoading: false,
              bgColor: AppColors.primary,
            ),
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

class PassenderInfo extends StatelessWidget {
  const PassenderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.grey.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.grey.withOpacity(0.2),
          child: const Icon(
            Icons.person,
            size: 18,
          ),
        ),
        title: const Text(
          'Bidisha Roy',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: Row(
          children: [
            AppHelpers.svgAsset(
                assetName: 'idIcon', width: 16, height: 16, isIcon: true),
            const SizedBox(width: 8),
            const Text(
              'ID2845655258',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Seat',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
            Text(
              'A06',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}

class BaggageInfo extends StatelessWidget {
  const BaggageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.grey.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.grey.withOpacity(0.2),
          child: AppHelpers.svgAsset(
              assetName: 'baggage', width: 25, height: 25, isIcon: true),
        ),
        title: const Text(
          'Baggage Allowance',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Cabin: 7Kgs (1 Piece only)/ adult',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 8),
            Text(
              'Cabin: 7Kgs (1 Piece only)/ adult',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.check_circle_outline_rounded,
          size: 18,
        ),
      ),
    );
  }
}
