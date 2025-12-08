import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/airline_image_provider.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../data/models/flight_offer_price_model.dart';
import '../../../data/models/flights_data_model.dart' show FlightDictionary;

class SegmentCard extends StatelessWidget {
  const SegmentCard(
      {super.key, required this.data, required this.flightDictionary});
  final Segment data;
  final FlightDictionary flightDictionary;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ExpansionTile(
            shape: const Border(),
            leading: SizedBox(
              height: 45,
              width: 45,
              child: getAirlineLogo(airlineCode: data.carrierCode!),
              // child: Image.asset(
              //   'assets/images/airlines/${data.carrierCode}.png',
              //   fit: BoxFit.fill,
              // ),
            ),
            title: Text(
              data.carrierCode != null
                  ? flightDictionary.dictionaries.carriers != null &&
                          flightDictionary.dictionaries.carriers!.isNotEmpty
                      ? flightDictionary
                              .dictionaries.carriers![data.carrierCode!] ??
                          ''
                      : ''
                  : '',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '${data.aircraft?.code != null ? (flightDictionary.dictionaries.aircraft?[data.aircraft!.code!] ?? '') : ''} | '
              '${data.co2Emissions?.isNotEmpty ?? false ? data.co2Emissions!.first.cabin ?? '' : ''}',
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
            collapsedIconColor: AppColors.grey,
            iconColor: AppColors.primary,
            children: <Widget>[
              //departure
              Column(
                children: <Widget>[
                  ListTile(
                    leading:
                        AppHelpers.svgAsset(assetName: 'from', isIcon: true),
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
                    DateTime.parse(
                        data.arrival?.at ?? DateTime.now().toString()),
                    pattern: 'dd MMM, yyyy',
                  )} | ${AppHelpers.formatTime(
                    DateTime.parse(
                        data.arrival?.at ?? DateTime.now().toString()),
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

String getDuration({required String duration}) {
  //input PT6H35M
  duration = duration.replaceAll('PT', '');
  final String hr = duration.split('H')[0].trim();
  final String mn = duration.split('H')[1].split('M')[0].trim();
  return '${hr}H ${mn}M';
}

Color getColorByCabinClass({required String cabinClass}) {
  switch (cabinClass) {
    case 'PREMIUM_ECONOMY':
      return AppColors.info;
    case 'ECONOMY':
      return AppColors.success;
    case 'FIRST':
      return AppColors.primary;
    default:
      return AppColors.warning;
  }
}
