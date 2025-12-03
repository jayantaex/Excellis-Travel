class FilterDataModel {
  FilterDataModel({
    this.departureTime,
    this.stops,
    this.minPrice,
    this.maxPrice,
    this.aircraftCodes,
  });
  final String? departureTime;
  final String? stops;
  final double? minPrice;
  final double? maxPrice;
  final List<String>? aircraftCodes;
}
