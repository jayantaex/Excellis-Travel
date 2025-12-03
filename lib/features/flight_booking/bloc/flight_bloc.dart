import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../data/repository/flight_booking_repository.dart';
import '../data/models/air_port_model.dart';
import '../data/models/create_order_res.dart';
import '../data/models/flight_offer_price_model.dart'
    show FlightOfferPriceDataModel, MyMarkup;
import '../data/models/flights_data_model.dart' show Datam, FlightsDataModel;
import '../data/models/payment_verify_res_model.dart';
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

      //filering the array by departure time
      res.data!.datam?.sort((a, b) => a
          .itineraries!.first.segments!.first.departure!.at!
          .compareTo(b.itineraries!.first.segments!.first.departure!.at!));
      log("/////////////////////////////");
      double publishFare = 0.0;
      final ApiResponse<MyMarkup> myMarkup = await repository.getMyMarkup();
      if (myMarkup.data != null) {
        log('+++++++++++++++${myMarkup.data?.value}=============');
        log('+++++++++++++++${myMarkup.data?.fareType}=============');
      }
      for (Datam element in res.data!.datam!) {
        final ApiResponse<double> res = await repository.getMarkUpPrice(
            basePrice: double.parse(element.price!.grandTotal!));
        element.price?.offerPrice = res.data!.toStringAsFixed(2);
        element.price?.publishedPrice = getCalculatedPrice(
            basePrice: res.data!.toStringAsFixed(2),
            type: myMarkup.data?.fareType ?? 'Fixed',
            value: myMarkup.data?.value ?? '0');
      }

      //filtering the array by aircraft codes
      final List<String> aircaftCodes = [];
      for (var flight in res.data!.datam ?? []) {
        for (var itinerary in flight.itineraries ?? []) {
          for (var segment in itinerary.segments ?? []) {
            final aircraftCode = segment.aircraft?.code;
            if (aircraftCode != null && !aircaftCodes.contains(aircraftCode)) {
              aircaftCodes.add(aircraftCode);
            }
          }
        }
      }

      emit(FlightLoaded(data: res.data!, aircaftCodes: aircaftCodes));
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
      res.data!.data!.flightOffers!.first.price?.markup =
          markupRes.data!.toStringAsFixed(2);
      final ApiResponse<MyMarkup> myMarkup = await repository.getMyMarkup();
      res.data!.data!.myMarkup = myMarkup.data;
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
      emit(FlightOrderCreated(data: res.data!));
    } catch (e) {
      emit(FlightOrderCreationError(error: '$e'));
    }
  }

  Future<void> _handleVerifyPayment(
      VerifyPayment event, Emitter<FlightState> emit) async {
    final ApiResponse<PaymentVarifiedDataModel> res =
        await repository.verifyPayment(body: event.body);

    if (res.data == null) {
      emit(FlightPaymentVerificationFailed(
          error: res.errorMessage ?? 'Something went wrong'));
      return;
    }

    emit(FlightPaymentVerified(data: res.data!));
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
      FlightsDataModel flightData = FlightsDataModel();
      flightData = event.flightData;
      emit(FlightSearching());

      switch (event.filterName) {
        case 'All':
          {
            //filtering the array by aircraft codes
            final List<String> aircaftCodes = [];
            for (var flight in flightData.datam ?? []) {
              for (var itinerary in flight.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  final aircraftCode = segment.aircraft?.code;
                  if (aircraftCode != null &&
                      !aircaftCodes.contains(aircraftCode)) {
                    aircaftCodes.add(aircraftCode);
                  }
                }
              }
            }
            flightData.datam!.sort((a, b) => a
                .itineraries!.first.segments!.first.arrival!.at!
                .compareTo(b.itineraries!.first.segments!.first.arrival!.at!));

            emit(FlightLoaded(data: flightData, aircaftCodes: aircaftCodes));
          }
          break;

        case 'Lowest Price':
          {
            final List<String> aircaftCodes = [];
            for (var flight in flightData.datam ?? []) {
              for (var itinerary in flight.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  final aircraftCode = segment.aircraft?.code;
                  if (aircraftCode != null &&
                      !aircaftCodes.contains(aircraftCode)) {
                    aircaftCodes.add(aircraftCode);
                  }
                }
              }
            }
            flightData.datam!.sort((a, b) => double.parse(a.price!.offerPrice!)
                .compareTo(double.parse(b.price!.offerPrice!)));

            emit(FlightLoaded(data: flightData, aircaftCodes: aircaftCodes));
          }
          break;
        case 'Highest Price':
          {
            final List<String> aircaftCodes = [];
            for (var flight in flightData.datam ?? []) {
              for (var itinerary in flight.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  final aircraftCode = segment.aircraft?.code;
                  if (aircraftCode != null &&
                      !aircaftCodes.contains(aircraftCode)) {
                    aircaftCodes.add(aircraftCode);
                  }
                }
              }
            }
            flightData.datam!.sort(
              (a, b) => double.parse(b.price!.offerPrice!).compareTo(
                double.parse(a.price!.offerPrice!),
              ),
            );
            emit(FlightLoaded(data: flightData, aircaftCodes: aircaftCodes));
          }
          break;
        case 'Non Stop First':
          {
            final List<String> aircaftCodes = [];
            for (var flight in flightData.datam ?? []) {
              for (var itinerary in flight.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  final aircraftCode = segment.aircraft?.code;
                  if (aircraftCode != null &&
                      !aircaftCodes.contains(aircraftCode)) {
                    aircaftCodes.add(aircraftCode);
                  }
                }
              }
            }
            flightData.datam!.sort((a, b) => a
                .itineraries!.first.segments!.length
                .compareTo(b.itineraries!.first.segments!.length));
            emit(FlightLoaded(data: flightData, aircaftCodes: aircaftCodes));
          }
          break;
        case 'Non Stop Last':
          {
            final List<String> aircaftCodes = [];
            for (var flight in flightData.datam ?? []) {
              for (var itinerary in flight.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  final aircraftCode = segment.aircraft?.code;
                  if (aircraftCode != null &&
                      !aircaftCodes.contains(aircraftCode)) {
                    aircaftCodes.add(aircraftCode);
                  }
                }
              }
            }
            flightData.datam!.sort((a, b) => b
                .itineraries!.first.segments!.length
                .compareTo(a.itineraries!.first.segments!.length));
            emit(FlightLoaded(data: flightData, aircaftCodes: aircaftCodes));
          }
          break;
        case 'Aircraft':
          {
            final List<String> aircaftCodes = [];
            for (var flight in flightData.datam ?? []) {
              for (var itinerary in flight.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  final aircraftCode = segment.aircraft?.code;
                  if (aircraftCode != null &&
                      !aircaftCodes.contains(aircraftCode)) {
                    aircaftCodes.add(aircraftCode);
                  }
                }
              }
            }
            flightData.datam!.retainWhere((element) {
              // Check if any segment in any itinerary uses one of the selected aircraft
              for (var itinerary in element.itineraries ?? []) {
                for (var segment in itinerary.segments ?? []) {
                  if (event.selectedAircraftCode!
                      .contains(segment.aircraft?.code)) {
                    return true;
                  }
                }
              }
              return false;
            });

            emit(FlightLoaded(data: flightData, aircaftCodes: aircaftCodes));
          }
          break;

        default:
          emit(FlightLoaded(data: flightData, aircaftCodes: const []));
      }
    } catch (e) {
      emit(FlightSearchingError(message: '$e'));
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
