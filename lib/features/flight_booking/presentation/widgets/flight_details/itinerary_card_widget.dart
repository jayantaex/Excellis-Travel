import 'package:dotted_border/dotted_border.dart';
import 'package:excellistravel/utils/title_case.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../../../utils/get_duration.dart';
import '../../../data/models/flight_offer_price_model.dart';
import '../../../data/models/flights_data_model.dart' show FlightDictionary;
import 'segement_card_widget.dart';

class ItineraryCard extends StatelessWidget {
  const ItineraryCard(
      {super.key,
      required this.width,
      required this.data,
      required this.flightDictionary,
      this.isSegmentRequired = true,
      required this.arrivalCity,
      required this.arrivalAirport,
      required this.departureCity,
      required this.departureAirport,
      required this.index});
  final Itinerary data;
  final FlightDictionary flightDictionary;
  final bool? isSegmentRequired;
  final String arrivalCity;
  final String arrivalAirport;
  final String departureCity;
  final String departureAirport;
  final int index;

  final double width;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          AppHelpers.formatDateTime(
                              DateTime.parse(
                                  data.segments?.first.departure?.at ?? ''),
                              pattern: 'hh:mm'),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                      Text(
                        AppHelpers.formatDateTime(
                          DateTime.parse(
                              data.segments?.first.departure?.at ?? ''),
                          pattern: 'dd MMM, yyyy',
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${data.segments?.first.departure?.iataCode} (T${data.segments?.first.departure?.terminal ?? '1'})',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Text(
                        toTitleCase(index > 0 ? arrivalCity : departureCity),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Text(
                        toTitleCase(
                            index > 0 ? arrivalAirport : departureAirport),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: width * 0.25,
                    child: Column(
                      children: <Widget>[
                        AppHelpers.svgAsset(assetName: 'flight', width: 100),
                        Column(
                          children: <Widget>[
                            Text(
                              formatIsoDuration(
                                  data.segments?.first.duration ?? ''),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: AppColors.primary.withValues(alpha: 0.3),
                            ),
                            Text(
                              data.segments?.length == 1
                                  ? 'Non-Stop'
                                  : '${(data.segments!.length - 1)} Stop(s)',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                          AppHelpers.formatDateTime(
                              DateTime.parse(
                                  data.segments?.last.arrival?.at.toString() ??
                                      ''),
                              pattern: 'hh:mm'),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                      Text(
                        AppHelpers.formatDateTime(
                            DateTime.parse(
                                data.segments?.last.arrival?.at.toString() ??
                                    ''),
                            pattern: 'dd MMM, yyyy'),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Text(
                        '${data.segments?.last.arrival?.iataCode} (T${data.segments?.last.arrival?.terminal ?? '1'})',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        toTitleCase(index > 0 ? departureCity : arrivalCity),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Text(
                        toTitleCase(
                            index > 0 ? departureAirport : arrivalAirport),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          DottedBorder(
            options: CustomPathDottedBorderOptions(
              customPath: (Size size) => Path()
                ..moveTo(0, size.height)
                ..relativeLineTo(size.width, 0),
              dashPattern: <double>[5, 5],
              color: AppColors.grey.withValues(alpha: 0.5),
            ),
            child: Column(
              children: isSegmentRequired ?? true
                  ? <Widget>[
                      ...data.segments!.map(
                        (Segment e) => SegmentCard(
                          flightDictionary: flightDictionary,
                          data: e,
                        ),
                      )
                    ]
                  : <Widget>[
                      SizedBox(
                        height: 2,
                        width: AppHelpers.getScreenWidth(context),
                      )
                    ],
            ),
          ),
        ],
      );
}
