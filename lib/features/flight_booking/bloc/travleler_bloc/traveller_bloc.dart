import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/traveller_data_model.dart';
import '../../data/repository/flight_booking_repository.dart';

part 'traveller_event.dart';
part 'traveller_state.dart';

class TravellerBloc extends Bloc<TravellerEvent, TravellerState> {
  TravellerBloc({required this.repository}) : super(TravellerInitial()) {
    on<GetTravelersEvent>(_handleGetTravelers);
    on<CreateTravelerEvent>(_handleCreateTraveler);
  }
  final FlightBookingRepository repository;

  Future<void> _handleGetTravelers(
      GetTravelersEvent event, Emitter<TravellerState> emit) async {
    emit(TravellerLoading());
    try {
      final ApiResponse<List<TravelerDataModel>> travelers =
          await repository.getTravelers();
      emit(TravellerLoaded(data: travelers.data ?? []));
    } catch (e) {
      emit(TravellerError(error: e.toString()));
    }
  }

  Future<void> _handleCreateTraveler(
      CreateTravelerEvent event, Emitter<TravellerState> emit) async {
    emit(TravellerLoading());
    try {
      await repository.createTraveler(body: event.body);
      emit(const TravellerCreated());
    } catch (e) {
      emit(TravellerError(error: e.toString()));
    }
  }
}
