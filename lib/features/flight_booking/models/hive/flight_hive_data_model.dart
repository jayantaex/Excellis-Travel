import 'package:hive/hive.dart';
part 'flight_hive_data_model.g.dart';

@HiveType(typeId: 0)
class FlightHiveDataModel {
  @HiveField(0)
  final Datam? datam;

  FlightHiveDataModel({this.datam});
}

@HiveType(typeId: 1)
class Datam {
  @HiveField(0)
  final String? type;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? source;
  @HiveField(3)
  final bool? instantTicketingRequired;
  @HiveField(4)
  final bool? nonHomogeneous;
  @HiveField(5)
  final bool? oneWay;
  @HiveField(6)
  final bool? isUpsellOffer;
  @HiveField(7)
  final String? lastTicketingDate;
  @HiveField(8)
  final String? lastTicketingDateTime;
  @HiveField(9)
  final int? numberOfBookableSeats;
  @HiveField(10)
  final List<Itinerary>? itineraries;
  @HiveField(11)
  final DatamPrice? price;
  @HiveField(12)
  final PricingOptions? pricingOptions;
  @HiveField(13)
  final List<String>? validatingAirlineCodes;
  @HiveField(14)
  final List<TravelerPricing>? travelerPricings;

  Datam({
    this.type,
    this.id,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.oneWay,
    this.isUpsellOffer,
    this.lastTicketingDate,
    this.lastTicketingDateTime,
    this.numberOfBookableSeats,
    this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    this.travelerPricings,
  });
}

@HiveType(typeId: 2)
class Itinerary {
  @HiveField(0)
  final String? duration;
  @HiveField(1)
  final List<Segment>? segments;

  Itinerary({this.duration, this.segments});
}

@HiveType(typeId: 3)
class Segment {
  @HiveField(0)
  final Departure? departure;
  @HiveField(1)
  final Arrival? arrival;
  @HiveField(2)
  final String? carrierCode;
  @HiveField(3)
  final String? number;
  @HiveField(4)
  final Aircraft? aircraft;
  @HiveField(5)
  final Operating? operating;
  @HiveField(6)
  final String? duration;
  @HiveField(7)
  final String? id;
  @HiveField(8)
  final int? numberOfStops;
  @HiveField(9)
  final bool? blacklistedInEu;

  Segment({
    this.departure,
    this.arrival,
    this.carrierCode,
    this.number,
    this.aircraft,
    this.operating,
    this.duration,
    this.id,
    this.numberOfStops,
    this.blacklistedInEu,
  });
}

@HiveType(typeId: 4)
class Departure {
  @HiveField(0)
  final String? iataCode;
  @HiveField(1)
  final String? terminal;
  @HiveField(2)
  final String? at;

  Departure({this.iataCode, this.terminal, this.at});
}

@HiveType(typeId: 5)
class Arrival {
  @HiveField(0)
  final String? iataCode;
  @HiveField(1)
  final String? terminal;
  @HiveField(2)
  final String? at;

  Arrival({
    this.iataCode,
    this.at,
    this.terminal,
  });
}

@HiveType(typeId: 6)
class Aircraft {
  @HiveField(0)
  final String? code;

  Aircraft({this.code});
}

@HiveType(typeId: 7)
class Operating {
  @HiveField(0)
  final String? carrierCode;

  Operating({this.carrierCode});
}

@HiveType(typeId: 8)
class DatamPrice {
  @HiveField(0)
  final String? currency;
  @HiveField(1)
  final String? total;
  @HiveField(2)
  final String? base;
  @HiveField(3)
  final List<Fee>? fees;
  @HiveField(4)
  final String? grandTotal;

  DatamPrice(
      {this.currency, this.total, this.base, this.fees, this.grandTotal});
}

@HiveType(typeId: 9)
class Fee {
  @HiveField(0)
  final String? amount;
  @HiveField(1)
  final String? type;

  Fee({this.amount, this.type});
}

@HiveType(typeId: 10)
class PricingOptions {
  @HiveField(0)
  final List<String>? fareType;
  @HiveField(1)
  final bool? includedCheckedBagsOnly;

  PricingOptions({this.fareType, this.includedCheckedBagsOnly});
}

@HiveType(typeId: 11)
class TravelerPricing {
  @HiveField(0)
  final String? travelerId;
  @HiveField(1)
  final String? fareOption;
  @HiveField(2)
  final String? travelerType;
  @HiveField(3)
  final TravelerPricingPrice? price;
  @HiveField(4)
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  TravelerPricing(
      {this.travelerId,
      this.fareOption,
      this.travelerType,
      this.price,
      this.fareDetailsBySegment});
}

@HiveType(typeId: 12)
class TravelerPricingPrice {
  @HiveField(0)
  final String? currency;
  @HiveField(1)
  final String? total;
  @HiveField(2)
  final String? base;

  TravelerPricingPrice({this.currency, this.total, this.base});
}

@HiveType(typeId: 13)
class FareDetailsBySegment {
  @HiveField(0)
  final String? segmentId;
  @HiveField(1)
  final String? cabin;
  @HiveField(2)
  final String? fareBasis;
  @HiveField(3)
  final String? brandedFare;
  @HiveField(4)
  final String? brandedFareLabel;
  @HiveField(5)
  final String? fareDetailsBySegmentClass;
  @HiveField(6)
  final IncludedCBags? includedCheckedBags;
  @HiveField(7)
  final IncludedCBags? includedCabinBags;
  @HiveField(8)
  final List<Amenity>? amenities;

  FareDetailsBySegment({
    this.segmentId,
    this.cabin,
    this.fareBasis,
    this.brandedFare,
    this.brandedFareLabel,
    this.fareDetailsBySegmentClass,
    this.includedCheckedBags,
    this.includedCabinBags,
    this.amenities,
  });
}

@HiveType(typeId: 14)
class IncludedCBags {
  @HiveField(0)
  final int? weight;
  @HiveField(1)
  final String? weightUnit;

  IncludedCBags({this.weight, this.weightUnit});
}

@HiveType(typeId: 15)
class Amenity {
  @HiveField(0)
  final String? description;
  @HiveField(1)
  final bool? isChargeable;
  @HiveField(2)
  final String? amenityType;
  @HiveField(3)
  final AmenityProvider? amenityProvider;

  Amenity(
      {this.description,
      this.isChargeable,
      this.amenityType,
      this.amenityProvider});
}

@HiveType(typeId: 16)
class AmenityProvider {
  @HiveField(0)
  final String? name;

  AmenityProvider({this.name});
}
