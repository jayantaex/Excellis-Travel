import 'package:excellistravel/features/bottom_navigation/bottom_nav_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/flight_bloc.dart';
import '../../flight_booking_module.dart';
import '../../models/flights_data_model.dart';
import '../widgets/fare_type_widget.dart';
import '../widgets/itinerary_card_widget.dart';

class FlightDetailsScreen extends StatefulWidget {
  final Datam data;
  final FlightDictionary flightDictionary;
  const FlightDetailsScreen({
    super.key,
    required this.data,
    required this.flightDictionary,
  });

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  String seletedTab = 'ECONOMY';
  List<FareDetailsBySegment> filteredSegment = [];
  List<String> classList = [
    'ECONOMY',
    'BUSINESS CLASS',
    'FIRST CLASS',
  ];

  @override
  void initState() {
    filteredSegment = filterSegment(
      cabin: seletedTab,
      fullList: widget.data.travelerPricings!.first.fareDetailsBySegment!,
    );
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);
    final state = context.watch<FlightBloc>().state;
    if (state is FlightLoaded) {
      //call the api to get the flight offer price
    }
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppCustomAppbar(
                    centerTitle: 'Flight Details & Fares',
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          ...widget.data.itineraries!.map(
                            (e) => ItineraryCard(
                              width: width,
                              flightDictionary: widget.flightDictionary,
                              data: e,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Container(
                          //   margin: const EdgeInsets.symmetric(
                          //       horizontal: 16, vertical: 8),
                          //   height: 45,
                          //   decoration: BoxDecoration(
                          //     color: AppColors.background,
                          //     borderRadius: BorderRadius.circular(32),
                          //     border: Border.all(
                          //       width: 1,
                          //       color: AppColors.grey.withOpacity(0.2),
                          //     ),
                          //   ),
                          //   width: AppHelpers.getScreenWidth(context),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       ...widget.data.travelerPricings!.map(
                          //         (e) => InkWell(
                          //           onTap: () {},
                          //           child: Container(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 12),
                          //             height: 40,
                          //             width: width / classList.length - 20,
                          //             alignment: Alignment.center,
                          //             decoration: BoxDecoration(
                          //               color: seletedTab == e.travelerType
                          //                   ? AppColors.black
                          //                   : null,
                          //               borderRadius: BorderRadius.circular(32),
                          //             ),
                          //             child: Text(
                          //               e.travelerType ?? '',
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(
                          //                 color: seletedTab == e.travelerType
                          //                     ? AppColors.white
                          //                     : AppColors.black,
                          //                 fontSize: 10,
                          //                 fontWeight:
                          //                     seletedTab == e.travelerType
                          //                         ? FontWeight.w600
                          //                         : FontWeight.w400,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          ...filteredSegment.map(
                            (FareDetailsBySegment? e) => FareTypeCard(
                              data: e!,
                            ),
                          ),
                          filteredSegment.isEmpty
                              ? const SizedBox(
                                  height: 250,
                                  child: Center(
                                    child: Text(
                                      'No segement found for this cabin class',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
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
        height: 85,
        color: AppColors.white,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      '₹${widget.data.price!.grandTotal!}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const Text('Grand Price',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ))
                  ],
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.info_outline_rounded,
                  size: 18,
                  color: AppColors.grey,
                )
              ],
            ),
            SizedBox(
              height: 45,
              width: AppHelpers.getScreenWidth(context) * 0.25,
              child: AppPrimaryButton(
                  onPressed: () {
                    context.pushNamed(
                      FlightBookingModule.passengerDetailsNewName,
                      extra: {
                        'data': widget.data, 'selectedPlan': 'ECO VALUE',

                        'flightDictionary':
                            widget.flightDictionary, //passing data
                      },
                    );
                  },
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  title: 'Book now',
                  isLoading: false),
            ),
          ],
        ),
      ),
    );
  }
}

// getDuration({required String duration}) {
//   //input PT6H35M
//   duration = duration.replaceAll('PT', '');
//   String hr = duration.split('H')[0].trim();
//   String mn = duration.split('H')[1].split('M')[0].trim();

//   return '${hr}H ${mn}M';
// }

List<FareDetailsBySegment> filterSegment(
    {required List<FareDetailsBySegment> fullList, required String cabin}) {
  List<FareDetailsBySegment> result = [];

  for (var element in fullList) {
    if (element.cabin == cabin) {
      result.add(element);
    }
  }

  return result;
}
