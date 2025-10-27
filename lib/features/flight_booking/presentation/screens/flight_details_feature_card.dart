import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class FlightDetailsFeatureCard extends StatelessWidget {
  FlightDetailsFeatureCard({super.key});

  final List<Map> _listOfFeatures = [
    {
      'title': 'Cabin Baggage',
      'subtitle': '7Kg(1 bag only)/Adult',
      'icon': 'baggage'
    },
    {'title': 'Check-in Baggage', 'subtitle': '15Kg/Adult', 'icon': 'baggage'},
    {'title': 'Seat', 'subtitle': 'Free seat available', 'icon': 'seat'},
    {'title': 'Meal', 'subtitle': 'Get Complementary Meals', 'icon': 'seat'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColors.grey.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          const ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            contentPadding: EdgeInsets.all(0),
            title: Text('Eco Value',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹ 1000.00',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'per person',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ..._listOfFeatures.map((feature) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.grey.withOpacity(0.1),
                  child: AppHelpers.svgAsset(
                      assetName: '${feature['icon']}',
                      isIcon: true,
                      height: 20,
                      width: 20)),
              title: Text(
                '${feature['title']}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                '${feature['subtitle']}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 45,
                    width: AppHelpers.getScreenWidth(context) * 0.3,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Lock In',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)))),
                SizedBox(
                    height: 45,
                    width: AppHelpers.getScreenWidth(context) * 0.3,
                    child: const AppPrimaryButton(
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        title: 'Book now',
                        isLoading: false))
              ],
            ),
          )
        ],
      ),
    );
  }
}
