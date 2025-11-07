import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flights_data_model.dart';
import 'recent_search_card.dart';

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({super.key});

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  List<FlightsDataModel> recentSearches = [];
  @override
  void initState() {
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
                        color: AppColors.black,
                      ),
                    ),
                    InkWell(
                        child: Text(
                      'Show more',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
                  ],
                ),
              ),
        const SizedBox(height: 16),
        recentSearches.isEmpty
            ? const SizedBox()
            : SizedBox(
                height: 200,
                width: AppHelpers.getScreenWidth(context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: RecentSearchCard(
                        flightsData: FlightsDataModel(),
                      ),
                    );
                  },
                ),
              ),
        const SizedBox(height: 50),
      ],
    );
  }
}
