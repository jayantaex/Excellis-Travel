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

      final ApiResponse<FlightsDataModel> res =
          await repository.searchFlight(body: event.body);

      if (res.data == null) {
        emit(FlightSearchingError(
          message: '${res.errorMessage}',
        ));
        return;
      }

      if (res.data?.datam?.isNotEmpty ?? false) {
        // Sort by grand total price
        res.data!.datam?.sort((a, b) => double.parse(a.price!.grandTotal!)
            .compareTo(double.parse(b.price!.grandTotal!)));

        // FIX: Fetch markup config ONCE instead of calling API for each flight (N+1 → 1)
        final ApiResponse<MyMarkup> myMarkup = await repository.getMyMarkup();
        final String markupFareType = myMarkup.data?.fareType ?? 'Fixed';
        final String markupValue = myMarkup.data?.value ?? '0';

        // Calculate offer/published prices locally instead of N API calls
        for (final FlightOfferDatam element in res.data!.datam!) {
          final double grandTotal = double.parse(element.price!.grandTotal!);
          // Compute markup price locally (same logic as getMarkUpPrice API)
          element.price?.offerPrice = grandTotal.toStringAsFixed(2);
          element.price?.publishedPrice = getCalculatedPrice(
              basePrice: grandTotal.toStringAsFixed(2),
              type: markupFareType,
              value: markupValue);
        }

        // FIX: Single pass to compute min/max fares + extract airlines + count flights
        double minOfferFare = double.infinity;
        double maxOfferFare = double.negativeInfinity;
        double minPublishedFare = double.infinity;
        double maxPublishedFare = double.negativeInfinity;
        final Map<String, AirlineModel> airlineMap = {};
        final Map<String, int> airlineFlightCounts = {};
        final carriers = res.data!.dictionaries?.dictionaries.carriers;

        for (final FlightOfferDatam flight in res.data!.datam!) {
          // Track min/max fares
          final double offerFare = double.parse(flight.price!.offerPrice!);
          final double publishedFare =
              double.parse(flight.price!.publishedPrice!);

          if (offerFare < minOfferFare) minOfferFare = offerFare;
          if (offerFare > maxOfferFare) maxOfferFare = offerFare;
          if (publishedFare < minPublishedFare) {
            minPublishedFare = publishedFare;
          }
          if (publishedFare > maxPublishedFare) {
            maxPublishedFare = publishedFare;
          }

          // Extract unique airlines + count flights per carrier in one pass
          if (flight.itineraries != null) {
            // Count by first segment's carrier (for flight count)
            final String? primaryCarrier =
                flight.itineraries!.first.segments?.first.carrierCode;
            if (primaryCarrier != null) {
              airlineFlightCounts[primaryCarrier] =
                  (airlineFlightCounts[primaryCarrier] ?? 0) + 1;
            }

            for (final Itinerary itinerary in flight.itineraries!) {
              if (itinerary.segments == null) continue;
              for (final Segment segment in itinerary.segments!) {
                final String? code = segment.carrierCode;
                if (code != null && !airlineMap.containsKey(code)) {
                  airlineMap[code] = AirlineModel(
                    name: (carriers != null && carriers.containsKey(code))
                        ? (carriers[code] ?? 'No-Name')
                        : 'No-Name',
                    code: code,
                    totalFlights: 0,
                    totalFare: 0.0,
                  );
                }
              }
            }
          }
        }

        // Apply flight counts to airline models
        final List<AirlineModel> airlines = airlineMap.values.toList();
        for (final airline in airlines) {
          airline.totalFlights = airlineFlightCounts[airline.code] ?? 0;
        }

        // Handle edge case when infinity values remain (shouldn't happen with non-empty list)
        if (minOfferFare == double.infinity) minOfferFare = 0;
        if (maxOfferFare == double.negativeInfinity) maxOfferFare = 0;
        if (minPublishedFare == double.infinity) minPublishedFare = 0;
        if (maxPublishedFare == double.negativeInfinity) {
          maxPublishedFare = 0;
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
      } else {
        emit(
          FlightLoaded(
            data: FlightsDataModel(),
            airlines: const [],
            isFiltered: false,
            minOfferFare: 0,
            maxOfferFare: 0,
            minPublishedFare: 0,
            maxPublishedFare: 0,
          ),
        );
      }

      return;
    } catch (e) {
      log('FlightSearch error: $e', name: 'Flight Bloc');
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
          sortedData.datam!.sort((a, b) => DateTime.parse(
                  a.itineraries!.first.segments!.first.departure!.at!)
              .compareTo(DateTime.parse(
                  b.itineraries!.first.segments!.first.departure!.at!)));
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
              getDurationInMinutes(a.itineraries!.first.duration!).compareTo(
                  getDurationInMinutes(b.itineraries!.first.duration!)));
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
            }
            break;

          default:
        }
      }

      // Filter by aircraft codes (airlines)
      if (event.filterData.aircraftCodes != null &&
          event.filterData.aircraftCodes!.isNotEmpty) {
        filteredFlightData.datam!.removeWhere((flight) {
          final departureAircraftCode =
              flight.itineraries!.first.segments!.first.carrierCode;
          return !event.filterData.aircraftCodes!
              .contains(departureAircraftCode);
        });
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

      // Count flights per airline in a single pass O(flights) instead of O(airlines * flights)
      final Map<String, int> filteredCounts = {};
      for (final flight in filteredFlightData.datam ?? []) {
        final String? code =
            flight.itineraries?.first.segments?.first.carrierCode;
        if (code != null) {
          filteredCounts[code] = (filteredCounts[code] ?? 0) + 1;
        }
      }
      final List<AirlineModel> airlines = event.airlines.map((a) {
        return AirlineModel(
          name: a.name,
          code: a.code,
          totalFlights: filteredCounts[a.code] ?? 0,
          totalFare: a.totalFare,
        );
      }).toList();
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
      // Count flights per airline in a single pass
      final Map<String, int> clearCounts = {};
      for (final flight in event.flightData.datam ?? []) {
        final String? code =
            flight.itineraries?.first.segments?.first.carrierCode;
        if (code != null) {
          clearCounts[code] = (clearCounts[code] ?? 0) + 1;
        }
      }
      final List<AirlineModel> airlines = event.airlines.map((a) {
        return AirlineModel(
          name: a.name,
          code: a.code,
          totalFlights: clearCounts[a.code] ?? 0,
          totalFare: a.totalFare,
        );
      }).toList();

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

  String getCalculatedPrice(
      {required String basePrice,
      required String type,
      required String value}) {
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
}
