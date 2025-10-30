import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../../flight_booking_module.dart';
import '../widgets/seat_check_box_widget.dart';

class SeatSelection extends StatefulWidget {
  const SeatSelection({super.key});

  @override
  State<SeatSelection> createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
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

  @override
  void initState() {
    for (int i = 0; i < dateDuration; i++) {
      dates.add(DateTime.now().add(Duration(days: i)));
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AppCustomAppbar(
                        start: 'CCU',
                        end: 'HDO',
                      )),
                  const SizedBox(height: 16),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16),
                  //   child: DateFilterWidget(
                  //     dates: dates,
                  //   ),
                  // ),
                  const SizedBox(height: 16),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16),
                  //   child: SizedBox(
                  //     height: 40,
                  //     width: AppHelpers.getScreenWidth(context),
                  //     child: ListView.builder(
                  //       itemBuilder: (context, index) => SearchFilterWidget(
                  //         onTap: () {
                  //           setState(() {
                  //             selectedFilter = filters[index];
                  //           });
                  //         },
                  //         isSelected: selectedFilter == filters[index],
                  //         title: filters[index],
                  //       ),
                  //       itemCount: filters.length,
                  //       scrollDirection: Axis.horizontal,
                  //     ),
                  //   ),
                  // ),
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
                        itemCount: row,
                        itemBuilder: (context, index) => SeatArrangemnt(
                          row: index,
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
                  context.pushNamed(FlightBookingModule.passengerDetailsName);
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
  final int row;
  const SeatArrangemnt({super.key, required this.row});

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
  int cloumnInLeft = 3;

  int cloumnInRight = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppHelpers.getScreenWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            cloumnInLeft,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: widget.row == 0
                  ? Column(
                      children: [
                        Text(leftCloumName[index]),
                        SeatCheckBoxWidget(
                          id: 'l-$index-${widget.row}',
                          isSelected:
                              selectedSeats.contains('l-$index-${widget.row}'),
                          isBooked:
                              bookedSeats.contains('l-$index-${widget.row}'),
                          onLeft: true,
                          onTap: (id) {
                            if (selectedSeats.contains(id)) {
                              setState(() {
                                selectedSeats.remove(id);
                              });
                            } else {
                              setState(() {
                                selectedSeats.add(id);
                              });
                            }
                          },
                        ),
                      ],
                    )
                  : SeatCheckBoxWidget(
                      id: 'l-$index-${widget.row}',
                      isSelected:
                          selectedSeats.contains('l-$index-${widget.row}'),
                      isBooked: bookedSeats.contains('l-$index-${widget.row}'),
                      onLeft: true,
                      onTap: (id) {
                        if (selectedSeats.contains(id)) {
                          setState(() {
                            selectedSeats.remove(id);
                          });
                        } else {
                          setState(() {
                            selectedSeats.add(id);
                          });
                        }
                      },
                    ),
            ),
          ),
          Text('${widget.row + 1}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              )),
          ...List.generate(
            cloumnInRight,
            (index) => Column(
              children: [
                widget.row == 0
                    ? Text(rightCloumName[index])
                    : const SizedBox(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: SeatCheckBoxWidget(
                    isSelected:
                        selectedSeats.contains('r-$index-${widget.row}'),
                    isBooked: bookedSeats.contains('r-$index-${widget.row}'),
                    onLeft: false,
                    id: 'r-$index-${widget.row}',
                    onTap: (id) {
                      if (selectedSeats.contains(id)) {
                        setState(() {
                          selectedSeats.remove(id);
                        });
                      } else {
                        setState(() {
                          selectedSeats.add(id);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
