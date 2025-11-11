import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flight_offer_price_model.dart';
import '../../../models/flights_data_model.dart' show FlightDictionary;

class SegmentCard extends StatelessWidget {
  final Segment data;
  final FlightDictionary flightDictionary;

  const SegmentCard(
      {super.key, required this.data, required this.flightDictionary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          initiallyExpanded: false,
          shape: const Border(),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                'assets/images/airlines/${data.carrierCode}.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(
            flightDictionary.dictionaries.carriers!['${data.carrierCode}'] ??
                'NO-NAME',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            '${flightDictionary.dictionaries.aircraft![data.aircraft?.code ?? '']} | '
            '${data.number ?? ''}',
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
          ),
          collapsedIconColor: AppColors.grey,
          iconColor: AppColors.primary,
          children: [
            //departure
            Column(
              children: [
                ListTile(
                  leading: AppHelpers.svgAsset(assetName: 'from', isIcon: true),
                  title: Text(
                    '${data.departure?.iataCode} (T${data.departure?.terminal ?? '1'})',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    '${AppHelpers.formatDateTime(
                      DateTime.parse(
                          data.departure?.at ?? DateTime.now().toString()),
                      pattern: 'dd MMM, yyyy',
                    )} | ${AppHelpers.formatTime(
                      DateTime.parse(
                          data.departure?.at ?? DateTime.now().toString()),
                      pattern: 'hh:MM aa',
                    )}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            //arriaval
            ListTile(
              leading: AppHelpers.svgAsset(assetName: 'to', isIcon: true),
              title: Text(
                '${data.arrival?.iataCode}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '${AppHelpers.formatDateTime(
                  DateTime.parse(data.arrival?.at ?? DateTime.now().toString()),
                  pattern: 'dd MMM, yyyy',
                )} | ${AppHelpers.formatTime(
                  DateTime.parse(data.arrival?.at ?? DateTime.now().toString()),
                  pattern: 'hh:MM aa',
                )}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

getDuration({required String duration}) {
  //input PT6H35M
  duration = duration.replaceAll('PT', '');
  String hr = duration.split('H')[0].trim();
  String mn = duration.split('H')[1].split('M')[0].trim();

  return '${hr}H ${mn}M';
}
