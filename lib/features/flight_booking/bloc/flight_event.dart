part of 'flight_bloc.dart';

sealed class FlightEvent extends Equatable {
  const FlightEvent();

  @override
  List<Object> get props => <Object>[];
}

//airport searches

class SearchAirportEvent extends FlightEvent {
  const SearchAirportEvent({
    required this.countryCode,
    required this.keyword,
    required this.subType,
  });
  final String countryCode;
  final String keyword;
  final String subType;
}
//search flights

class SearchFlightsEvent extends FlightEvent {
  const SearchFlightsEvent({required this.body});
  final Map<String, dynamic> body;
}

class GetFlightsOfferPriceEvent extends FlightEvent {
  const GetFlightsOfferPriceEvent({required this.offerData});
  final Map<String, dynamic> offerData;
}

class CreateFlightOrder extends FlightEvent {
  const CreateFlightOrder({required this.body});
  final Map<String, dynamic> body;
}

class VerifyPayment extends FlightEvent {
  const VerifyPayment({required this.body});
  final Map<String, dynamic> body;
}

class GetMarkupPrice extends FlightEvent {
  const GetMarkupPrice({required this.baseAmount});
  final double baseAmount;
}

class SortFlightEvent extends FlightEvent {
  const SortFlightEvent(
      {required this.flightData,
      required this.filterName,
      this.selectedAircraftCode});
  final String filterName;
  final FlightsDataModel flightData;
  final List<String>? selectedAircraftCode;
}

class ToggleFareOption extends FlightEvent {}
