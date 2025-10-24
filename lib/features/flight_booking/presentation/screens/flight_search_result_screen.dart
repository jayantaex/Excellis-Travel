import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/compact_ticket_card.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../../flight_booking_module.dart';
import '../widgets/class_filer_widget.dart';
import '../widgets/date_filter_widget.dart';
import '../widgets/nav_bar.dart';

class FlightSearchResultScreen extends StatefulWidget {
  const FlightSearchResultScreen({super.key});

  @override
  State<FlightSearchResultScreen> createState() =>
      _FlightSearchResultScreenState();
}

class _FlightSearchResultScreenState extends State<FlightSearchResultScreen> {
  List<DateTime> dates = [
    DateTime.now(),
  ];
  SearchData searchData = SearchData();
  List<String> filters = [
    'All',
    'Cheapest',
    'Discounted Price',
    'Non Stop First',
  ];
  int dateDuration = 20; //days
  String selectedFilter = 'All';
  int selectedIndex = 0;
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
              bottom: false,
              child: Column(
                children: [
                  //nav Controller
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Navbar(
                        onBcakClicked: () {
                          Navigator.pop(context);
                        },
                        onMoreClicked: () {}),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DateFilterWidget(
                      dates: dates,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ClassFilerWidget(
                      filters: filters,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(top: 16),
                    height: AppHelpers.getScreenHeight(context) * 0.69,
                    child: ListView.builder(
                      itemCount: searchData.ticketData.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: CompactTicketCard(
                          onTap: () {
                            context.pushNamed(
                                FlightBookingModule.seatSelectionName);
                          },
                          data: searchData.ticketData[index],
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
    );
  }
}
