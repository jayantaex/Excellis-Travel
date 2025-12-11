import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../data/models/flight_offer_price_model.dart';

class FareBreakdownCard extends StatelessWidget {
  const FareBreakdownCard({super.key, this.data});
  final TravelerPricingPrice? data;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PriceCol(
              titile: 'Base Fare',
              value: double.parse(data!.base ?? '0.00').toStringAsFixed(2)),
          const PriceCol(titile: 'Fees', value: ''),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: <Widget>[
                ...data!.taxes!.map(
                  (Tax e) => PriceCol(
                    titile: e.code ?? '',
                    value: e.amount ?? '',
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
          PriceCol(
              titile: 'Toatal',
              value: double.parse(data!.total ?? '0.00').toStringAsFixed(2)),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              children: <InlineSpan>[
                const TextSpan(
                    text: 'Refundable Taxes: ',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
                TextSpan(
                    text:
                        ' ₹${double.parse(data!.refundableTaxes ?? '0.00').toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400))
              ],
            ),
          )
        ],
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
                value == ''
                    ? ''
                    : value == '0.00'
                        ? 'Free'
                        : '₹ $value',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: value == '0.00' ? AppColors.success : Colors.black),
              ),
            )
          ],
        ),
      );
}
