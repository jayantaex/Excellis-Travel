import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flight_offer_price_model.dart';
import '../../../models/flights_data_model.dart' show FlightDictionary;
import 'segement_card_widget.dart';

class ItineraryCard extends StatelessWidget {
  const ItineraryCard(
      {super.key,
      required this.width,
      required this.data,
      required this.flightDictionary,
      this.isSegmentRequired = true});
  final Itinerary data;
  final FlightDictionary flightDictionary;
  final bool? isSegmentRequired;

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
                height: 90,
                width: width * 0.25,
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
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '${data.segments?.first.departure?.iataCode} (T${data.segments?.first.departure?.terminal ?? '1'})',
                      style: const TextStyle(
                          fontSize: 12,
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
                            getDuration(
                                duration: data.segments?.first.duration ?? ''),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: AppColors.primary.withOpacity(0.3),
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
                height: 90,
                width: width * 0.25,
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
                      AppHelpers.formatDateTime(DateTime.now(),
                          pattern: 'dd MMM, yyyy'),
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey),
                    ),
                    Text(
                      '${data.segments?.last.arrival?.iataCode} (T${data.segments?.last.arrival?.terminal ?? '1'})',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DottedBorder(
          dashPattern: const <double>[8, 4],
          customPath: (Size size) => Path()
            ..moveTo(0, size.height)
            ..relativeLineTo(size.width, 0),
          color: AppColors.grey,
          strokeWidth: 0.5,
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

getDuration({required String duration}) {
  //input PT6H35M
  duration = duration.replaceAll('PT', '');
  final String hr = duration.split('H')[0].trim();
  final String mn = duration.split('H')[1].split('M')[0].trim();

  return '${hr}H ${mn}M';
}
