import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flight_offer_price_model.dart';

Future<void> showPriceDetailsSheet(
    {required BuildContext context,
    required FlightOffer flightOffer,
    required MyMarkup myMarkup}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (BuildContext context) => PriceDetailsSheet(
      flightOffer: flightOffer,
      myMarkup: myMarkup,
    ),
  );
}

class PriceDetailsSheet extends StatelessWidget {
  PriceDetailsSheet(
      {super.key, required this.flightOffer, required this.myMarkup});
  final FlightOffer flightOffer;
  final MyMarkup myMarkup;

  final List<String> adult = <String>[];
  final List<String> child = <String>[];
  final List<String> infant = <String>[];

  @override
  Widget build(BuildContext context) {
    for (TravelerPricing element in flightOffer.travelerPricings!) {
      switch (element.travelerType) {
        case 'ADULT':
          {
            adult.add(element.price!.total!);
          }

          break;
        case 'CHILD':
          {
            child.add(element.price!.total!);
          }
          break;
        case 'INFANT':
          {
            infant.add(element.price!.total!);
          }
        default:
      }
    }
    return SizedBox(
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(height: 25, width: 20),
                const Text(
                  'Price details',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Total Travelers: ${adult.length + child.length + infant.length} person(s)'),
                adult.isEmpty
                    ? const SizedBox()
                    : PriceCol(
                        isIconRequired: false,
                        titile: 'ADULT',
                        value: '${adult.length}P'),
                const SizedBox(height: 6),
                child.isEmpty
                    ? const SizedBox()
                    : PriceCol(
                        isIconRequired: false,
                        titile: 'CHILD',
                        value: '${adult.length}P'),
                infant.isEmpty
                    ? const SizedBox()
                    : PriceCol(
                        isIconRequired: false,
                        titile: 'INFANT',
                        value: '${adult.length}(INFANT)P'),
                SizedBox(height: 8),
                PriceCol(titile: 'Total', value: flightOffer.price!.markup!),
                PriceCol(
                    titile: 'platfrom fee',
                    value: (double.parse(getCalculatedPrice(
                                basePrice: flightOffer.price!.markup!,
                                type: myMarkup.type ?? 'Fixed',
                                value: myMarkup.value ?? '0')) -
                            double.parse(flightOffer.price!.markup!))
                        .toStringAsFixed(2)),
                const SizedBox(height: 6),
                const Divider(),
                const SizedBox(height: 12),
                PriceCol(
                  titile: 'Grand Total',
                  value: getCalculatedPrice(
                    basePrice: flightOffer.price!.markup!,
                    type: myMarkup.type ?? 'Fixed',
                    value: myMarkup.value ?? '0',
                  ),
                  isBold: true,
                  isIconRequired: true,
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
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
                style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isBold ?? false ? FontWeight.w600 : FontWeight.w400),
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
                    color: value == '0.00' ? AppColors.success : Colors.black),
              ),
            )
          ],
        ),
      );
}

String getCalculatedPrice(
    {required String basePrice, required String type, required String value}) {
  double price = double.parse(basePrice);

  if (type == 'Fixed') {
    final double amount = double.parse(value);
    price += amount;
  }
  final amount = (price * double.parse(value)) / 100;
  price += amount;

  return price.toStringAsFixed(2);
}
