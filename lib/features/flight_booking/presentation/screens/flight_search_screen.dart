import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/utils/storage_service.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../flight_booking_module.dart';
import '../../data/models/air_port_model.dart';
import '../widgets/flight_search/greeting_widget.dart';
import '../widgets/flight_search/passenger_selection_sheet.dart';
import '../widgets/flight_search/app_drop_down.dart';
import '../widgets/flight_search/recent_search_widget.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  DateTime? departureDate;
  DateTime? roundTripDate;
  final TextEditingController _travellerController =
      TextEditingController(text: '1');

  final TextEditingController _depurtureController = TextEditingController(
    text: 'CCU(KOLKATA)\nSUBHASH CHANDRA BOSE INTL',
  );
  final TextEditingController _arrivalController = TextEditingController(
    text: 'DEL(DELHI)\nINDRA GANDHI INTL',
  );
  String departureCode = 'CCU';
  String departureCity = '';
  String arrivalCode = 'DEL';
  String arrivalCity = '';
  //mock data
  String _selectedSeatType = 'Economy';
  String _selectedFareType = 'Regular';
  String _trendingSearch = 'CCU-DEL';
  int _adultCount = 1;
  int _childCount = 0;
  int _infantCount = 0;
  final DateTime _today = DateTime.now();
  final Duration _fiveDay = const Duration(days: 5);
  final Duration _oneDay = const Duration(days: 1);

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
      child: Text('Armed Forces'),
    ),
  ];

  final List<DropdownMenuItem<String>> _trendingSearches =
      <DropdownMenuItem<String>>[
    const DropdownMenuItem<String>(
      value: 'CCU-DEL',
      child: Text('CCU-DEL'),
    ),
    const DropdownMenuItem<String>(
      value: 'DBX-DEL',
      child: Text('DBX-DEL'),
    ),
  ];

  bool isRoundTrip = false;

  Future<DateTime?> _pickDate({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
  }) async =>
      await showDatePicker(
        builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.black,
            ),
            dialogBackgroundColor: AppColors.white,
          ),
          child: child!,
        ),
        context: context,
        firstDate: firstDate,
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ),
        initialDate: initialDate,
      );

  @override
  void dispose() {
    _travellerController.dispose();
    _depurtureController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }

  void _swapAirports() {
    final String temp = _depurtureController.text;
    _depurtureController.text = _arrivalController.text;
    _arrivalController.text = temp;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelpers.isDarkMode(context);
    final TextStyle defaultTextStyple = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: isDarkMode ? AppColors.white : AppColors.black,
    );
    return TransWhiteBgWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //greeting part
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (BuildContext context, ProfileState state) =>
                      const GreetingWidget(),
                ),
                const SizedBox(height: 16),
                //searching part
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  width: AppHelpers.getScreenWidth(context),
                  decoration: BoxDecoration(
                    color:
                        isDarkMode ? const Color(0xFF303030) : AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: SizedBox(
                    width: AppHelpers.getScreenWidth(context),
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          width: AppHelpers.getScreenWidth(context),
                          child: Column(
                            children: <Widget>[
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
                                    assetName: 'from',
                                    isIcon: true,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                onTap: () async {
                                  context.pushNamed(
                                      FlightBookingModule.airportSearchName,
                                      extra: <String, Object>{
                                        'type': 'Departure',
                                        'selectedAirport': departureCity.trim(),
                                        'onAirportSelected':
                                            (AirportModel airport) {
                                          departureCity =
                                              airport.address?.cityName ?? '';
                                          departureCode =
                                              airport.iataCode ?? '';
                                          _depurtureController.text =
                                              '${airport.iataCode}(${airport.address!.cityName})\n${airport.name}';
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
                                    assetName: 'to',
                                    isIcon: true,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                onTap: () async {
                                  context.pushNamed(
                                      FlightBookingModule.airportSearchName,
                                      extra: <String, Object>{
                                        'type': 'Arrival',
                                        'selectedAirport': arrivalCity.trim(),
                                        'onAirportSelected':
                                            (AirportModel airport) {
                                          arrivalCity =
                                              airport.address?.cityName ?? '';
                                          arrivalCode = airport.iataCode ?? '';
                                          _arrivalController.text =
                                              '${airport.iataCode}(${airport.address?.cityName})\n${airport.name}';
                                        },
                                      });
                                },
                              ),
                              const SizedBox(height: 16),
                              AppPrimaryInput(
                                controller: TextEditingController(
                                  text: AppHelpers.formatDate(
                                      departureDate ?? DateTime.now(),
                                      pattern: 'E, dd MMM yyyy'),
                                ),
                                enable: true,
                                maxCharacters: 10,
                                hint: 'Pick your departure date',
                                label: 'Departure',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: AppHelpers.svgAsset(
                                    assetName: 'calender',
                                    isIcon: true,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                                suffixIcon: SizedBox(
                                  width:
                                      AppHelpers.getScreenWidth(context) * 0.37,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
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
                                            activeColor: AppColors.primary,
                                            value: isRoundTrip,
                                            onChanged: (bool value) {
                                              setState(() {
                                                isRoundTrip = value;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                style: defaultTextStyple,
                                onTap: () async {
                                  departureDate = await _pickDate(
                                    context: context,
                                    firstDate: _today,
                                    initialDate: _today,
                                  );
                                  setState(() {});

                                  //hide keyboard
                                },
                              ),
                              const SizedBox(height: 16),
                              isRoundTrip
                                  ? AppPrimaryInput(
                                      controller: TextEditingController(
                                        text: AppHelpers.formatDate(
                                            roundTripDate ??
                                                _today.add(_fiveDay),
                                            pattern: 'E, dd MMM yyyy'),
                                      ),
                                      enable: true,
                                      maxCharacters: 10,
                                      hint: 'Pick your return date',
                                      label: 'Return',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: AppHelpers.svgAsset(
                                          assetName: 'calender',
                                          isIcon: true,
                                          color: isDarkMode
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                      style: defaultTextStyple,
                                      onTap: () async {
                                        if (context.mounted) {
                                          FocusScope.of(context).unfocus();
                                        }
                                        roundTripDate = await _pickDate(
                                            context: context,
                                            firstDate: departureDate?.add(
                                                    const Duration(hours: 2)) ??
                                                _today.add(_oneDay),
                                            initialDate:
                                                departureDate?.add(_fiveDay) ??
                                                    _today.add(_fiveDay));
                                        setState(() {});
                                        //hide keyboard
                                      },
                                    )
                                  : const SizedBox(),
                              SizedBox(height: isRoundTrip ? 16 : 0),
                              SizedBox(
                                width: AppHelpers.getScreenWidth(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
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
                                          child: AppHelpers.svgAsset(
                                            assetName: 'users',
                                            isIcon: true,
                                            color: isDarkMode
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),
                                        onTap: () {
                                          showPassengerSelectionSheet(
                                            adult: _adultCount,
                                            child: _childCount,
                                            infant: _infantCount,
                                            onDone: (int adult, int child,
                                                int infant) {
                                              _adultCount = adult;
                                              _childCount = child;
                                              _infantCount = infant;
                                              _travellerController.text =
                                                  '${adult + child + infant}';
                                              setState(() {});
                                            },
                                            context: context,
                                          );
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
                                            ),
                                          ),
                                        ),
                                        style: defaultTextStyple,
                                        onChange: (String p0) {},
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppHelpers.getScreenWidth(context) *
                                              0.4,
                                      child: AppDropDown(
                                        label: 'Cabin Class',
                                        prefixIconName: 'seat',
                                        title: 'Cabin Class',
                                        items: _cabinTypes,
                                        value: _selectedSeatType,
                                        onChanged: (String? value) {
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
                                  children: <Widget>[
                                    SizedBox(
                                      width:
                                          AppHelpers.getScreenWidth(context) *
                                              0.4,
                                      child: AppDropDown(
                                        label: 'Fare Type',
                                        prefixIconName: 'users',
                                        title: 'Select A Fare Type',
                                        items: _fareTipes,
                                        value: _selectedFareType,
                                        onChanged: (String? value) {
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
                                      child: AppDropDown(
                                        label: 'Trending Search',
                                        prefixIconName: 'seat',
                                        title: 'Trending Search',
                                        items: _trendingSearches,
                                        value: _trendingSearch,
                                        onChanged: (String? value) {
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
                              SizedBox(
                                height: 45,
                                width: AppHelpers.getScreenWidth(context),
                                child: AppPrimaryButton(
                                    onPressed: () async {
                                      if (_arrivalController.text.isEmpty ||
                                          _depurtureController.text.isEmpty) {
                                        showToast(
                                            message:
                                                'Please enter both arrival and depurture');
                                        return;
                                      }

                                      if (_arrivalController.text ==
                                          _depurtureController.text) {
                                        showToast(
                                            message:
                                                'Please enter different arrival and depurture');
                                        return;
                                      }
                                      if (_arrivalController.text.isNotEmpty &&
                                          _depurtureController
                                              .text.isNotEmpty) {
                                        final Map<String, dynamic> data =
                                            <String, dynamic>{
                                          'depurture': departureCode,
                                          'arrival': arrivalCode,
                                          'isRoundTrip': isRoundTrip,
                                          'depurtureDate':
                                              AppHelpers.formatDate(
                                            departureDate ?? _today,
                                            pattern: 'yyyy-MM-dd',
                                          ),
                                          'returnDate': isRoundTrip
                                              ? AppHelpers.formatDate(
                                                  roundTripDate ??
                                                      _today.add(_fiveDay),
                                                  pattern: 'yyyy-MM-dd',
                                                )
                                              : null,
                                          'travellers': <String, int>{
                                            'adult': _adultCount,
                                            'child': _childCount,
                                            'infant': _infantCount
                                          },
                                          'fareType': _selectedFareType,
                                          'cabinClass': _selectedSeatType,
                                        };
                                        final String? token =
                                            await StorageService
                                                .getAccessToken();
                                        if (token == null || token.isEmpty) {
                                          if (context.mounted) {
                                            await AppHelpers.showSnackBar(
                                                context, 'Please login first');
                                          }
                                          return;
                                        }
                                        if (context.mounted) {
                                          context.pushNamed(
                                              FlightBookingModule
                                                  .flightSearchResultName,
                                              extra: data);
                                        }
                                      }
                                    },
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                    bgColor: AppHelpers.isDarkMode(context)
                                        ? AppColors.primaryDark
                                        : AppColors.primary,
                                    title: 'Search Flights',
                                    isLoading: false),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),

                        //swap button
                        Positioned(
                          right: 30,
                          top: _depurtureController.text.isEmpty
                              ? 40
                              : _arrivalController.text.isEmpty
                                  ? 60
                                  : 55,
                          child: InkWell(
                            onTap: () {
                              _swapAirports();
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: AppHelpers.isDarkMode(context)
                                  ? AppColors.primaryDark
                                  : AppColors.primary,
                              child: AppHelpers.svgAsset(
                                  color: AppColors.white,
                                  assetName: 'swap',
                                  isIcon: true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const RecentSearchWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
