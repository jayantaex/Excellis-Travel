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

class ChangeUserTypeEvent extends FlightEvent {
  final String userType;
  final List<TravelerPricing>? travelerPricings;
  const ChangeUserTypeEvent(
      {required this.userType, required this.travelerPricings});
}
