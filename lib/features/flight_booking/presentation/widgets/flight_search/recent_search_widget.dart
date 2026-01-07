import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/services/local_db.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../flight_booking_module.dart';
import '../../../data/models/flights_data_model.dart';
import '../../../data/models/hive/flight_hive_data_model.dart';
import '../flight_card_widget.dart';

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({super.key});

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  List<FlightHiveDataModel> recentSearches = <FlightHiveDataModel>[];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      final Box<FlightHiveDataModel> flightBox = await LocalDB().getFlightBox();
      recentSearches.addAll(flightBox.values);
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(height: 16),
          recentSearches.isEmpty
              ? SizedBox(
                  height: 120,
                  width: AppHelpers.getScreenWidth(context),
                  child: Center(
                    child: Text(
                      "It seems you haven't searched for any flight yet \n Start searching now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppHelpers.isDarkMode(context)
                            ? AppColors.white.withValues(alpha: 0.5)
                            : AppColors.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 20,
                  width: AppHelpers.getScreenWidth(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent Search',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 16),
          recentSearches.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: 220,
                  width: AppHelpers.getScreenWidth(context),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recentSearches.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String strData =
                          jsonEncode(recentSearches[index].data);
                      final Map<String, dynamic> data = jsonDecode(strData);
                      final FlightOfferDatam datam =
                          FlightOfferDatam.fromJson(data);
                      final FlightDictionary flightDictionary =
                          FlightDictionary.fromJson(
                              recentSearches[index].dictionaries);
                      return Container(
                        margin: const EdgeInsets.only(right: 11),
                        child: FlightCardWidget(
                            hasFinalPrice: false,
                            customWidth:
                                AppHelpers.getScreenWidth(context) * 0.9,
                            data: datam,
                            dictionaries: flightDictionary,
                            onTap: () {
                              context.pushNamed(
                                FlightBookingModule.flightDetailsName,
                                extra: <String, Object>{
                                  'data': datam,
                                  'flightDictionary': flightDictionary
                                },
                              );
                            }),
                      );
                    },
                  ),
                ),
          const SizedBox(height: 50),
        ],
      );
}
