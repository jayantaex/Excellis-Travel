// import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:excellistravel/features/flight_booking/data/seat_data_tmp.dart';
import 'package:excellistravel/features/flight_booking/models/seat_map_data_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../widgets/seat_check_box_widget.dart';
import '../widgets/seat_map/facility_box.dart';
import '../widgets/seat_map/seat_box.dart';

class SeatSelection extends StatefulWidget {
  const SeatSelection({super.key});

  @override
  State<SeatSelection> createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  SeatMapDataModel? _seatData;
  List<DateTime> dates = [
    DateTime.now(),
  ];
  SearchData searchData = SearchData();
  List<String> filters = [
    'Economy',
    'Premium Economy',
    'Business',
    'First Class',
  ];
  int dateDuration = 20; //days
  String selectedFilter = 'All';
  int selectedIndex = 0;

  //seat management

  int row = 30;
  late final Map<String, dynamic> _coordinateMap;
  @override
  void initState() {
    _coordinateMap = {};

    for (int i = 0; i < dateDuration; i++) {
      dates.add(DateTime.now().add(Duration(days: i)));
    }
    try {
      _seatData = SeatMapDataModel.fromJson(seatData);
      _seatData?.data[0].decks[0].seats.forEach((SeatElement element) {
        _coordinateMap['${element.coordinates.x}-${element.coordinates.y}'] =
            element;
      });
      _seatData?.data[0].decks[0].facilities.forEach((Facility element) {
        _coordinateMap['${element.coordinates.x}-${element.coordinates.y}'] =
            element;
      });
    } catch (e) {
      log("Error while parsing seat data $e");
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Flight Search Screen:::: ${_seatData?.data[0].decks[0].seats.length}");

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18),
            topEnd: Radius.circular(18),
          ),
        ),
        child: TransWhiteBgWidget(
          child: Center(
            child: SafeArea(
              child: Column(
                children: [
                  //nav Controller
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppCustomAppbar(
                        start: '${_seatData?.data.first.departure.iataCode}',
                        end: '${_seatData?.data.first.arrival.iataCode}',
                      )),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: AppHelpers.getScreenHeight(context) * 0.6,
                      child: ListView.builder(
                        itemCount: _seatData?.data.first.decks[0]
                                .deckConfiguration.length ??
                            0,
                        itemBuilder: (context, index) => SeatArrangemnt(
                          isWingsRow: index + 1 ==
                              _seatData?.data.first.decks[0].deckConfiguration
                                  .startWingsRow,
                          isExitRow: _seatData?.data.first.decks[0]
                                  .deckConfiguration.exitRowsX
                                  .contains(index + 1) ??
                              false,
                          x: index,
                          cordinateMap: _coordinateMap,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        height: AppHelpers.getScreenHeight(context) * 0.16,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SeatSelectionInformation(
                    title: 'Availabe',
                    bg: AppColors.grey.withOpacity(0.4),
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
      ),
    );
  }
}

class SeatSelectionInformation extends StatelessWidget {
  final String title;
  final Color bg;
  const SeatSelectionInformation(
      {super.key, required this.title, required this.bg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: AppHelpers.getScreenWidth(context) * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
}

class SeatArrangemnt extends StatefulWidget {
  final int x;
  final bool isWingsRow;
  final bool isExitRow;
  final Map<String, dynamic> cordinateMap;
  const SeatArrangemnt(
      {super.key,
      required this.x,
      required this.isWingsRow,
      required this.isExitRow,
      required this.cordinateMap});

  @override
  State<SeatArrangemnt> createState() => _SeatArrangemntState();
}

class _SeatArrangemntState extends State<SeatArrangemnt> {
  List<String> selectedSeats = [];
  List<String> bookedSeats = [
    'l-0-0',
    'l-1-0',
    'l-2-0',
    'r-0-2',
    'r-1-2',
    'r-2-2',
  ];
  List<String> leftCloumName = ['A', 'B', 'C'];
  List<String> rightCloumName = ['D', 'E', 'F'];
  int cloumnInLeft = 7;
  int cloumnInRight = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: widget.isExitRow
            ? AppColors.primary.withOpacity(0.1)
            : widget.isWingsRow
                ? AppColors.primary.withOpacity(0.1)
                : null,
        borderRadius: BorderRadius.circular(12),
      ),
      width: AppHelpers.getScreenWidth(context),
      margin: EdgeInsets.symmetric(
        vertical: widget.isWingsRow || widget.isExitRow ? 18 : 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(cloumnInLeft, (index) {
            String key = '${widget.x}-$index';
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
                facilityCode: widget.cordinateMap[key].code,
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
}
