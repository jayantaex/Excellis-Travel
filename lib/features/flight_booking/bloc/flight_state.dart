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
  const AirportLoaded({
    required this.airports,
  });
  final List<AirportModel> airports;
}

final class AirportSearchingError extends FlightState {
  const AirportSearchingError({required this.message});
  final String message;
}

//flight searching

final class FlightSearching extends FlightState {}

final class FlightLoaded extends FlightState {
  const FlightLoaded({
    required this.data,
  });
  final FlightsDataModel data;
}

final class FlightSearchingError extends FlightState {
  const FlightSearchingError({required this.message});
  final String message;
}

//flight offer price
final class FlightOfferPriceLoading extends FlightState {}

final class FlightOfferPriceLoaded extends FlightState {
  const FlightOfferPriceLoaded({required this.data});
  final FlightOfferPriceDataModel data;
}

final class FlightOfferPriceError extends FlightState {
  const FlightOfferPriceError({required this.message});
  final String message;
}

final class FlightOrderCreated extends FlightState {
  const FlightOrderCreated({
    required this.data,
  });
  final OrderModel data;
}

final class FlightOrderLoading extends FlightState {
  const FlightOrderLoading();
}

final class FlightOrderCreationError extends FlightState {
  const FlightOrderCreationError({required this.error});
  final String error;
}

final class FlightPaymentVerifing extends FlightState {
  const FlightPaymentVerifing();
}

final class FlightPaymentVerified extends FlightState {
  const FlightPaymentVerified({required this.data});
  final PaymentVarifiedDataModel data;
}

final class FlightPaymentVerificationFailed extends FlightState {
  const FlightPaymentVerificationFailed({required this.error});
  final String error;
}

final class OfferPriceEnabledState extends FlightState {}

final class OfferPriceDisabledState extends FlightState {}
