class FilterDataModel {
  FilterDataModel({
    this.departureTime,
    this.stops,
    this.minPublishedFare,
    this.maxPublishedFare,
    this.minOfferFare,
    this.maxOfferFare,
    this.aircraftCodes,
  });
  final String? departureTime;
  final String? stops;
  final double? minPublishedFare;
  final double? maxPublishedFare;
  final double? minOfferFare;
  final double? maxOfferFare;
  final List<String>? aircraftCodes;
}
