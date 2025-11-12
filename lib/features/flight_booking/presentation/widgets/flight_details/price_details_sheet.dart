import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flight_offer_price_model.dart';

Future<void> showPriceDetailsSheet(
    {required BuildContext context, required FlightOffer flightOffer}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) => PriceDetailsSheet(
      flightOffer: flightOffer,
    ),
  );
}

class PriceDetailsSheet extends StatelessWidget {
  final FlightOffer flightOffer;
  PriceDetailsSheet({super.key, required this.flightOffer});

  final List<String> adult = [];
  final List<String> child = [];
  final List<String> infant = [];

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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'Total Travelers: ${adult.length + child.length + infant.length} person(s)'),
                adult.isEmpty
                    ? const SizedBox()
                    : PriceCol(
                        isIconRequired: false,
                        titile: '',
                        value: '${adult.length}(ADULT) x ${adult[0]}'),
                const SizedBox(height: 6),
                child.isEmpty
                    ? const SizedBox()
                    : PriceCol(
                        isIconRequired: false,
                        titile: '',
                        value: '${adult.length}(CHILD) x ${child[0]}'),
                infant.isEmpty
                    ? const SizedBox()
                    : PriceCol(
                        isIconRequired: false,
                        titile: '',
                        value: '${adult.length}(INFANT) x ${infant[0]}'),
                PriceCol(
                    titile: 'Total', value: flightOffer.price!.grandTotal!),
                PriceCol(
                    titile: 'platfrom fee',
                    value: (double.parse(flightOffer.price!.markup!) -
                            double.parse(flightOffer.price!.grandTotal!))
                        .toStringAsFixed(2)),
                const SizedBox(height: 6),
                const Divider(),
                const SizedBox(height: 12),
                PriceCol(
                  titile: 'Grand Total',
                  value: flightOffer.price!.markup!,
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
  final String titile;
  final String value;
  final bool? isBold;
  final bool? isIconRequired;
  const PriceCol(
      {super.key,
      required this.titile,
      required this.value,
      this.isBold,
      this.isIconRequired});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      width: AppHelpers.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
}
