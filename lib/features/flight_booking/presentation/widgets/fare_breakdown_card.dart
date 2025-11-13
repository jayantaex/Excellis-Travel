import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../models/flights_data_model.dart';

class FareBreakdownCard extends StatelessWidget {
  const FareBreakdownCard({super.key, this.data});
  final DatamPrice? data;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            PriceCol(titile: 'Base Fare', value: '${data!.base ?? 0.00}'),
            const PriceCol(titile: 'Fees', value: ''),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: <Widget>[
                  ...data!.fees!.map((Fee e) => PriceCol(
                        titile: e.type ?? '',
                        value: e.amount ?? '',
                      )),
                ],
              ),
            ),
            PriceCol(titile: 'Total', value: '${data!.total ?? 0.00}'),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Grand Total',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                '${data!.grandTotal ?? 0.00}',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      );
}

class PriceCol extends StatelessWidget {
  const PriceCol({super.key, required this.titile, required this.value});
  final String titile;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 8),
        width: AppHelpers.getScreenWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 25,
              child: Text(
                titile,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 25,
              child: Text(
                value,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      );
}
