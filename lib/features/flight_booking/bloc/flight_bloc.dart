import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellistravel/core/network/api_response.dart';

import '../data/flight_booking_repository.dart';
import '../models/air_port_model.dart';

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
      ApiResponse resp = await repository.getAirport(
        countryCode: event.countryCode,
        subType: event.subType,
        keyword: event.keyword,
      );

      if (resp.data != null) {
        log('Airport loaded', name: 'FLIGHT BLOC');
        log('${resp.data.length}', name: 'FLIGHT BLOC');
        emit(AirportLoaded(airports: resp.data));
        return;
      }
      log('${resp.errorMessage}, ${resp.statusCode}',
          name: 'FLIGHT BLOC: Error');

      emit(AirportSearchingError(
        message: resp.errorMessage ?? 'Something went wrong',
      ));
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
    } catch (e) {
      emit(FlightSearchingError(
        message: "$e",
      ));
    }
  }
}
