class AirlineModel {
  AirlineModel({
    required this.name,
    required this.code,
    required this.totalFlights,
    required this.totalFare,
  });
  final String name;
  final String code;
  int totalFlights;
  final double totalFare;
}
