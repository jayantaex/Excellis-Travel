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
import '../../flight_booling_module.dart';
import '../widgets/greeting_widget.dart';
import '../widgets/search_auto_complete_input.dart';
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

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  bool isRoundTrip = true;
  //mock data
  SearchData searchData = SearchData();
  String _selectedSeatType = 'Business';
  String _selectedFareType = 'Regular';
  String _trendingSearch = 'CCU-AU';
  final List<DropdownMenuItem<String>> _seatTypes = <DropdownMenuItem<String>>[
    const DropdownMenuItem<String>(
      value: 'Business',
      child: Text('Business'),
    ),
    const DropdownMenuItem<String>(
      value: 'Economy',
      child: Text('Echonomy'),
    ),
    const DropdownMenuItem<String>(
      value: 'First',
      child: Text('First'),
    ),
  ];

  final List<DropdownMenuItem<String>> _fareTipes = <DropdownMenuItem<String>>[
    const DropdownMenuItem<String>(
      value: 'Regular',
      child: Text('Regular'),
    ),
    const DropdownMenuItem<String>(
      value: 'First',
      child: Text('First'),
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

  Future<void> _pickDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      initialDate: DateTime.now(),
    );
    setState(() {});

    log(selectedDate.toString());
  }

  @override
  void dispose() {
    _travellerController.dispose();
    _fromController.dispose();
    _toController.dispose();

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
                              SearchAutoCompleteInput(
                                iconName: 'from',
                                label: 'From',
                                placeHolder: 'Enter your departure airport',
                                onSelected: (value) {
                                  _fromController.text = value.name ?? '';
                                  FocusScope.of(context).unfocus();
                                  setState(() {});
                                },
                              ),
                              const SizedBox(height: 16),
                              SearchAutoCompleteInput(
                                iconName: 'to',
                                label: 'To',
                                placeHolder: 'Enter your arrival airport',
                                onSelected: (value) {
                                  _toController.text = value.name ?? '';
                                  //hide the key board
                                  FocusScope.of(context).unfocus();
                                  setState(() {});
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
                                  width: 140,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Roundtrip?',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.grey),
                                      ),
                                      Transform.scale(
                                        scale: 0.7,
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
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                                onTap: () async {
                                  await _pickDate(context);
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
                                        enable: false,
                                        maxCharacters: 2,
                                        hint: '1 Adult',
                                        label: 'Travellers',
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                            '${AppConstants.assetIcontUrl}users.svg',
                                          ),
                                        ),
                                        suffixIcon: Container(
                                          alignment: Alignment.centerLeft,
                                          width: 100,
                                          child: Text(
                                            _travellerController.text == '1'
                                                ? 'Adult'
                                                : _travellerController.text ==
                                                        ''
                                                    ? ''
                                                    : 'Adults',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
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
                                        label: 'Seat Class',
                                        prefixIconName: 'seat',
                                        title: 'Seat Class',
                                        items: _seatTypes,
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
                                    if (_toController.text.isNotEmpty &&
                                        _fromController.text.isNotEmpty) {
                                      context.pushNamed(
                                          FlightBoolingModule.searchName);
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
                          top: _fromController.text.isEmpty ||
                                  (_toController.text.isEmpty &&
                                      _fromController.text.isEmpty)
                              ? 40
                              : 55,
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
                                  FlightBoolingModule.seatSelectionName);
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
