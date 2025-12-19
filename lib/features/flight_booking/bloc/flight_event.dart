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
  const CreateFlightOrder({required this.body, required this.paymentVia});
  final Map<String, dynamic> body;
  final String paymentVia;
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
  const SortFlightEvent({
    required this.flightData,
    required this.filterName,
    required this.minOfferFare,
    required this.maxOfferFare,
    required this.minPublishedFare,
    required this.maxPublishedFare,
    required this.airlines,
    this.selectedAircraftCode,
    this.isFiltered = false,
    this.filteredData,
    this.currentFilter,
  });
  final String filterName;
  final FlightsDataModel flightData;
  final List<String>? selectedAircraftCode;
  final List<AirlineModel>? airlines;
  final bool isFiltered;
  final FlightsDataModel? filteredData;
  final FilterDataModel? currentFilter;
  final double minOfferFare;
  final double maxOfferFare;
  final double minPublishedFare;
  final double maxPublishedFare;
}

class FilterFlightEvent extends FlightEvent {
  const FilterFlightEvent({
    required this.filterData,
    required this.flightData,
    required this.minOfferFare,
    required this.maxOfferFare,
    required this.minPublishedFare,
    required this.maxPublishedFare,
    required this.airlines,
  });
  final FilterDataModel filterData;
  final FlightsDataModel flightData;
  final double minOfferFare;
  final double maxOfferFare;
  final double minPublishedFare;
  final double maxPublishedFare;
  final List<AirlineModel> airlines;
}

class ToggleFareOption extends FlightEvent {}

class ClearFilterEvent extends FlightEvent {
  const ClearFilterEvent({
    required this.flightData,
    required this.minOfferFare,
    required this.maxOfferFare,
    required this.minPublishedFare,
    required this.maxPublishedFare,
    required this.selectedAircraftCode,
    required this.airlines,
  });
  final FlightsDataModel flightData;
  final double minOfferFare;
  final double maxOfferFare;
  final double minPublishedFare;
  final double maxPublishedFare;
  final List<String> selectedAircraftCode;
  final List<AirlineModel> airlines;
}
