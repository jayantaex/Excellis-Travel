import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/models/airline_model.dart';
import '../data/models/filter_data_model.dart';
import '../data/models/seat_map_data_model.dart';
import '../data/repository/flight_booking_repository.dart';
import '../data/models/air_port_model.dart';
import '../data/models/create_order_res.dart';
import '../data/models/flight_offer_price_model.dart'
    show FlightOfferPriceDataModel, MyMarkup;
import '../data/models/flights_data_model.dart'
    show FlightsDataModel, Itinerary, Segment, FlightOfferDatam;
import '../data/models/payment_verify_res_model.dart' as payment;
part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc({
    required this.repository,
  }) : super(FlightInitial()) {
    on<SearchAirportEvent>(_handleAirportSearch);
    on<SearchFlightsEvent>(_handleFlightSearch);
    on<GetMarkupPrice>(_handleMarkupPrice);
    on<GetFlightsOfferPriceEvent>(_handleFlightOfferPrice);
    on<CreateFlightOrder>(_handleCreateFlightOrder);
    on<VerifyPayment>(_handleVerifyPayment);
    on<ToggleFareOption>(_handleOfferFareToggle);
    on<SortFlightEvent>(_handleSortFlight);
    on<FilterFlightEvent>(_handleFilterFlight);
    on<ClearFilterEvent>(_handleClearFilter);
    on<GetSeatMapDataEvent>(_handleGetSeatMapData);
  }
  final FlightBookingRepository repository;

  Future<void> _handleAirportSearch(
      SearchAirportEvent event, Emitter<FlightState> emit) async {
    try {
      emit(AirportSearching());
      final List<AirportModel> airportList = await repository.getAirport(
          keyword: event.keyword, country: event.countryCode);
      emit(AirportLoaded(airports: airportList));
    } catch (e) {
      emit(AirportSearchingError(
        message: '$e',
      ));
    }
  }

  Future<void> _handleFlightSearch(
      SearchFlightsEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightSearching());
      double minOfferFare = 0;
      double maxOfferFare = 0;
      double minPublishedFare = 0;
      double maxPublishedFare = 0;
      final ApiResponse<FlightsDataModel> res =
          await repository.searchFlight(body: event.body);
      if (res.data == null) {
        emit(FlightSearchingError(
          message: '${res.errorMessage}',
        ));
        return;
      }

      //filtering the array by departure time

      // res.data!.datam?.sort((a, b) => a
      //     .itineraries!.first.segments!.first.departure!.at!
      //     .compareTo(b.itineraries!.first.segments!.first.departure!.at!));

      //filtering the array by price
      res.data!.datam?.sort((a, b) => double.parse(a.price!.grandTotal!)
          .compareTo(double.parse(b.price!.grandTotal!)));

      final ApiResponse<MyMarkup> myMarkup = await repository.getMyMarkup();

      for (FlightOfferDatam element in res.data!.datam!) {
        final ApiResponse<double> res = await repository.getMarkUpPrice(
            basePrice: double.parse(element.price!.grandTotal!));
        element.price?.offerPrice = res.data!.toStringAsFixed(2);
        element.price?.publishedPrice = getCalculatedPrice(
            basePrice: res.data!.toStringAsFixed(2),
            type: myMarkup.data?.fareType ?? 'Fixed',
            value: myMarkup.data?.value ?? '0');
      }

      minOfferFare = double.parse(res.data!.datam!.first.price!.offerPrice!);
      maxOfferFare = double.parse(res.data!.datam!.last.price!.offerPrice!);
      minPublishedFare =
          double.parse(res.data!.datam!.first.price!.publishedPrice!);
      maxPublishedFare =
          double.parse(res.data!.datam!.last.price!.publishedPrice!);
      for (FlightOfferDatam flight in res.data!.datam!) {
        minOfferFare = minOfferFare < double.parse(flight.price!.offerPrice!)
            ? minOfferFare
            : double.parse(flight.price!.offerPrice!);
        maxOfferFare = maxOfferFare > double.parse(flight.price!.offerPrice!)
            ? maxOfferFare
            : double.parse(flight.price!.offerPrice!);
        minPublishedFare =
            minPublishedFare < double.parse(flight.price!.publishedPrice!)
                ? minPublishedFare
                : double.parse(flight.price!.publishedPrice!);
        maxPublishedFare =
            maxPublishedFare > double.parse(flight.price!.publishedPrice!)
                ? maxPublishedFare
                : double.parse(flight.price!.publishedPrice!);
      }

      final List<AirlineModel> airlines = [];
      for (FlightOfferDatam flight in res.data!.datam!) {
        if (flight.itineraries == null) {
          continue;
        }
        for (Itinerary itinerary in flight.itineraries!) {
          if (itinerary.segments == null) {
            continue;
          }
          for (Segment segment in itinerary.segments!) {
            final String? aircraftCode = segment.carrierCode;
            if (aircraftCode != null &&
                !airlines.any((airline) => airline.code == aircraftCode)) {
              airlines.add(AirlineModel(
                name: res.data!.dictionaries?.dictionaries
                                .carriers?[aircraftCode] !=
                            null &&
                        (res.data!.dictionaries?.dictionaries.carriers
                                ?.isNotEmpty ??
                            false)
                    ? (res.data!.dictionaries?.dictionaries
                            .carriers?[aircraftCode] ??
                        '')
                    : 'No-Name',
                code: aircraftCode,
                totalFlights: 1,
                totalFare: 0.0,
              ));
            }
          }
        }
      }

      //calculate the available flights for each carrier

      for (AirlineModel airline in airlines) {
        final String carrierCode = airline.code;
        int totalFlights = 0;
        for (FlightOfferDatam flight in res.data!.datam!) {
          if (flight.itineraries == null) {
            continue;
          }
          if (flight.itineraries!.first.segments!.first.carrierCode ==
              carrierCode) {
            totalFlights++;
          }
        }
        airline.totalFlights = totalFlights;
      }

      emit(
        FlightLoaded(
          data: res.data!,
          airlines: airlines,
          isFiltered: false,
          minOfferFare: minOfferFare,
          maxOfferFare: maxOfferFare,
          minPublishedFare: minPublishedFare,
          maxPublishedFare: maxPublishedFare,
        ),
      );
    } catch (e) {
      emit(FlightSearchingError(
        message: '$e',
      ));
    }
  }

  Future<void> _handleFlightOfferPrice(
      GetFlightsOfferPriceEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightOfferPriceLoading());
      final ApiResponse<FlightOfferPriceDataModel> res =
          await repository.getFlightOfferPrice(body: event.offerData);

      if (res.data == null) {
        emit(FlightOfferPriceError(
          message: '${res.errorMessage}',
        ));
        return;
      }
      final ApiResponse<double> markupRes = await repository.getMarkUpPrice(
        basePrice: double.parse(
            res.data!.data!.flightOffers!.first.price!.grandTotal!),
      );
      if (markupRes.data == null) {
        emit(FlightOfferPriceError(
          message: '${markupRes.errorMessage}',
        ));
        return;
      }
      res.data!.data!.flightOffers!.first.price?.markup =
          markupRes.data!.toStringAsFixed(2);
      final ApiResponse<MyMarkup> myMarkup = await repository.getMyMarkup();
      if (myMarkup.data == null) {
        emit(FlightOfferPriceError(
          message: '${myMarkup.errorMessage}',
        ));
        return;
      }
      if (myMarkup.data != null) {
        res.data!.data!.myMarkup = myMarkup.data;
      }
      emit(FlightOfferPriceLoaded(data: res.data!));
    } catch (e) {
      emit(FlightOfferPriceError(
        message: '$e',
      ));
    }
  }

  Future<void> _handleCreateFlightOrder(
      CreateFlightOrder event, Emitter<FlightState> emit) async {
    try {
      emit(const FlightOrderLoading());
      // ApiResponse<FlightOrderModel> data =
      //     await repository.createOrder(body: event.body);
      final ApiResponse<OrderModel> res =
          await repository.createPayment(body: event.body);

      if (res.data == null) {
        emit(FlightOrderCreationError(
            error: res.errorMessage ?? 'Something went wrong'));
        return;
      }
      emit(FlightOrderCreated(data: res.data!, paymentVia: event.paymentVia));
    } catch (e) {
      emit(FlightOrderCreationError(error: '$e'));
    }
  }

  Future<void> _handleVerifyPayment(
      VerifyPayment event, Emitter<FlightState> emit) async {
    final ApiResponse<payment.PaymentVarifiedDataModel> res =
        await repository.verifyPayment(body: event.body);

    if (res.data == null) {
      emit(FlightPaymentVerificationFailed(
          error: res.errorMessage ?? 'Something went wrong'));
      return;
    }

    emit(
        FlightPaymentVerified(data: res.data!, paymentMode: event.paymentMode));
  }

  Future<void> _handleMarkupPrice(
      GetMarkupPrice event, Emitter<FlightState> emit) async {
    try {
      emit(FlightSearching());
      final ApiResponse<double> resp =
          await repository.getMarkUpPrice(basePrice: event.baseAmount);
      if (resp.data == null) {
        emit(FlightSearchingError(message: '${resp.errorMessage}'));
      }
    } catch (e) {
      emit(FlightSearchingError(message: '$e'));
    }
  }

  Future<void> _handleOfferFareToggle(
      ToggleFareOption event, Emitter<FlightState> emit) async {
    if (state is OfferPriceEnabledState) {
      emit(OfferPriceDisabledState());
    } else {
      emit(OfferPriceEnabledState());
    }
  }

  Future<void> _handleSortFlight(
      SortFlightEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightSearching());

      // Determine which data to sort - filtered or original
      final FlightsDataModel dataToSort =
          event.isFiltered && event.filteredData != null
              ? event.filteredData!
              : event.flightData;

      // Create a copy to avoid mutating the original
      final FlightsDataModel sortedData = FlightsDataModel(
        datam: List.from(dataToSort.datam ?? []),
        dictionaries: dataToSort.dictionaries,
        meta: dataToSort.meta,
      );

      // Apply sorting based on filter name
      switch (event.filterName) {
        case 'Earliest First':
          sortedData.datam!.sort((a, b) => a
              .itineraries!.first.segments!.first.arrival!.at!
              .compareTo(b.itineraries!.first.segments!.first.arrival!.at!));
          break;

        case 'Low to High':
          sortedData.datam!.sort((a, b) => double.parse(a.price!.offerPrice!)
              .compareTo(double.parse(b.price!.offerPrice!)));
          break;

        case 'High to Low':
          sortedData.datam!.sort((a, b) => double.parse(b.price!.offerPrice!)
              .compareTo(double.parse(a.price!.offerPrice!)));
          break;

        case 'Shortest Duration':
          sortedData.datam!.sort((a, b) =>
              (getDurationInMinutes(a.itineraries!.first.duration!) -
                      getDurationInMinutes(b.itineraries!.first.duration!))
                  .abs()
                  .compareTo(0));
          break;

        default:
          // No sorting applied
          break;
      }

      // Emit with preserved filter state
      if (event.isFiltered) {
        // If filters are active, update filteredData with sorted results
        emit(FlightLoaded(
          isFiltered: true,
          filteredData: sortedData,
          data: event.flightData, // Keep original data unchanged
          airlines: event.airlines ?? [],
          currentFilter: event.currentFilter,
          minOfferFare: event.minOfferFare,
          maxOfferFare: event.maxOfferFare,
          minPublishedFare: event.minPublishedFare,
          maxPublishedFare: event.maxPublishedFare,
        ));
      } else {
        // No filters active, update main data
        emit(FlightLoaded(
          isFiltered: false,
          data: sortedData,
          airlines: event.airlines ?? [],
          minOfferFare: event.minOfferFare,
          maxOfferFare: event.maxOfferFare,
          minPublishedFare: event.minPublishedFare,
          maxPublishedFare: event.maxPublishedFare,
        ));
      }
    } catch (e) {
      emit(FlightSearchingError(message: '$e'));
    }
  }

  Future<void> _handleFilterFlight(
      FilterFlightEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightSearching());

      final FlightsDataModel flightData = event.flightData;
      // Create a copy of the flight data to avoid mutating the original
      final FlightsDataModel filteredFlightData = FlightsDataModel(
        datam: List.from(event.flightData.datam ?? []),
        dictionaries: event.flightData.dictionaries,
        meta: event.flightData.meta,
      );

      if (event.filterData.departureTime != null) {
        switch (event.filterData.departureTime) {
          case 'before_6am':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                final departureTime = DateTime.parse(
                    flight.itineraries!.first.segments!.first.departure!.at!);
                final hourOfDay = departureTime.hour;
                // Keep flights with departure time before 6 AM (0-5 hours)
                return hourOfDay >= 6;
              });

              log('Filtered flights (before 6am): ${filteredFlightData.datam!.length}');
            }
            break;

          case '6_to_12pm':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                final departureTime = DateTime.parse(
                    flight.itineraries!.first.segments!.first.departure!.at!);
                final hourOfDay = departureTime.hour;
                // Keep flights with departure time between 6 AM and 12 PM (6-11 hours)
                return hourOfDay < 6 || hourOfDay >= 12;
              });

              log('Filtered flights (6am-12pm): ${filteredFlightData.datam!.length}');
            }
            break;

          case '12_to_6pm':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                final departureTime = DateTime.parse(
                    flight.itineraries!.first.segments!.first.departure!.at!);
                final hourOfDay = departureTime.hour;
                // Keep flights with departure time between 12 PM and 6 PM (12-17 hours)
                return hourOfDay < 12 || hourOfDay >= 18;
              });

              log('Filtered flights (12pm-6pm): ${filteredFlightData.datam!.length}');
            }
            break;

          case 'after_6pm':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                final departureTime = DateTime.parse(
                    flight.itineraries!.first.segments!.first.departure!.at!);
                final hourOfDay = departureTime.hour;
                // Keep flights with departure time after 6 PM (18-23 hours)
                return hourOfDay < 18;
              });

              log('Filtered flights (after 6pm): ${filteredFlightData.datam!.length}');
            }
            break;

          default:
        }
      }

      // Filter by stops
      if (event.filterData.stops != null &&
          event.filterData.stops!.isNotEmpty) {
        switch (event.filterData.stops) {
          case 'non_stop':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                // Non-stop means only 1 segment in the first itinerary
                final segmentCount =
                    flight.itineraries?.first.segments?.length ?? 0;
                return segmentCount != 1;
              });

              log('Filtered flights (non-stop): ${filteredFlightData.datam!.length}');
            }
            break;

          case '1_stop':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                // 1 stop means 2 segments in the first itinerary
                final segmentCount =
                    flight.itineraries?.first.segments?.length ?? 0;
                return segmentCount != 2;
              });

              log('Filtered flights (1 stop): ${filteredFlightData.datam!.length}');
            }
            break;

          case 'multiple_stop':
            {
              filteredFlightData.datam!.removeWhere((flight) {
                // Multiple stops means 3 or more segments in the first itinerary
                final segmentCount =
                    flight.itineraries?.first.segments?.length ?? 0;
                return segmentCount < 3;
              });

              log('Filtered flights (multiple stops): ${filteredFlightData.datam!.length}');
            }
            break;

          default:
        }
      }

      // Filter by aircraft codes (airlines)
      if (event.filterData.aircraftCodes != null &&
          event.filterData.aircraftCodes!.isNotEmpty) {
        filteredFlightData.datam!.removeWhere((flight) {
          log('FIRST SEGMENT AIRCRAFT CODE: ${flight.itineraries!.first.segments!.first.aircraft?.code}');
          final departureAircraftCode =
              flight.itineraries!.first.segments!.first.carrierCode;
          return !event.filterData.aircraftCodes!
              .contains(departureAircraftCode);
        });

        log('Filtered flights (by airlines): ${filteredFlightData.datam!.length}');
      }

      // Filter by price range
      if (event.filterData.minPublishedFare != null &&
          event.filterData.maxPublishedFare != null) {
        filteredFlightData.datam!.removeWhere((flight) {
          final publishedPrice =
              double.tryParse(flight.price?.publishedPrice ?? '0') ?? 0;
          return publishedPrice < event.filterData.minPublishedFare! ||
              publishedPrice > event.filterData.maxPublishedFare!;
        });

        log('Filtered flights (by price range): ${filteredFlightData.datam!.length}');
      }

      // Determine if any filters are actually applied
      final bool hasActiveFilters = (event.filterData.departureTime != null &&
              event.filterData.departureTime!.isNotEmpty) ||
          (event.filterData.stops != null &&
              event.filterData.stops!.isNotEmpty) ||
          (event.filterData.aircraftCodes != null &&
              event.filterData.aircraftCodes!.isNotEmpty) ||
          (event.filterData.minPublishedFare != null &&
              event.filterData.maxPublishedFare != null);

      //filter airlines
      List<AirlineModel> airlines = [];
      airlines = event.airlines;

      for (AirlineModel airline in airlines) {
        final String carrierCode = airline.code;
        int totalFlights = 0;
        for (var flight in filteredFlightData.datam ?? []) {
          for (var itinerary in flight.itineraries ?? []) {
            for (var segment in itinerary.segments ?? []) {
              final aircraftCode = segment.carrierCode;
              if (aircraftCode != null && aircraftCode == carrierCode) {
                totalFlights++;
              }
            }
          }
        }
        airline.totalFlights = totalFlights;
      }

      emit(
        FlightLoaded(
          isFiltered: hasActiveFilters,
          filteredData: hasActiveFilters ? filteredFlightData : null,
          data: flightData,
          // airlines: event.airlines,
          airlines: airlines,
          currentFilter: hasActiveFilters ? event.filterData : null,
          minOfferFare: event.minOfferFare,
          maxOfferFare: event.maxOfferFare,
          minPublishedFare: event.minPublishedFare,
          maxPublishedFare: event.maxPublishedFare,
        ),
      );
    } catch (e) {
      emit(FlightSearchingError(message: '$e'));
    }
  }

  Future<void> _handleClearFilter(
      ClearFilterEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightSearching());
      // Extract aircraft codes from the flight data
      final List<String> aircaftCodes = [];
      for (var flight in event.flightData.datam ?? []) {
        for (var itinerary in flight.itineraries ?? []) {
          for (var segment in itinerary.segments ?? []) {
            final aircraftCode = segment.aircraft?.code;
            if (aircraftCode != null && !aircaftCodes.contains(aircraftCode)) {
              aircaftCodes.add(aircraftCode);
            }
          }
        }
      }
      List<AirlineModel> airlines = [];
      airlines = event.airlines;

      for (AirlineModel airline in airlines) {
        final String carrierCode = airline.code;
        int totalFlights = 0;
        for (var flight in event.flightData.datam ?? []) {
          for (var itinerary in flight.itineraries ?? []) {
            for (var segment in itinerary.segments ?? []) {
              final aircraftCode = segment.carrierCode;
              if (aircraftCode != null && aircraftCode == carrierCode) {
                totalFlights++;
              }
            }
          }
        }
        airline.totalFlights = totalFlights;
      }

      emit(FlightLoaded(
        data: event.flightData,
        airlines: airlines,
        isFiltered: false,
        minOfferFare: event.minOfferFare,
        maxOfferFare: event.maxOfferFare,
        minPublishedFare: event.minPublishedFare,
        maxPublishedFare: event.maxPublishedFare,
      ));
    } catch (e) {
      emit(FlightSearchingError(message: '$e'));
    }
  }

  Future<void> _handleGetSeatMapData(
      GetSeatMapDataEvent event, Emitter<FlightState> emit) async {
    try {
      emit(SeatMapLoading());
      final ApiResponse<SeatMapDataModel> res = await repository.getSeatMapData(
          flightOfferData: event.flightOfferData);
      if (res.errorMessage != null) {
        emit(SeatMapError(message: res.errorMessage!));
        return;
      } else {
        final Map<String, dynamic> coordinateMap = <String, dynamic>{};
        if (res.data != null) {
          res.data?.seatData?.first.decks?.first.seats?.forEach((seat) {
            coordinateMap['${seat.coordinates?.x}-${seat.coordinates?.y}'] =
                seat;
          });
          res.data?.seatData?.first.decks?.first.facilities?.forEach((seat) {
            coordinateMap['${seat.coordinates?.x}-${seat.coordinates?.y}'] =
                seat;
          });
        }
        emit(SeatMapLoaded(data: res.data!, coordinateMap: coordinateMap));
      }
    } catch (e) {
      emit(SeatMapError(message: '$e'));
    }
  }
}

String getCalculatedPrice(
    {required String basePrice, required String type, required String value}) {
  double price = double.parse(basePrice);
  if (type == 'Fixed') {
    final double amount = double.parse(value);
    price += amount;
    return price.toStringAsFixed(2);
  }
  final amount = (price * double.parse(value)) / 100;
  price += amount;
  return price.toStringAsFixed(2);
}

int getDurationInMinutes(String duration) {
  // Regex looks for numbers before 'H' and 'M'
  final hoursMatch = RegExp(r'(\d+)H').firstMatch(duration);
  final minutesMatch = RegExp(r'(\d+)M').firstMatch(duration);

  final hours = int.parse(hoursMatch?.group(1) ?? '0');
  final minutes = int.parse(minutesMatch?.group(1) ?? '0');

  return (hours * 60) + minutes;
}
