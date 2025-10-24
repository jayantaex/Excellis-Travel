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
  final String originLocationCode;
  final String destinationLocationCode;
  final String departureDate;
  final String returnDate;
  final String adult;
  final String max;
  const SearchFlightsEvent(
      {required this.originLocationCode,
      required this.destinationLocationCode,
      required this.departureDate,
      required this.returnDate,
      required this.adult,
      required this.max});
}
