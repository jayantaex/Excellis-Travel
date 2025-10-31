import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
import 'package:excellistravel/features/flight_booking/models/flights_data_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../data/airline.dart';
import '../../data/search_data.dart';
import '../widgets/ticket_card_widget.dart';

class FlightDetailsScreen extends StatefulWidget {
  final Datam data;
  const FlightDetailsScreen({super.key, required this.data});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  String seletedTab = 'ECONOMY';
  List<FareDetailsBySegment> filteredSegment = [];
  List<String> classList = [
    'ECONOMY',
    'BUSINESS CLASS',
    'FIRST CLASS',
  ];

  @override
  void initState() {
    filteredSegment = filterSegment(
      cabin: seletedTab,
      fullList: widget.data.travelerPricings!.first.fareDetailsBySegment!,
    );
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);

    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppCustomAppbar(
                    centerTitle: 'Flight Details & Fares',
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DottedBorder(
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              leading: AppHelpers.assetImage(
                                  assetName: 'indigo', ext: 'png'),
                              title: Text(
                                getAirlineByCode(
                                    code: widget.data
                                        .validatingAirlineCodes![0])['airline'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              subtitle: const Text(
                                '6E2119 | Airbus A321-200',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey),
                              ),
                              trailing: Text(
                                '${widget.data.numberOfBookableSeats} seats available',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          DottedBorder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 90,
                                    width: width * 0.25,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            AppHelpers.formatDateTime(
                                              widget
                                                      .data
                                                      .itineraries
                                                      ?.first
                                                      .segments
                                                      ?.first
                                                      .departure
                                                      ?.at ??
                                                  DateTime.now(),
                                              pattern: 'hh:MM',
                                            ),
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          AppHelpers.formatDateTime(
                                            widget
                                                    .data
                                                    .itineraries
                                                    ?.first
                                                    .segments
                                                    ?.last
                                                    .arrival
                                                    ?.at ??
                                                DateTime.now(),
                                            pattern: 'dd MMM, yyyy',
                                          ),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          '${widget.data.itineraries?.first.segments?.first.departure?.iataCode} (${widget.data.itineraries?.first.segments?.first.departure?.terminal ?? 'T1'})',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                    width: width * 0.25,
                                    child: Column(
                                      children: [
                                        AppHelpers.svgAsset(
                                            assetName: 'flight', width: 100),
                                        Column(
                                          children: [
                                            Text(
                                              getDuration(
                                                  duration: widget
                                                          .data
                                                          .itineraries
                                                          ?.first
                                                          .duration ??
                                                      ''),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Divider(
                                              thickness: 0.5,
                                              color: AppColors.primary
                                                  .withOpacity(0.3),
                                            ),
                                            Text(
                                              widget.data.itineraries?.first
                                                          .segments?.length ==
                                                      1
                                                  ? 'Non-Stop'
                                                  : '${(widget.data.itineraries!.first.segments!.length - 1)} Stop(s)',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
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
                                    children: [
                                      Text(
                                          AppHelpers.formatDateTime(
                                            widget
                                                    .data
                                                    .itineraries
                                                    ?.first
                                                    .segments
                                                    ?.last
                                                    .arrival
                                                    ?.at ??
                                                DateTime.now(),
                                            pattern: 'hh:MM',
                                          ),
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                        AppHelpers.formatDateTime(
                                            DateTime.now(),
                                            pattern: 'dd MMM, yyyy'),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                      Text(
                                        '${widget.data.itineraries?.first.segments?.last.arrival?.iataCode} ',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ...widget.data.itineraries!.first.segments!
                              .map((e) => AirportCard(
                                    airportType:  'start',
                                    title: e.departure?.iataCode ?? '',
                                  )),
                          // ListTile(
                          //   leading: AppHelpers.svgAsset(
                          //       assetName: 'to', isIcon: true),
                          //   title: const Text(
                          //     'Departure Airport',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          //   subtitle: const Text(
                          //     'Indira Gandhi International Airport (DEL)',
                          //     style: TextStyle(
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.w400,
                          //         color: AppColors.grey),
                          //   ),
                          // ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey.withOpacity(0.2),
                              ),
                            ),
                            width: AppHelpers.getScreenWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...classList.map(
                                  (e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        seletedTab = e;
                                        filteredSegment = filterSegment(
                                            fullList: widget
                                                    .data
                                                    .travelerPricings!
                                                    .first
                                                    .fareDetailsBySegment ??
                                                [],
                                            cabin: seletedTab);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      height: 40,
                                      width: width / classList.length - 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: seletedTab == e
                                            ? AppColors.black
                                            : null,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: seletedTab == e
                                              ? AppColors.white
                                              : AppColors.black,
                                          fontSize: 10,
                                          fontWeight: seletedTab == e
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ...filteredSegment.map(
                            (FareDetailsBySegment? e) => TicketCardWidget(
                              data: e!,
                            ),
                          ),
                          filteredSegment.isEmpty
                              ? const SizedBox(
                                  height: 250,
                                  child: Center(
                                    child: Text(
                                      'No segement found for this cabin class',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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

List<FareDetailsBySegment> filterSegment(
    {required List<FareDetailsBySegment> fullList, required String cabin}) {
  List<FareDetailsBySegment> result = [];

  for (var element in fullList) {
    if (element.cabin == cabin) {
      result.add(element);
    }
  }

  return result;
}

class AirportCard extends StatelessWidget {
  final String title;

  /// start|end|stop
  final String airportType;
  const AirportCard(
      {super.key, required this.title, required this.airportType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppHelpers.svgAsset(
        assetName: airportType == 'start'
            ? 'from'
            : airportType == 'to'
                ? 'to'
                : 'stop',
        isIcon: true,
      ),
      title: const Text(
        'Apparture Airport',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        'Netaji Subhash Chandra Bose International Airport (CCU)',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey),
      ),
    );
  }
}
