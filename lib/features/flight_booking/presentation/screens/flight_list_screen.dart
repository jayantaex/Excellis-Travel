import 'dart:developer';
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
import '../../models/flights_data_model.dart';
import '../../models/hive/flight_hive_data_model.dart' show FlightHiveDataModel;
import '../widgets/flight_listing/class_filter_widget.dart';
import '../widgets/flight_card_widget.dart';
import '../widgets/flight_listing/date_filter_widget.dart';
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

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final Map<String, dynamic> paramData = widget.data;

      depurtureDate = paramData['depurtureDate'];
      cabinClass = paramData['cabinClass'];

      Future.delayed(const Duration(microseconds: 100), () {
        body = getBody(
          depurture: paramData['depurture'],
          arrival: paramData['arrival'],
          depurtureDate: depurtureDate,
          returnDate: paramData['returnDate'],
          cabinClass: cabinClass,
          isRoundTrip: paramData['isRoundTrip'],
          adultCount: paramData['travellers']['adult'],
          childCount: paramData['travellers']['child'],
          infantCount: paramData['travellers']['infant'],
        );
        context.read<FlightBloc>().add(SearchFlightsEvent(body: body!));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: Center(
              child: SafeArea(
                bottom: false,
                child: BlocBuilder<FlightBloc, FlightState>(
                  builder: (context, state) {
                    if (state is FlightSearching) {
                      return const FlightListLoaddingWidget();
                    }

                    if (state is FlightLoaded) {
                      return Column(
                        children: [
                          //nav Controller
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: AppCustomAppbar(
                              start: widget.data['depurture'],
                              end: widget.data['arrival'],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
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
                                    adultCount: widget.data['travellers']
                                        ['adult'],
                                    childCount: widget.data['travellers']
                                        ['child'],
                                    infantCount: widget.data['travellers']
                                        ['infant']);
                                context
                                    .read<FlightBloc>()
                                    .add(SearchFlightsEvent(body: body!));
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: ClassFilterWidget(
                              filters: filters,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.only(top: 16),
                            height: AppHelpers.getScreenHeight(context) * 0.69,
                            child: ListView.builder(
                              itemCount: state.data.datam?.length,
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: FlightCardWidget(
                                  onTap: () async {
                                    await _saveToLocal(
                                      data: state.data.datam![index],
                                      flightDictionary:
                                          state.data.dictionaries!,
                                    );
                                    context.pushNamed(
                                      FlightBookingModule.flightDetailsName,
                                      extra: {
                                        'data': state.data.datam![index],
                                        'flightDictionary':
                                            state.data.dictionaries
                                      },
                                    );
                                  },
                                  data: state.data.datam![index],
                                  dictionaries: state.data.dictionaries,
                                ),
                              ),
                            ),
                          )
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
  required int adultCount,
  required int infantCount,
  required int childCount,
}) =>
    {
      'currencyCode': 'INR',
      'originLocationCode': depurture,
      'destinationLocationCode': arrival,
      'departureDate': depurtureDate,
      'returnDate': isRoundTrip ? returnDate : null,
      'adults': adultCount,
      'infants': infantCount,
      'children': childCount,
      'max': kDebugMode ? 100 : 100
    };

List<Map<String, dynamic>> getTravellers({required List<int> travellersArr

    /// [adult, child, infant]
    }) {
  final List<Map<String, dynamic>> listOfTravellers = [];
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
                  : 'INFANT',
          'fareOptions': ['STANDARD']
        };
        listOfTravellers.add(traveller);
        travellerId++;
      }
    }
  }

  return listOfTravellers;
}
