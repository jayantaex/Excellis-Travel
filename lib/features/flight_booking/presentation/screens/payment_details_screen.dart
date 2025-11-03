import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../../flight_booking_module.dart';
import '../../models/flights_data_model.dart';

class PaymentDetailsScreen extends StatelessWidget {
  final Datam data;
  final String selectedPlan;
  PaymentDetailsScreen(
      {super.key, required this.data, required this.selectedPlan});
  final SearchData searchData = SearchData();
  int persion = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransWhiteBgWidget(
        child: Center(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                //nav Controller
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppCustomAppbar(
                      centerTitle: 'Payment Details',
                    )),

                const SizedBox(height: 16),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TicketWidget(
                              isCornerRounded: true,
                              width: AppHelpers.getScreenWidth(context),
                              height: persion <= 2
                                  ? AppHelpers.getScreenHeight(context) * 0.75
                                  : persion <= 4
                                      ? AppHelpers.getScreenHeight(context) *
                                          0.9
                                      : persion <= 6
                                          ? AppHelpers.getScreenHeight(
                                                  context) *
                                              1.1
                                          : AppHelpers.getScreenHeight(
                                                  context) *
                                              1.5,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            height: 60,
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
                                                0.2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    searchData
                                                        .ticketData[0].start!,
                                                    style: const TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                const Text(
                                                  'Jakarta',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.grey),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
                                                0.2,
                                            child: Column(
                                              children: [
                                                AppHelpers.svgAsset(
                                                    assetName: 'flight',
                                                    width: 80),
                                                Text(
                                                  getDuration(
                                                      min: searchData
                                                          .ticketData[0]
                                                          .duration!),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          height: 60,
                                          width: AppHelpers.getScreenWidth(
                                                  context) *
                                              0.2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  searchData.ticketData[0].end!,
                                                  style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w600)),
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
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
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
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
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
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
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
                                            width: AppHelpers.getScreenWidth(
                                                    context) *
                                                0.35,
                                            child: AppPrimaryInput(
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                                    ...[1, 2].map((e) => Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        child: const PassenderInfo())),
                                    const Spacer(),
                                    const BaggageInfo()
                                  ],
                                ),
                              ),
                            ),
                          ),
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
        height: 135,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppPrimaryButton(
              onPressed: () {
                context.pushNamed(FlightBookingModule.passDownloadName);
              },
              title: 'Pay Now',
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
              ),
            )
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
              'Cabin: 7Kg(1 bag only)/Adult',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
