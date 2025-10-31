import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/flight_booking_repository.dart';
import '../models/air_port_model.dart';
import '../models/flights_data_model.dart';
part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final FlightBookingRepository repository;
  FlightBloc({
    required this.repository,
  }) : super(FlightInitial()) {
    on<SearchAirportEvent>(_handleAirportSearch);
    on<SearchFlightsEvent>(_handleFlightSearch);
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
      ApiResponse res = await repository.searchFlight(body: event.body);
      if (res.data == null) {
        emit(FlightSearchingError(
          message: "${res.errorMessage}",
        ));
        return;
      }
      emit(FlightLoaded(data: res.data!));
    } catch (e) {
      emit(FlightSearchingError(
        message: "$e",
      ));
    }
  }
}
