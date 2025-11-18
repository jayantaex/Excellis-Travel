import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../data/flight_booking_repository.dart';
import '../models/air_port_model.dart';
import '../models/create_order_res.dart';
import '../models/flight_offer_price_model.dart'
    show FlightOfferPriceDataModel, MyMarkup;
import '../models/flights_data_model.dart' show Datam, FlightsDataModel;
import '../models/payment_verify_res_model.dart';
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

      for (Datam element in res.data!.datam!) {
        final ApiResponse<double> res = await repository.getMarkUpPrice(
            basePrice: double.parse(element.price!.grandTotal!));
        element.price?.markupPrice = res.data!.toStringAsFixed(2);
        log(element.price?.markupPrice ?? 'No data');
      }

      emit(FlightLoaded(data: res.data!));
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

      log('My Markup: ${myMarkup.data?.toJson()}');
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
      log('res ${res.data?.id}');
      log('res ${res.data?.id}');
      log('res ${res.data?.id}');
      if (res.data == null) {
        emit(FlightOrderCreationError(
            error: res.errorMessage ?? 'Something went wrong'));
        return;
      }
      log('******************');
      emit(FlightOrderCreated(data: res.data!));
    } catch (e) {
      emit(FlightOrderCreationError(error: '$e'));
    }
  }

  Future<void> _handleVerifyPayment(
      VerifyPayment event, Emitter<FlightState> emit) async {
    final ApiResponse<PaymentVerifiedModel> res =
        await repository.verifyPayment(body: event.body);

    if (res.data == null) {
      emit(FlightOrderCreationError(
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
        log('resp ${resp.errorMessage}');
        emit(FlightSearchingError(message: '${resp.errorMessage}'));
      }
    } catch (e) {
      emit(FlightSearchingError(message: '$e'));
    }
  }

  FutureOr<void> _handleOfferFareToggle(
      ToggleFareOption event, Emitter<FlightState> emit) {
    if (state is OfferPriceEnabledState) {
      emit(OfferPriceDisabledState());
    } else {
      emit(OfferPriceEnabledState());
    }
  }
}
