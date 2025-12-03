import 'dart:developer';
import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:excellistravel/features/flight_booking/data/models/filter_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/services/local_db.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/flight_bloc.dart';
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
  int selectedIndex = 0;
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
        drawer: flightSearchDrawer(
          context: context,
          onApply: _handleFilterApply,
          onClear: _handleFilterClear,
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
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        AppColors.white.withOpacity(0.2),
                                    child: const Icon(
                                      Icons.filter_alt_rounded,
                                      color: AppColors.white,
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
                              child: ClassFilterWidget(filters: filters),
                            ),
                          ),

                          const SliverToBoxAdapter(child: SizedBox(height: 16)),

                          // Flight List
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => (state.data.datam?.length ??
                                            0) !=
                                        0
                                    ? Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        child: FlightCardWidget(
                                          departureCity:
                                              paramData['departureCity'],
                                          arrivalCity: paramData['arrivalCity'],
                                          isAnimated: true,
                                          onTap: () async {
                                            await _saveToLocal(
                                              data: state.data.datam![index],
                                              flightDictionary:
                                                  state.data.dictionaries!,
                                            );
                                            context.pushNamed(
                                              FlightBookingModule
                                                  .flightDetailsName,
                                              extra: {
                                                'data':
                                                    state.data.datam![index],
                                                'flightDictionary':
                                                    state.data.dictionaries,
                                                'arivalCity':
                                                    paramData['arrivalCity'],
                                                'arivalAirport':
                                                    paramData['arrivalAirport'],
                                                'departureCity':
                                                    paramData['departureCity'],
                                                'departureAirport': paramData[
                                                    'departureAirport'],
                                              },
                                            );
                                          },
                                          data: state.data.datam![index],
                                          dictionaries: state.data.dictionaries,
                                        ),
                                      )
                                    : const NoFlightWidget(),
                                childCount: state.data.datam?.length ?? 0,
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

  void _handleFilterApply(FilterDataModel filterData) {
    final FlightState currentFlightState = context.read<FlightBloc>().state;
    if (currentFlightState is FlightLoaded) {
      context.read<FlightBloc>().add(
            FilterFlightEvent(
              filterData: filterData,
              flightData: currentFlightState.data,
            ),
          );
    }
  }

  void _handleFilterClear() {
    final FlightState currentFlightState = context.read<FlightBloc>().state;

    if (currentFlightState is FlightLoaded) {
      context.read<FlightBloc>().add(
            FilterFlightEvent(
              filterData: FilterDataModel(),
              flightData: currentFlightState.data,
            ),
          );
    }
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
        'maxFlightOffers': kDebugMode ? 4 : null,
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

List<Map<String, dynamic>> getTravellers({required List<int> travellersArr

    /// [adult, child, infant]
    }) {
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
