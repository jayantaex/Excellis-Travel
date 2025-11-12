import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/flight_booking_repository.dart';
import '../models/air_port_model.dart';
import '../models/create_order_res.dart';
import '../models/flight_offer_price_model.dart' show FlightOfferPriceDataModel;
import '../models/flights_data_model.dart' show FlightsDataModel;
import '../models/payment_verify_res_model.dart';
part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final FlightBookingRepository repository;
  FlightBloc({
    required this.repository,
  }) : super(FlightInitial()) {
    on<SearchAirportEvent>(_handleAirportSearch);
    on<SearchFlightsEvent>(_handleFlightSearch);
    on<GetMarkupPrice>(_handleMarkupPrice);
    on<GetFlightsOfferPriceEvent>(_handleFlightOfferPrice);
    on<CreateFlightOrder>(_handleCreateFlightOrder);
    on<VerifyPayment>(_handleVerifyPayment);
  }

  Future<void> _handleAirportSearch(
      SearchAirportEvent event, Emitter<FlightState> emit) async {
    try {
      emit(AirportSearching());
      List<AirportModel> airportList =
          await repository.getAirport(keyword: event.keyword);
      emit(AirportLoaded(airports: airportList));
    } catch (e) {
      emit(AirportSearchingError(
        message: "$e",
      ));
    }
  }

  Future<void> _handleFlightSearch(
      SearchFlightsEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightSearching());
      ApiResponse<FlightsDataModel> res =
          await repository.searchFlight(body: event.body);
      if (res.data == null) {
        emit(FlightSearchingError(
          message: "${res.errorMessage}",
        ));
        return;
      }

      for (var element in res.data!.datam!) {
        ApiResponse<double> res = await repository.getMarkUpPrice(
            basePrice: double.parse(element.price!.grandTotal!));
        element.price?.markupPrice = res.data!.toStringAsFixed(2);
        log(element.price?.markupPrice ?? 'No data');
      }

      emit(FlightLoaded(data: res.data!));
    } catch (e) {
      emit(FlightSearchingError(
        message: "$e",
      ));
    }
  }

  Future<void> _handleFlightOfferPrice(
      GetFlightsOfferPriceEvent event, Emitter<FlightState> emit) async {
    try {
      emit(FlightOfferPriceLoading());
      ApiResponse<FlightOfferPriceDataModel> res =
          await repository.getFlightOfferPrice(body: event.offerData);

      if (res.data == null) {
        emit(FlightOfferPriceError(
          message: "${res.errorMessage}",
        ));
        return;
      }
      ApiResponse<double> markupRes = await repository.getMarkUpPrice(
        basePrice: double.parse(
            res.data!.data!.flightOffers!.first.price!.grandTotal!),
      );

      res.data!.data!.flightOffers!.first.price?.markup =
          markupRes.data!.toStringAsFixed(2);
      emit(FlightOfferPriceLoaded(data: res.data!));
    } catch (e) {
      emit(FlightOfferPriceError(
        message: "$e",
      ));
    }
  }

  Future<void> _handleCreateFlightOrder(
      CreateFlightOrder event, Emitter<FlightState> emit) async {
    try {
      emit(const FlightOrderLoading());
      // ApiResponse<FlightOrderModel> data =
      //     await repository.createOrder(body: event.body);
      ApiResponse<OrderModel> res =
          await repository.createPayment(body: event.body);
      log('res ${res.data?.id}');
      log('res ${res.data?.id}');
      log('res ${res.data?.id}');
      if (res.data == null) {
        emit(FlightOrderCreationError(
            error: res.errorMessage ?? 'Something went wrong'));
        return;
      }
      log("******************");
      emit(FlightOrderCreated(data: res.data!));
    } catch (e) {
      emit(FlightOrderCreationError(error: "$e"));
    }
  }

  Future<void> _handleVerifyPayment(
      VerifyPayment event, Emitter<FlightState> emit) async {
    ApiResponse<PaymentVerifiedModel> res =
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
      ApiResponse<double> resp =
          await repository.getMarkUpPrice(basePrice: event.baseAmount);
      if (resp.data == null) {
        log("resp ${resp.errorMessage}");
        emit(FlightSearchingError(message: "${resp.errorMessage}"));
      }
    } catch (e) {
      emit(FlightSearchingError(message: "$e"));
    }
  }
}
