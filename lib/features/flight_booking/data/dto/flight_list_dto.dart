class FlightDto {
  FlightDto({
    required this.itineraries,
    required this.offerFare,
    required this.publishedFare,
    required this.cabinClass,
    required this.flightData,
  });
  final List<ItineraryDto> itineraries;
  final double offerFare;
  final double publishedFare;
  final String cabinClass;
  final Map<String, dynamic> flightData;
}

class ItineraryDto {
  ItineraryDto({
    required this.departure,
    required this.arrival,
  });
  final AirportDto departure;
  final AirportDto arrival;
}

class AirportDto {
  AirportDto({
    required this.iataCode,
    required this.name,
    required this.city,
    required this.country,
    required this.terminal,
    required this.at,
  });
  final String iataCode;
  final String name;
  final String city;
  final String country;
  final String terminal;
  final String at;
}
