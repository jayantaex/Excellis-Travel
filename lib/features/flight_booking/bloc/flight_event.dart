part of 'flight_bloc.dart';

sealed class FlightEvent extends Equatable {
  const FlightEvent();

  @override
  List<Object> get props => [];
}

//airport searches

class SearchAirportEvent extends FlightEvent {
  final String countryCode;
  final String keyword;
  final String subType;
  const SearchAirportEvent({
    required this.countryCode,
    required this.keyword,
    required this.subType,
  });
}
//search flights

class SearchFlightsEvent extends FlightEvent {
  final Map<String, dynamic> body;
  const SearchFlightsEvent({required this.body});
}

class GetFlightsOfferPriceEvent extends FlightEvent {
  final Map<String, dynamic> offerData;
  const GetFlightsOfferPriceEvent({required this.offerData});
}

class CreateFlightOrder extends FlightEvent {
  final Map<String, dynamic> body;

  const CreateFlightOrder({required this.body});
}

class VerifyPayment extends FlightEvent {
  final Map<String, dynamic> body;
  const VerifyPayment({required this.body});
}

class GetMarkupPrice extends FlightEvent {
  final double baseAmount;
  const GetMarkupPrice({required this.baseAmount});
}
