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

//flight offer price
final class FlightOfferPriceLoading extends FlightState {}

final class FlightOfferPriceLoaded extends FlightState {
  final FlightOfferPriceDataModel data;

  const FlightOfferPriceLoaded({required this.data});
}

final class FlightOfferPriceError extends FlightState {
  final String message;
  const FlightOfferPriceError({required this.message});
}

final class FlightOrderCreated extends FlightState {
  final FlightOrderModel order;

  const FlightOrderCreated({
    required this.order,
  });
}

final class FlightOrderLoading extends FlightState {
  const FlightOrderLoading();
}

final class FlightOrderCreationError extends FlightState {
  final String error;
  const FlightOrderCreationError({required this.error});
}
