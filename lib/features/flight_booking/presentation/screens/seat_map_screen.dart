import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../../utils/app_helpers.dart';
import '../../bloc/flight_bloc.dart';
import '../../data/models/flights_data_model.dart';
import '../../data/models/seat_map_data_model.dart';
import '../widgets/seat_map/facility_box.dart';
import '../widgets/seat_map/seat_box.dart';

class SeatMapScreen extends StatefulWidget {
  const SeatMapScreen(
      {super.key,
      required this.flightOffer,
      required this.departureAirport,
      required this.arivalAirport});
  final FlightOfferDatam flightOffer;
  final String departureAirport;
  final String arivalAirport;

  @override
  State<SeatMapScreen> createState() => _SeatMapScreenState();
}

class _SeatMapScreenState extends State<SeatMapScreen> {
  //seat management

  @override
  void initState() {
    try {
      context
          .read<FlightBloc>()
          .add(GetSeatMapDataEvent(flightOfferData: widget.flightOffer));
    } catch (e) {
      log('Error while parsing seat data $e', name: 'Seat Map Screen');
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: Center(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    //nav Controller
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppCustomAppbar(
                          start: widget.departureAirport,
                          end: widget.arivalAirport,
                        )),
                    const SizedBox(height: 16),

                    const SizedBox(height: 16),

                    Expanded(
                      child: BlocConsumer<FlightBloc, FlightState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is SeatMapLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          if (state is SeatMapLoaded) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              margin: const EdgeInsets.only(top: 16),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: AppHelpers.getScreenHeight(context) * 0.6,
                              child: ListView.builder(
                                itemCount: state.data.seatData?.first.decks
                                        ?.first.deckConfiguration?.length ??
                                    0,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        SeatArrangemnt(
                                  isWingsRow: index + 1 ==
                                      state.data.seatData?.first.decks?.first
                                          .deckConfiguration?.startWingsRow,
                                  isExitRow: state.data.seatData?.first.decks
                                          ?.first.deckConfiguration?.exitRowsX
                                          ?.contains(index + 1) ??
                                      false,
                                  x: index,
                                  cordinateMap: state.coordinateMap,
                                ),
                              ),
                            );
                          }
                          return const ErrorScreen(
                            errorMessage: 'Something went wrong',
                            errorDesc: 'Error while loading seat map',
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<FlightBloc, FlightState>(
          builder: (context, state) => state is SeatMapLoaded
              ? Container(
                  color: AppColors.white,
                  height: AppHelpers.getScreenHeight(context) * 0.16,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SeatSelectionInformation(
                              title: 'Availabe',
                              bg: AppColors.grey.withValues(alpha: 0.4),
                            ),
                            const SeatSelectionInformation(
                              title: 'Reserved',
                              bg: Color(0XFF9F4018),
                            ),
                            const SeatSelectionInformation(
                              title: 'Selected',
                              bg: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: AppPrimaryButton(
                          onPressed: () {
                            // context.pushNamed(FlightBookingModule.passengerDetailsName);
                          },
                          title: 'Done',
                          isLoading: false,
                          bgColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      );
}

class SeatSelectionInformation extends StatelessWidget {
  const SeatSelectionInformation(
      {super.key, required this.title, required this.bg});
  final String title;
  final Color bg;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 35,
        width: AppHelpers.getScreenWidth(context) * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(2),
              ),
              child: title == 'Selected'
                  ? const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: AppColors.white,
                    )
                  : null,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            )
          ],
        ),
      );
}

class SeatArrangemnt extends StatefulWidget {
  const SeatArrangemnt(
      {super.key,
      required this.x,
      required this.isWingsRow,
      required this.isExitRow,
      required this.cordinateMap});
  final int x;
  final bool isWingsRow;
  final bool isExitRow;
  final Map<String, dynamic> cordinateMap;

  @override
  State<SeatArrangemnt> createState() => _SeatArrangemntState();
}

class _SeatArrangemntState extends State<SeatArrangemnt> {
  List<String> selectedSeats = <String>[];
  List<String> bookedSeats = <String>[
    'l-0-0',
    'l-1-0',
    'l-2-0',
    'r-0-2',
    'r-1-2',
    'r-2-2',
  ];
  List<String> leftCloumName = <String>['A', 'B', 'C'];
  List<String> rightCloumName = <String>['D', 'E', 'F'];
  int cloumnInLeft = 7;
  int cloumnInRight = 3;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: widget.isExitRow
              ? AppColors.primary.withValues(alpha: 0.1)
              : widget.isWingsRow
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : null,
          borderRadius: BorderRadius.circular(12),
        ),
        width: AppHelpers.getScreenWidth(context),
        margin: EdgeInsets.symmetric(
          vertical: widget.isWingsRow || widget.isExitRow ? 18 : 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...List.generate(cloumnInLeft, (int index) {
              final String key = '${widget.x}-$index';
              log('${widget.cordinateMap[key]}');
              final item = widget.cordinateMap[key];
              if (item is SeatElement) {
                log('${widget.cordinateMap[key]}', name: 'item');
                return SeatBox(
                  data: item,
                );
              }

              if (item is Facility) {
                return FacilityBox(
                  facilityCode: widget.cordinateMap[key],
                );
              }
              return SizedBox(
                height: AppHelpers.getScreenWidth(context) * 0.12,
                width: AppHelpers.getScreenWidth(context) * 0.12,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.notAvailable,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  height: AppHelpers.getScreenWidth(context) * 0.09,
                  width: AppHelpers.getScreenWidth(context) * 0.09,
                  child: const Icon(Icons.close_rounded,
                      size: 12, color: AppColors.white),
                ),
              );
            }),
          ],
        ),
      );
}
