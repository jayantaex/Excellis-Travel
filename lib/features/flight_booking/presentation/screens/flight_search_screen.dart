import 'dart:developer';

import 'package:excellistravel/core/widgets/compact_ticket_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../data/search_data.dart';
import '../../flight_booking_module.dart';
import '../../models/air_port_model.dart';
import '../widgets/greeting_widget.dart';
import '../widgets/passenger_selection_sheet.dart';
import '../widgets/search_drop_down.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  DateTime? selectedDate;
  final TextEditingController _travellerController =
      TextEditingController(text: '1');

  final TextEditingController _depurtureController = TextEditingController(
    text: 'DEL (Delhi)\nIndira Gandhi International Airport',
  );
  final TextEditingController _arrivalController = TextEditingController(
    text: 'DXB (Dubai)\nDubai International Airport',
  );
  //mock data
  SearchData searchData = SearchData();
  String _selectedSeatType = 'Economy';
  String _selectedFareType = 'Regular';
  String _trendingSearch = 'CCU-AU';
  int _adultCount = 1;
  int _childCount = 0;
  int _infantCount = 0;
  final List<DropdownMenuItem<String>> _cabinTypes = <DropdownMenuItem<String>>[
    const DropdownMenuItem<String>(
      value: 'Economy',
      child: Text('Economy'),
    ),
    const DropdownMenuItem<String>(
      value: 'Premium Economy',
      child: Text('Premium Eco.'),
    ),
    const DropdownMenuItem<String>(
      value: 'Business',
      child: Text('Business'),
    ),
    const DropdownMenuItem<String>(
      value: 'First Class',
      child: Text('First Class'),
    ),
  ];

  final List<DropdownMenuItem<String>> _fareTipes = <DropdownMenuItem<String>>[
    const DropdownMenuItem<String>(
      value: 'Regular',
      child: Text('Regular'),
    ),
    const DropdownMenuItem<String>(
      value: 'Student',
      child: Text('Student'),
    ),
    const DropdownMenuItem<String>(
      value: 'Senior Citizen',
      child: Text('Senior Citizen'),
    ),
    const DropdownMenuItem<String>(
      value: 'Armed Forces',
      child: Text('Student'),
    ),
  ];

  final List<DropdownMenuItem<String>> _trendingSearches =
      <DropdownMenuItem<String>>[
    const DropdownMenuItem<String>(
      value: 'CCU-AU',
      child: Text('CCU-AU'),
    ),
    const DropdownMenuItem<String>(
      value: 'DBX-DEL',
      child: Text('DBX-DEL'),
    ),
  ];

  bool isRoundTrip = false;
  final TextStyle _defaultTextStyple = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  Future<DateTime?> _pickDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      initialDate: DateTime.now(),
    );
    setState(() {});

    return selectedDate;
  }

  @override
  void dispose() {
    _travellerController.dispose();
    _depurtureController.dispose();
    _arrivalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TransWhiteBgWidget(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //greeting part
                const GreetingWidget(),
                const SizedBox(height: 16),
                //searching part
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  width: AppHelpers.getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: SizedBox(
                    width: AppHelpers.getScreenWidth(context),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: AppHelpers.getScreenWidth(context),
                          child: Column(
                            children: [
                              AppPrimaryInput(
                                isMultiline: true,
                                controller: _depurtureController,
                                enable: true,
                                maxCharacters: 10,
                                hint: 'Enter your departure airport',
                                label: 'Departure',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: AppHelpers.svgAsset(
                                      assetName: 'from', isIcon: true),
                                ),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                                onTap: () async {
                                  context.pushNamed(
                                      FlightBookingModule.airportSearchName,
                                      extra: {
                                        'type': 'Departure',
                                        'selectedAirport':
                                            _depurtureController.text.trim(),
                                        'onAirportSelected':
                                            (AirportModel airport) {
                                          log('Departure Airport ${airport.name}');
                                        },
                                      });
                                },
                              ),
                              const SizedBox(height: 16),
                              AppPrimaryInput(
                                isMultiline: true,
                                controller: _arrivalController,
                                enable: true,
                                maxCharacters: 10,
                                hint: 'Enter your arrival airport',
                                label: 'Arrival',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: AppHelpers.svgAsset(
                                      assetName: 'to', isIcon: true),
                                ),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                                onTap: () async {
                                  context.pushNamed(
                                      FlightBookingModule.airportSearchName,
                                      extra: {
                                        'type': 'Arrival',
                                        'selectedAirport':
                                            _arrivalController.text,
                                        'onAirportSelected':
                                            (AirportModel airport) {
                                          log('Arrival Airport ${airport.name}');
                                          setState(() {});
                                        },
                                      });
                                },
                              ),
                              const SizedBox(height: 16),
                              AppPrimaryInput(
                                controller: TextEditingController(
                                  text: AppHelpers.formatDate(
                                      selectedDate ?? DateTime.now(),
                                      pattern: 'E, dd MMM yyyy'),
                                ),
                                enable: true,
                                maxCharacters: 10,
                                hint: 'Pick your departure date',
                                label: 'Departure',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    '${AppConstants.assetIcontUrl}calender.svg',
                                  ),
                                ),
                                suffixIcon: SizedBox(
                                  width:
                                      AppHelpers.getScreenWidth(context) * 0.37,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Roundtrip?',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.grey),
                                      ),
                                      Transform.scale(
                                        scale: 0.6,
                                        child: CupertinoSwitch(
                                            value: isRoundTrip,
                                            onChanged: (value) {
                                              setState(() {
                                                isRoundTrip = value;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                style: _defaultTextStyple,
                                onTap: () async {
                                  if (context.mounted) {
                                    FocusScope.of(context).unfocus();
                                  }
                                  DateTime? date = await _pickDate(context);
                                  if (context.mounted) {
                                    FocusScope.of(context).unfocus();
                                  }

                                  //hide keyboard
                                },
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: AppHelpers.getScreenWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppHelpers.getScreenWidth(context) *
                                              0.4,
                                      child: AppPrimaryInput(
                                        keyboardType: TextInputType.number,
                                        controller: _travellerController,
                                        enable: true,
                                        maxCharacters: 2,
                                        hint: '1 Adult',
                                        label: 'Travellers',
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                            '${AppConstants.assetIcontUrl}users.svg',
                                          ),
                                        ),
                                        onTap: () {
                                          showPassengerSelectionSheet(
                                              adult: _adultCount,
                                              child: _childCount,
                                              infant: _infantCount,
                                              onDone: (adult, child, infant) {
                                                _adultCount = adult;
                                                _childCount = child;
                                                _infantCount = infant;
                                                _travellerController.text =
                                                    '${adult + child + infant}';
                                                setState(() {});
                                              },
                                              context: context);
                                        },
                                        suffixIcon: Container(
                                          alignment: Alignment.centerLeft,
                                          width: AppHelpers.getScreenWidth(
                                                  context) *
                                              0.19,
                                          child: const Text(
                                            'Travellers',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        style: _defaultTextStyple,
                                        onChange: (p0) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppHelpers.getScreenWidth(context) *
                                              0.4,
                                      child: SearchDropDown(
                                        label: 'Cabin Class',
                                        prefixIconName: 'seat',
                                        title: 'Cabin Class',
                                        items: _cabinTypes,
                                        value: _selectedSeatType,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSeatType = value ?? '';
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: AppHelpers.getScreenWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppHelpers.getScreenWidth(context) *
                                              0.4,
                                      child: SearchDropDown(
                                        label: 'Fare Type',
                                        prefixIconName: 'users',
                                        title: 'Select A Fare Type',
                                        items: _fareTipes,
                                        value: _selectedFareType,
                                        onChanged: (value) {
                                          log('$value');
                                          setState(() {
                                            _selectedFareType = value ?? '';
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppHelpers.getScreenWidth(context) *
                                              0.4,
                                      child: SearchDropDown(
                                        label: 'Trending Search',
                                        prefixIconName: 'seat',
                                        title: 'Trending Search',
                                        items: _trendingSearches,
                                        value: _trendingSearch,
                                        onChanged: (value) {
                                          setState(() {
                                            _trendingSearch = value ?? '';
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              AppPrimaryButton(
                                  onPressed: () {
                                    if (_arrivalController.text.isNotEmpty &&
                                        _depurtureController.text.isNotEmpty) {
                                      context.pushNamed(
                                          FlightBookingModule.searchName);
                                    }
                                  },
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                  bgColor: AppColors.primary,
                                  title: 'Search Flights',
                                  isLoading: false),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),

                        //swap button
                        Positioned(
                          right: 30,
                          top: 55,
                          child: InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.primary,
                              child: AppHelpers.svgAsset(
                                  assetName: 'swap', isIcon: true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                SizedBox(
                  height: 20,
                  width: AppHelpers.getScreenWidth(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Search',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      InkWell(
                          child: Text(
                        'Show more',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 200,
                  width: AppHelpers.getScreenWidth(context),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: CompactTicketCard(
                            customWidth:
                                AppHelpers.getScreenWidth(context) * 0.2,
                            onTap: () {
                              context.pushNamed(
                                  FlightBookingModule.seatSelectionName);
                            },
                            data: searchData.ticketData[index],
                          ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
