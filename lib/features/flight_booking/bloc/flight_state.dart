part of 'flight_bloc.dart';

sealed class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object> get props => [];
}

final class FlightInitial extends FlightState {}

//airport searches
final class AirportSearching extends FlightState {}

final class AirportLoaded extends FlightState {
  final List<AirportModel> airports;

  const AirportLoaded({
    required this.airports,
  });
}

final class AirportSearchingError extends FlightState {
  final String message;

  const AirportSearchingError({required this.message});
}

//flight searching

final class FlightSearching extends FlightState {}

final class FlightLoaded extends FlightState {
  final FlightsDataModel data;

  const FlightLoaded({
    required this.data,
  });
}

final class FlightSearchingError extends FlightState {
  final String message;

  const FlightSearchingError({required this.message});
}
