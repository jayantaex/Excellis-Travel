import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flight_offer_price_model.dart';
import 'fare_type_widget.dart';

class FaresAndPrices extends StatefulWidget {
  const FaresAndPrices(
      {super.key, required this.allTravelerPricings, required this.grandPrice});
  final List<TravelerPricing> allTravelerPricings;
  final double grandPrice;

  @override
  State<FaresAndPrices> createState() => _FaresAndPricesState();
}

class _FaresAndPricesState extends State<FaresAndPrices> {
  final List<String> userType = <String>['ADULT', 'CHILD', 'INFANT'];
  String selectedTab = 'ADULT';
  List<TravelerPricing> filteredTravelerPricings = <TravelerPricing>[];
  @override
  @override
  void initState() {
    super.initState();
    filter(selectedTab);
  }

  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);

    return ExpansionTile(
        shape: const Border(),
        iconColor: AppColors.primary,
        collapsedIconColor: AppColors.grey,
        title: const Text(
          'Fares and prices',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    width: 1,
                    color: AppColors.grey.withOpacity(0.2),
                  ),
                ),
                width: AppHelpers.getScreenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ...userType.map(
                      (String e) => InkWell(
                        onTap: () {
                          filter(e);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 40,
                          width: width / userType.length - 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedTab == e ? AppColors.black : null,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedTab == e
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 10,
                              fontWeight: selectedTab == e
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              filteredTravelerPricings.isEmpty
                  ? SizedBox(
                      height: width,
                      child: const Center(
                        child: Text(
                          'No fare found for this traveller type',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        ...filteredTravelerPricings.map(
                          (TravelerPricing e) => FareCard(data: e),
                        )
                      ],
                    )
            ],
          )
        ]);
  }

  void filter(travellerType) {
    filteredTravelerPricings.clear();
    for (TravelerPricing element in widget.allTravelerPricings) {
      if (element.travelerType == travellerType) {
        filteredTravelerPricings.add(element);
      }
    }
    selectedTab = travellerType;
    setState(() {});
  }
}
