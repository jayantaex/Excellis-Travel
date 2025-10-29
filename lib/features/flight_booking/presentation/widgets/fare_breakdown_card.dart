import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class FareBreakdownCard extends StatelessWidget {
  FareBreakdownCard({super.key});

  final List<Map<String, dynamic>> fareData = [
    {
      'name': 'Base Fare',
      'price': 500.564562,
      'data': [
        {'name': 'Adult', 'count': 1, 'price': 500.52}
      ],
    },
    {
      'name': 'Taxes & Fees',
      'price': 30.00,
      'data': [
        {'name': 'Airline Taxes and Fees', 'price': 30.00}
      ]
    },
    {
      'name': 'Other Charges',
      'price': 530.00,
      'data': [
        {'name': 'Insurance', 'price': 530.00}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ...fareData.map(
            (e) => ItemCard(data: e),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: Text(
              '${fareData.map((e) => e['price']).reduce((a, b) => a + b).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map data;
  const ItemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppHelpers.getScreenWidth(context),
      height: 60,
      child: Column(
        children: [
          SizedBox(
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  height: 25,
                  child: Text(
                    data['name'],
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Text(
                    data['price'].toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          ...data['data'].map((e) {
            return Container(
              padding: const EdgeInsets.only(left: 8),
              width: AppHelpers.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 25,
                    child: Text(
                      e['name'],
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Text(
                      e['price'].toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
