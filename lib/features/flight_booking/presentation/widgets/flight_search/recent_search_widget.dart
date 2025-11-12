import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/services/local_db.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../flight_booking_module.dart';
import '../../../models/flights_data_model.dart';
import '../../../models/hive/flight_hive_data_model.dart';
import '../flight_card_widget.dart';

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({super.key});

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  List<FlightHiveDataModel> recentSearches = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Box<FlightHiveDataModel> flightBox = await LocalDB().getFlightBox();
      recentSearches.addAll(flightBox.values);
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        recentSearches.isEmpty
            ? SizedBox(
                height: 160,
                width: AppHelpers.getScreenWidth(context),
                child: Center(
                  child: Text(
                    "It seems you haven't searched for any flight yet \n Start searching now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 20,
                width: AppHelpers.getScreenWidth(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                height: 250,
                width: AppHelpers.getScreenWidth(context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentSearches.length,
                  itemBuilder: (context, index) {
                    String strData = jsonEncode(recentSearches[index].data);
                    Map<String, dynamic> data = jsonDecode(strData);
                    Datam datam = Datam.fromJson(data);
                    FlightDictionary flightDictionary =
                        FlightDictionary.fromJson(
                            recentSearches[index].dictionaries);
                    return Container(
                      margin: const EdgeInsets.only(right: 11),
                      child: FlightCardWidget(
                          data: datam,
                          dictionaries: flightDictionary,
                          onTap: () {
                            context.pushNamed(
                              FlightBookingModule.flightDetailsName,
                              extra: {
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
}
