import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/services/local_db.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/flight_bloc.dart';
import '../../data/models/airline_model.dart';
import '../../data/models/filter_data_model.dart';
import '../../flight_booking_module.dart';
import '../../data/models/flights_data_model.dart';
import '../../data/models/hive/flight_hive_data_model.dart'
    show FlightHiveDataModel;
import '../widgets/flight_listing/class_filter_widget.dart';
import '../widgets/flight_card_widget.dart';
import '../widgets/flight_listing/date_filter_widget.dart';
import '../widgets/flight_listing/filter_drawer.dart';
import '../widgets/flight_listing/no_flight_widget.dart';
import '../widgets/loading/flight_list_loadding_widget.dart';

class FlightListScreen extends StatefulWidget {
  const FlightListScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<FlightListScreen> createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  List<DateTime> dates = [
    DateTime.now(),
  ];
  List<String> filters = [
    'All',
    'Lowest Price',
    'Highest Price',
    'Non Stop First',
    'Non Stop Last',
  ];
  int dateDuration = 20; //days
  String selectedFilter = 'All';
  Map<String, dynamic>? body;
  String depurtureDate = '';
  String cabinClass = '';
  List<int> totalTravelers = [];
  Map<String, dynamic> paramData = {};

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      paramData = widget.data;
      depurtureDate = paramData['depurtureDate'];
      cabinClass = paramData['cabinClass'];
      totalTravelers = [
        paramData['travellers']['adult'],
        paramData['travellers']['child'],
        paramData['travellers']['infant']
      ];
      Future.delayed(const Duration(microseconds: 100), () {
        body = getBody(
          depurture: paramData['depurture'],
          arrival: paramData['arrival'],
          depurtureDate: depurtureDate,
          returnDate: paramData['returnDate'],
          cabinClass: cabinClass,
          isRoundTrip: paramData['isRoundTrip'],
          travellersArr: totalTravelers,
        );
        context.read<FlightBloc>().add(SearchFlightsEvent(body: body!));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: BlocBuilder<FlightBloc, FlightState>(
          builder: (context, state) {
            FilterDataModel? currentFilter;
            double minOfferFare = 0;
            double maxOfferFare = 0;
            double minPublishedFare = 0;
            double maxPublishedFare = 0;
            List<AirlineModel> airlines = [];
            if (state is FlightLoaded) {
              minOfferFare = state.minOfferFare;
              maxOfferFare = state.maxOfferFare;
              minPublishedFare = state.minPublishedFare;
              maxPublishedFare = state.maxPublishedFare;
              currentFilter = state.currentFilter;
              airlines = state.airlines;
            }
            log('${currentFilter?.aircraftCodes}');
            return flightSearchDrawer(
              context: context,
              onApply: _handleFilterApply,
              onClear: _handleFilterClear,
              initialFilter: currentFilter,
              minOfferFare: minOfferFare,
              maxOfferFare: maxOfferFare,
              minPublishedFare: minPublishedFare,
              maxPublishedFare: maxPublishedFare,
              airlines: airlines,
            );
          },
        ),
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: Center(
              child: SafeArea(
                bottom: false,
                child: BlocBuilder<FlightBloc, FlightState>(
                  builder: (context, state) {
                    if (state is FlightSearching) {
                      return FlightListLoaddingWidget(
                        arrival: widget.data['arrival'],
                        departure: widget.data['depurture'],
                      );
                    }
                    if (state is FlightLoaded) {
                      return CustomScrollView(
                        slivers: [
                          // App Bar
                          SliverToBoxAdapter(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: AppCustomAppbar(
                                start: widget.data['depurture'],
                                end: widget.data['arrival'],
                                trailing: InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Badge(
                                    isLabelVisible: state.isFiltered,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.white
                                          .withValues(alpha: 0.2),
                                      child: const Icon(
                                        Icons.filter_alt_rounded,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 16)),
                          // Date Filter
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: DateFilterWidget(
                                selectedDate: DateTime.parse(depurtureDate),
                                onDateSelected: (date) async {
                                  if (widget.data['isRoundTrip']) {
                                    final bool? res =
                                        await AppHelpers.showConfirmDialog(
                                      confirmText: 'Got it',
                                      context,
                                      title: 'It is a round trip',
                                      content:
                                          'You can not change the date for round trip. Get you flight information from previous screen',
                                    );
                                    if (res == true) {
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                      }
                                    }
                                    return;
                                  }
                                  depurtureDate = AppHelpers.formatDate(date,
                                      pattern: 'yyyy-MM-dd');
                                  body = getBody(
                                      depurture: widget.data['depurture'],
                                      arrival: widget.data['arrival'],
                                      depurtureDate: depurtureDate,
                                      returnDate: widget.data['returnDate'],
                                      cabinClass: cabinClass,
                                      isRoundTrip: widget.data['isRoundTrip'],
                                      travellersArr: totalTravelers);
                                  context
                                      .read<FlightBloc>()
                                      .add(SearchFlightsEvent(body: body!));
                                },
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 16)),
                          // Class Filter
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: ClassFilterWidget(
                                  onFilterSelected: (filter) {
                                    setState(() {
                                      selectedFilter = filter;
                                    });
                                  },
                                  filters: filters,
                                  selectedFilter: selectedFilter),
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 16)),
                          // Flight List
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final int flightCount = state.isFiltered
                                      ? (state.filteredData?.datam?.length ?? 0)
                                      : (state.data.datam?.length ?? 0);
                                  // If no flights, show NoFlightWidget
                                  if (flightCount == 0) {
                                    return const NoFlightWidget();
                                  }
                                  // Otherwise, show flight cards
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: FlightCardWidget(
                                      departureCity: paramData['departureCity'],
                                      arrivalCity: paramData['arrivalCity'],
                                      isAnimated: true,
                                      onTap: () async {
                                        await _saveToLocal(
                                          data: state.data.datam![index],
                                          flightDictionary:
                                              state.data.dictionaries!,
                                        );
                                        context.pushNamed(
                                          FlightBookingModule.flightDetailsName,
                                          extra: {
                                            'data': state.isFiltered
                                                ? state
                                                    .filteredData!.datam![index]
                                                : state.data.datam![index],
                                            'flightDictionary':
                                                state.data.dictionaries,
                                            'arivalCity':
                                                paramData['arrivalCity'],
                                            'arivalAirport':
                                                paramData['arrivalAirport'],
                                            'departureCity':
                                                paramData['departureCity'],
                                            'departureAirport':
                                                paramData['departureAirport'],
                                          },
                                        );
                                      },
                                      data: state.isFiltered
                                          ? state.filteredData!.datam![index]
                                          : state.data.datam![index],
                                      dictionaries: state.data.dictionaries,
                                    ),
                                  );
                                },
                                childCount: (state.isFiltered
                                        ? (state.filteredData?.datam?.length ??
                                            0)
                                        : (state.data.datam?.length ?? 0))
                                    .clamp(1, double.infinity)
                                    .toInt(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is FlightSearchingError) {
                      return ErrorScreen(
                        errorDesc: state.message,
                        errorMessage: 'Flight Searching Error',
                      );
                    }
                    return const ErrorScreen(
                      errorDesc: 'Something went wrong',
                      errorMessage: 'Flight Searching Error',
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );

  void _handleFilterApply(FilterDataModel filterData, BuildContext context) {
    final FlightState currentFlightState = context.read<FlightBloc>().state;
    setState(() {
      selectedFilter = 'All';
    });
    if (currentFlightState is FlightLoaded) {
      context.read<FlightBloc>().add(
            FilterFlightEvent(
              filterData: filterData,
              flightData: currentFlightState.data,
              minOfferFare: currentFlightState.minOfferFare,
              maxOfferFare: currentFlightState.maxOfferFare,
              minPublishedFare: currentFlightState.minPublishedFare,
              maxPublishedFare: currentFlightState.maxPublishedFare,
              airlines: currentFlightState.airlines,
            ),
          );
      Scaffold.of(context).closeDrawer();
    }
  }

  void _handleFilterClear(BuildContext context) {
    final FlightState currentFlightState = context.read<FlightBloc>().state;
    selectedFilter = 'All';
    if (currentFlightState is FlightLoaded) {
      context.read<FlightBloc>().add(
            ClearFilterEvent(
              flightData: currentFlightState.data,
              minOfferFare: currentFlightState.minOfferFare,
              maxOfferFare: currentFlightState.maxOfferFare,
              minPublishedFare: currentFlightState.minPublishedFare,
              maxPublishedFare: currentFlightState.maxPublishedFare,
              selectedAircraftCode: const [],
              airlines: currentFlightState.airlines,
            ),
          );
    }
    Scaffold.of(context).closeDrawer();
  }
}

Future<bool> _saveToLocal(
    {required Datam data, required FlightDictionary flightDictionary}) async {
  try {
    final String key =
        '${data.itineraries!.first.segments!.first.departure!.iataCode}_${data.itineraries!.first.segments!.last.arrival!.iataCode}_${data.itineraries?.first.segments?.first.departure?.at}_${data.itineraries?.first.segments?.last.arrival?.at}';
    final Box<FlightHiveDataModel> flightBox = await LocalDB().getFlightBox();
    final Map<String, dynamic> dictionaries = flightDictionary.toJson();
    final Map<String, dynamic> dataMap = data.toJson();
    final FlightHiveDataModel recentSearchedData =
        FlightHiveDataModel(data: dataMap, dictionaries: dictionaries);
    final FlightHiveDataModel? existingData = flightBox.get(key);
    if (existingData != null) {
      flightBox.delete(key);
    }
    await flightBox.put(key, recentSearchedData);
    return true;
  } catch (e) {
    log('Error while saving local DB $e');
    return false;
  }
}

Map<String, dynamic> getBody({
  required String depurture,
  required String arrival,
  required String depurtureDate,
  String? returnDate,
  required String cabinClass,
  required bool isRoundTrip,
  required List<int> travellersArr,
}) =>
    {
      'currencyCode': 'INR',
      'originDestinations': [
        {
          'id': '1',
          'originLocationCode': depurture,
          'destinationLocationCode': arrival,
          'departureDateTimeRange': {'date': depurtureDate}
        },
        if (isRoundTrip)
          {
            'id': '2',
            'originLocationCode': arrival,
            'destinationLocationCode': depurture,
            'departureDateTimeRange': {
              'date': returnDate,
            }
          }
      ],
      'travelers': getTravellers(travellersArr: travellersArr),
      'sources': ['GDS'],
      'searchCriteria': {
        'maxFlightOffers': !kDebugMode ? 10 : null,
        'flightFilters': {
          'cabinRestrictions': [
            {
              'cabin': getCabinClasses(cabinClass: cabinClass),
              'coverage': 'MOST_SEGMENTS',
              'originDestinationIds': isRoundTrip ? ['1', '2'] : ['1']
            }
          ],
          'carrierRestrictions': {
            'excludedCarrierCodes': ['TP']
          }
        }
      }
    };

List<Map<String, dynamic>> getTravellers({required List<int> travellersArr}) {
  List<Map<String, dynamic>> listOfTravellers = [];
  int travellerId = 1;
  for (int i = 0; i < travellersArr.length; i++) {
    if (travellersArr[i] > 0) {
      for (int j = 0; j < travellersArr[i]; j++) {
        final Map<String, dynamic> traveller = {
          'id': '$travellerId',
          'travelerType': i == 0
              ? 'ADULT'
              : i == 1
                  ? 'CHILD'
                  : 'HELD_INFANT',
          'fareOptions': ['STANDARD'],
        };
        listOfTravellers.add(traveller);
        travellerId++;
      }
    }
  }

  listOfTravellers = assignAssociateIdToInfants(
      listOfTravellers: listOfTravellers, adultTravelers: travellersArr[0]);

  return listOfTravellers;
}

List<Map<String, dynamic>> assignAssociateIdToInfants(
    {required List<Map<String, dynamic>> listOfTravellers,
    required int adultTravelers}) {
  for (int i = 0; i < listOfTravellers.length; i++) {
    if (listOfTravellers[i]['travelerType'] == 'HELD_INFANT') {
      listOfTravellers[i]['associatedAdultId'] = adultTravelers;
    }
    if (listOfTravellers[i]['travelerType'] == 'HELD_INFANT') {
      adultTravelers--;
    }
  }

  return listOfTravellers;
}

String getCabinClasses({required String cabinClass}) {
  switch (cabinClass) {
    case 'Economy':
      return 'ECONOMY';
    case 'Premium Economy':
      return 'PREMIUM_ECONOMY';
    case 'Business':
      return 'BUSINESS';
    case 'First Class':
      return 'FIRST';
    default:
      return 'ECONOMY';
  }
}
