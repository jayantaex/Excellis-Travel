import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../../flight_booking_module.dart';
import '../widgets/booking_policy_card.dart';
import '../widgets/passenger_details_card.dart';

class PassengetDetailsNew extends StatefulWidget {
  const PassengetDetailsNew({super.key});

  @override
  State<PassengetDetailsNew> createState() => _PassengetDetailsNewState();
}

class _PassengetDetailsNewState extends State<PassengetDetailsNew> {
  final SearchData _searchData = SearchData();

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);

    final data = _searchData.ticketData[0];
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppCustomAppbar(
                    start: 'CCU',
                    end: 'HDO',
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DottedBorder(
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              leading: AppHelpers.assetImage(
                                  assetName: 'indigo', ext: 'png'),
                              title: const Text(
                                'Indigo',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              subtitle: const Text(
                                '6E2119 | Airbus A321-200',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey),
                              ),
                              trailing: const Text(
                                'Economy | Eco value',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          DottedBorder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        const Text('06.15',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          AppHelpers.formatDateTime(
                                              DateTime.now(),
                                              pattern: 'dd MMM, yyyy'),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey),
                                        ),
                                        const Text(
                                          'Kolkata (CCU)',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                    width: width * 0.25,
                                    child: Column(
                                      children: [
                                        AppHelpers.svgAsset(
                                            assetName: 'flight', width: 100),
                                        Text(
                                          getDuration(min: data.duration!),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
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
                                      const Text('09.40',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                        AppHelpers.formatDateTime(
                                            DateTime.now(),
                                            pattern: 'dd MMM, yyyy'),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                      const Text(
                                        'Delhi (DEL)',
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
                          ),
                          ListTile(
                            leading: AppHelpers.svgAsset(
                                assetName: 'from', isIcon: true),
                            title: const Text(
                              'Apparture Airport',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: const Text(
                              'Netaji Subhash Chandra Bose International Airport (CCU)',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                          ),
                          ListTile(
                            leading: AppHelpers.svgAsset(
                                assetName: 'to', isIcon: true),
                            title: const Text(
                              'Departure Airport',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: const Text(
                              'Indira Gandhi International Airport (DEL)',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Passenger Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: PassengerDetailsCard(),
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Baggage Allowance Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: BookingPolicyCard(),
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
          children: [
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.4,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹${data.price}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  const Text(
                    'Total Price',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.4,
              height: 45,
              child: AppPrimaryButton(
                  onPressed: () {
                    context.pushNamed(FlightBookingModule.seatSelectionName);
                  },
                  bgColor: AppColors.primary,
                  style: const TextStyle(fontSize: 14, color: AppColors.white),
                  title: 'Continue',
                  isLoading: false),
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
