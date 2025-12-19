import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../data/models/flight_offer_price_model.dart';

class PricingDetails extends StatelessWidget {
  PricingDetails(
      {super.key,
      required this.flightOffer,
      this.myMarkup,
      required this.offerFareEnabled});
  final FlightOffer flightOffer;
  final MyMarkup? myMarkup;
  final bool offerFareEnabled;
  final List<String> adult = <String>[];
  final List<String> child = <String>[];
  final List<String> infant = <String>[];

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    for (TravelerPricing element in flightOffer.travelerPricings!) {
      log('${element.travelerType}----------');
      switch (element.travelerType) {
        case 'ADULT':
          {
            adult.add(element.travelerId ?? '');
          }

          break;
        case 'CHILD':
          {
            child.add(element.travelerId ?? '');
          }
          break;
        case 'HELD_INFANT':
          {
            infant.add(element.travelerId ?? '');
          }
        default:
      }
    }
    return SizedBox(
      width: AppHelpers.getScreenWidth(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.white.withValues(alpha: 0.05)
              : AppColors.grey.withValues(alpha: 0.05),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Total Travelers: ${adult.length + child.length + infant.length} person(s)',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            isDark ? AppColors.white : AppColors.textPrimary),
                  ),
                  const SizedBox(height: 12),
                  adult.isEmpty
                      ? const SizedBox()
                      : PriceCol(
                          isIconRequired: false,
                          titile: 'ADULT',
                          value: '${adult.length} Person(s)'),
                  const SizedBox(height: 6),
                  child.isEmpty
                      ? const SizedBox()
                      : PriceCol(
                          isIconRequired: false,
                          titile: 'CHILD',
                          value: '${child.length} Person(s)'),
                  infant.isEmpty
                      ? const SizedBox()
                      : PriceCol(
                          isIconRequired: false,
                          titile: 'INFANT',
                          value: '${infant.length} Person(s)'),
                  const SizedBox(height: 8),
                  PriceCol(titile: 'Total', value: flightOffer.price!.markup!),
                  if (myMarkup != null)
                    PriceCol(
                        titile: 'Taxes, Surcharges & Fees',
                        value: offerFareEnabled
                            ? '0.00'
                            : (double.parse(getCalculatedPrice(
                                        basePrice: flightOffer.price!.markup!,
                                        type: myMarkup?.fareType ?? 'Fixed',
                                        value: myMarkup?.value ?? '0')) -
                                    double.parse(flightOffer.price!.markup!))
                                .toStringAsFixed(2)),
                  const SizedBox(height: 6),
                  const Divider(),
                  const SizedBox(height: 12),
                  PriceCol(
                    titile: 'Grand Total',
                    value: offerFareEnabled
                        ? flightOffer.price!.markup!
                        : getCalculatedPrice(
                            basePrice: flightOffer.price!.markup!,
                            type: myMarkup?.fareType ?? 'Fixed',
                            value: myMarkup?.value ?? '0',
                          ),
                    isBold: true,
                    isIconRequired: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PriceCol extends StatelessWidget {
  const PriceCol(
      {super.key,
      required this.titile,
      required this.value,
      this.isBold,
      this.isIconRequired});
  final String titile;
  final String value;
  final bool? isBold;
  final bool? isIconRequired;

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.only(left: 8),
      width: AppHelpers.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 25,
            child: Text(
              titile,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      isBold ?? false ? FontWeight.w600 : FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.black),
            ),
          ),
          SizedBox(
            height: 25,
            child: Text(
              value == ''
                  ? ''
                  : value == '0.00'
                      ? 'Free'
                      : isIconRequired ?? true
                          ? '₹ $value'
                          : ' $value',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      isBold ?? false ? FontWeight.w600 : FontWeight.w400,
                  color: value == '0.00'
                      ? AppColors.success
                      : (isDark ? AppColors.white : Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}

String getCalculatedPrice(
    {required String basePrice, required String type, required String value}) {
  double price = double.parse(basePrice);
  if (type == 'Fixed') {
    final double amount = double.parse(value);
    price += amount;
    return price.toStringAsFixed(2);
  }
  final amount = (price * double.parse(value)) / 100;
  price += amount;
  return price.toStringAsFixed(2);
}
