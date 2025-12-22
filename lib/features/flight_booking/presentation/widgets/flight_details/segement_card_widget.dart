import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/airline_image_provider.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../../../utils/title_case.dart';
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
              toTitleCase(data.carrierCode != null
                  ? flightDictionary.dictionaries.carriers != null &&
                          flightDictionary.dictionaries.carriers!.isNotEmpty
                      ? flightDictionary
                              .dictionaries.carriers![data.carrierCode!] ??
                          ''
                      : ''
                  : ''),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.black),
            ),
            subtitle: Text(
              toTitleCase(
                  '${data.aircraft?.code != null ? (flightDictionary.dictionaries.aircraft?[data.aircraft!.code!] ?? '${data.aircraft?.code}') : ''} | '
                  '${data.co2Emissions?.isNotEmpty ?? false ? data.co2Emissions!.first.cabin ?? '' : ''}'),
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.black),
            ),
            collapsedIconColor: AppColors.grey,
            iconColor: AppColors.primary,
            children: <Widget>[
              //departure
              Column(
                children: <Widget>[
                  ListTile(
                    leading: AppHelpers.svgAsset(
                      assetName: 'from',
                      isIcon: true,
                      color: AppHelpers.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    title: Text(
                      '${data.departure?.iataCode} (T${data.departure?.terminal ?? '1'})',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppHelpers.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.black,
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
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppHelpers.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              //arriaval
              ListTile(
                leading: AppHelpers.svgAsset(
                  assetName: 'to',
                  isIcon: true,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.black,
                ),
                title: Text(
                  '${data.arrival?.iataCode} (T${data.arrival?.terminal ?? '1'})',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black,
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
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      );
}
