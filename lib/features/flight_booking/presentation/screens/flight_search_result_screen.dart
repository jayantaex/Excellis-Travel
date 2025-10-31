import 'dart:developer';

import 'package:excellistravel/core/utils/app_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/flight_bloc.dart';
import '../../data/search_data.dart';
import '../../flight_booking_module.dart';
import '../widgets/class_filter_widget.dart';
import '../widgets/compact_flight_card.dart';
import '../widgets/date_filter_widget.dart';

class FlightSearchResultScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const FlightSearchResultScreen({super.key, required this.data});

  @override
  State<FlightSearchResultScreen> createState() =>
      _FlightSearchResultScreenState();
}

class _FlightSearchResultScreenState extends State<FlightSearchResultScreen> {
  List<DateTime> dates = [
    DateTime.now(),
  ];
  SearchData searchData = SearchData();
  List<String> filters = [
    'All',
    'Cheapest',
    'Discounted Price',
    'Non Stop First',
  ];
  int dateDuration = 20; //days
  String selectedFilter = 'All';
  int selectedIndex = 0;
  Map<String, dynamic>? body;

  String depurtureDate = '';
  String cabinClass = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Map<String, dynamic> paramData = widget.data;

      depurtureDate = paramData['depurtureDate'];
      cabinClass = paramData['cabinClass'];
      List<int> totalTravelers = [
        paramData['travellers']['adult'],
        paramData['travellers']['child'],
        paramData['travellers']['infant']
      ];
      Future.delayed(const Duration(microseconds: 100), () {
        body = getBody(
          depurture: paramData['depurture'],
          arrival: paramData['arrival'],
          depurtureDate: depurtureDate,
          returnDate: paramData['returnDate'],
          cabinClass: cabinClass,
          isRoundTrip: paramData['isRoundTrip'],
          travellersArr: totalTravelers,
        );
        context.read<FlightBloc>().add(SearchFlightsEvent(body: body!));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: Center(
            child: SafeArea(
              bottom: false,
              child: BlocBuilder<FlightBloc, FlightState>(
                builder: (context, state) {
                  if (state is FlightSearching) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FlightLoaded) {
                    return Column(
                      children: [
                        //nav Controller
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: AppCustomAppbar(
                              start: widget.data['depurture'],
                              end: widget.data['arrival'],
                            )),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: DateFilterWidget(
                            startDate: depurtureDate,
                            onDateSelected: (date) {
                              if (widget.data['isRoundTrip']) {
                                showToast(
                                    message:
                                        'Please select return date from the search page');
                                return;
                              }
                              body = getBody(
                                depurture: widget.data['depurture'],
                                arrival: widget.data['arrival'],
                                depurtureDate: AppHelpers.formatDate(date,
                                    pattern: 'yyyy-MM-dd'),
                                returnDate: widget.data['returnDate'],
                                cabinClass: cabinClass,
                                isRoundTrip: widget.data['isRoundTrip'],
                                travellersArr: [
                                  widget.data['travellers']['adult'],
                                  widget.data['travellers']['child'],
                                  widget.data['travellers']['infant']
                                ],
                              );
                              context
                                  .read<FlightBloc>()
                                  .add(SearchFlightsEvent(body: body!));
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ClassFilterWidget(
                            filters: filters,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.only(top: 16),
                          height: AppHelpers.getScreenHeight(context) * 0.69,
                          child: ListView.builder(
                            itemCount: state.data.datam?.length,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: CompactFlightCard(
                                onTap: () {
                                  context.pushNamed(
                                    FlightBookingModule.flightDetailsName,
                                    extra: state.data.datam![index],
                                  );
                                },
                                data: state.data.datam![index],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  if (state is FlightSearchingError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, dynamic> getBody({
  required String depurture,
  required String arrival,
  required String depurtureDate,
  String? returnDate,
  required String cabinClass,
  required bool isRoundTrip,
  required List<int> travellersArr,
}) {
  return {
    "currencyCode": "INR",
    "originDestinations": [
      {
        "id": "1",
        "originLocationCode": depurture,
        "destinationLocationCode": arrival,
        "departureDateTimeRange": {"date": depurtureDate}
      },
      if (isRoundTrip)
        {
          {
            "id": "2",
            "originLocationCode": arrival,
            "destinationLocationCode": depurture,
            "departureDateTimeRange": {
              "date": returnDate,
            }
          }
        }
    ],
    "travelers": getTravellers(travellersArr: travellersArr),
    "sources": ["GDS"],
    "searchCriteria": {
      "maxFlightOffers": kDebugMode ? 2 : 100,
      "flightFilters": {
        "cabinRestrictions": [
          {
            "cabin": cabinClass.toUpperCase(),
            "coverage": "MOST_SEGMENTS",
            "originDestinationIds": ["1"]
          }
        ],
        "carrierRestrictions": {
          "excludedCarrierCodes": ["AA", "TP", "AZ"]
        }
      }
    }
  };
}

List<Map<String, dynamic>> getTravellers({required List<int> travellersArr

    /// [adult, child, infant]
    }) {
  List<Map<String, dynamic>> listOfTravellers = [];
  int travellerId = 1;
  for (int i = 0; i < travellersArr.length; i++) {
    if (travellersArr[i] > 0) {
      for (int j = 0; j < travellersArr[i]; j++) {
        Map<String, dynamic> traveller = {
          "id": "$travellerId",
          "travelerType": i == 0
              ? "ADULT"
              : i == 1
                  ? "CHILD"
                  : "INFANT",
          "fareOptions": ["STANDARD"]
        };
        listOfTravellers.add(traveller);
        travellerId++;
      }
    }
  }

  return listOfTravellers;
}
