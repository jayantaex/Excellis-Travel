class FlightsDataModel {
  final Meta? meta;
  final List<Datam>? datam;
  final FlightDictionary? dictionaries;

  FlightsDataModel({this.meta, this.datam, this.dictionaries});

  factory FlightsDataModel.fromJson(Map<String, dynamic> json) =>
      FlightsDataModel(
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
        datam: json['data'] != null
            ? List<Datam>.from(json['data'].map((x) => Datam.fromJson(x)))
            : null,
        dictionaries: json['dictionaries'] != null
            ? FlightDictionary.fromJson(json['dictionaries'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'meta': meta?.toJson(),
        'data': datam != null
            ? List<dynamic>.from(datam!.map((x) => x.toJson()))
            : null,
      };
}

class Meta {
  final int? count;

  Meta({this.count});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'count': count,
      };
}

class Datam {
  final String? type;
  final String? id;
  final String? source;
  final bool? instantTicketingRequired;
  final bool? nonHomogeneous;
  final bool? oneWay;
  final bool? isUpsellOffer;
  final String? lastTicketingDate;
  final String? lastTicketingDateTime;
  final int? numberOfBookableSeats;
  final List<Itinerary>? itineraries;
  final DatamPrice? price;
  final PricingOptions? pricingOptions;
  final List<String>? validatingAirlineCodes;
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

  factory Datam.fromJson(Map<String, dynamic> json) => Datam(
        type: json['type'],
        id: json['id'],
        source: json['source'],
        instantTicketingRequired: json['instantTicketingRequired'],
        nonHomogeneous: json['nonHomogeneous'],
        oneWay: json['oneWay'],
        isUpsellOffer: json['isUpsellOffer'],
        lastTicketingDate: json['lastTicketingDate'] ?? '',
        lastTicketingDateTime: json['lastTicketingDateTime'] ?? '',
        numberOfBookableSeats: json['numberOfBookableSeats'],
        itineraries: json['itineraries'] != null
            ? List<Itinerary>.from(
                json['itineraries'].map((x) => Itinerary.fromJson(x)))
            : null,
        price:
            json['price'] != null ? DatamPrice.fromJson(json['price']) : null,
        pricingOptions: json['pricingOptions'] != null
            ? PricingOptions.fromJson(json['pricingOptions'])
            : null,
        validatingAirlineCodes: json['validatingAirlineCodes'] != null
            ? List<String>.from(json['validatingAirlineCodes'])
            : null,
        travelerPricings: json['travelerPricings'] != null
            ? List<TravelerPricing>.from(json['travelerPricings']
                .map((x) => TravelerPricing.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'source': source,
        'instantTicketingRequired': instantTicketingRequired,
        'nonHomogeneous': nonHomogeneous,
        'oneWay': oneWay,
        'isUpsellOffer': isUpsellOffer,
        'lastTicketingDate': lastTicketingDate,
        'lastTicketingDateTime': lastTicketingDateTime,
        'numberOfBookableSeats': numberOfBookableSeats,
        'itineraries': itineraries != null
            ? List<dynamic>.from(itineraries!.map((x) => x.toJson()))
            : null,
        'price': price?.toJson(),
        'pricingOptions': pricingOptions?.toJson(),
        'validatingAirlineCodes': validatingAirlineCodes,
        'travelerPricings': travelerPricings != null
            ? List<dynamic>.from(travelerPricings!.map((x) => x.toJson()))
            : null,
      };
}

class Itinerary {
  final String? duration;
  final List<Segment>? segments;

  Itinerary({this.duration, this.segments});

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        duration: json['duration'],
        segments: json['segments'] != null
            ? List<Segment>.from(
                json['segments'].map((x) => Segment.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'duration': duration,
        'segments': segments != null
            ? List<dynamic>.from(segments!.map((x) => x.toJson()))
            : null,
      };
}

class Segment {
  final Departure? departure;
  final Arrival? arrival;
  final String? carrierCode;
  final String? number;
  final Aircraft? aircraft;
  final Operating? operating;
  final String? duration;
  final String? id;
  final int? numberOfStops;
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

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        departure: json['departure'] != null
            ? Departure.fromJson(json['departure'])
            : null,
        arrival:
            json['arrival'] != null ? Arrival.fromJson(json['arrival']) : null,
        carrierCode: json['carrierCode'],
        number: json['number'],
        aircraft: json['aircraft'] != null
            ? Aircraft.fromJson(json['aircraft'])
            : null,
        operating: json['operating'] != null
            ? Operating.fromJson(json['operating'])
            : null,
        duration: json['duration'],
        id: json['id'],
        numberOfStops: json['numberOfStops'],
        blacklistedInEu: json['blacklistedInEU'],
      );

  Map<String, dynamic> toJson() => {
        'departure': departure?.toJson(),
        'arrival': arrival?.toJson(),
        'carrierCode': carrierCode,
        'number': number,
        'aircraft': aircraft?.toJson(),
        'operating': operating?.toJson(),
        'duration': duration,
        'id': id,
        'numberOfStops': numberOfStops,
        'blacklistedInEU': blacklistedInEu,
      };
}

class Departure {
  final String? iataCode;
  final String? terminal;
  final String? at;

  Departure({this.iataCode, this.terminal, this.at});

  factory Departure.fromJson(Map<String, dynamic> json) => Departure(
        iataCode: json['iataCode'],
        terminal: json['terminal'],
        at: json['at'],
      );

  Map<String, dynamic> toJson() => {
        'iataCode': iataCode,
        'terminal': terminal,
        'at': at,
      };
}

class Arrival {
  final String? iataCode;
  final String? terminal;
  final String? at;

  Arrival({
    this.iataCode,
    this.at,
    this.terminal,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        terminal: json['terminal'],
        iataCode: json['iataCode'],
        at: json['at'],
      );

  Map<String, dynamic> toJson() => {
        'iataCode': iataCode,
        'at': at,
        'terminal': terminal,
      };
}

class Aircraft {
  final String? code;

  Aircraft({this.code});

  factory Aircraft.fromJson(Map<String, dynamic> json) =>
      Aircraft(code: json['code']);

  Map<String, dynamic> toJson() => {'code': code};
}

class Operating {
  final String? carrierCode;

  Operating({this.carrierCode});

  factory Operating.fromJson(Map<String, dynamic> json) =>
      Operating(carrierCode: json['carrierCode']);

  Map<String, dynamic> toJson() => {'carrierCode': carrierCode};
}

class DatamPrice {
  final String? currency;
  final String? total;
  final String? base;
  final List<Fee>? fees;
  final String? grandTotal;
  String? markupPrice;

  DatamPrice(
      {this.currency,
      this.total,
      this.base,
      this.fees,
      this.grandTotal,
      this.markupPrice});

  factory DatamPrice.fromJson(Map<String, dynamic> json) => DatamPrice(
        currency: json['currency'],
        total: json['total'],
        base: json['base'],
        fees: json['fees'] != null
            ? List<Fee>.from(json['fees'].map((x) => Fee.fromJson(x)))
            : null,
        grandTotal: json['grandTotal'],
      );

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'total': total,
        'base': base,
        'fees': fees != null
            ? List<dynamic>.from(fees!.map((x) => x.toJson()))
            : null,
        'grandTotal': grandTotal,
      };
}

class Fee {
  final String? amount;
  final String? type;

  Fee({this.amount, this.type});

  factory Fee.fromJson(Map<String, dynamic> json) =>
      Fee(amount: json['amount'], type: json['type']);

  Map<String, dynamic> toJson() => {'amount': amount, 'type': type};
}

class PricingOptions {
  final List<String>? fareType;
  final bool? includedCheckedBagsOnly;

  PricingOptions({this.fareType, this.includedCheckedBagsOnly});

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
        fareType: json['fareType'] != null
            ? List<String>.from(json['fareType'])
            : null,
        includedCheckedBagsOnly: json['includedCheckedBagsOnly'],
      );

  Map<String, dynamic> toJson() => {
        'fareType': fareType,
        'includedCheckedBagsOnly': includedCheckedBagsOnly,
      };
}

class TravelerPricing {
  final String? travelerId;
  final String? fareOption;
  final String? travelerType;
  final TravelerPricingPrice? price;
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  TravelerPricing(
      {this.travelerId,
      this.fareOption,
      this.travelerType,
      this.price,
      this.fareDetailsBySegment});

  factory TravelerPricing.fromJson(Map<String, dynamic> json) =>
      TravelerPricing(
        travelerId: json['travelerId'],
        fareOption: json['fareOption'],
        travelerType: json['travelerType'],
        price: json['price'] != null
            ? TravelerPricingPrice.fromJson(json['price'])
            : null,
        fareDetailsBySegment: json['fareDetailsBySegment'] != null
            ? List<FareDetailsBySegment>.from(json['fareDetailsBySegment']
                .map((x) => FareDetailsBySegment.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'travelerId': travelerId,
        'fareOption': fareOption,
        'travelerType': travelerType,
        'price': price?.toJson(),
        'fareDetailsBySegment': fareDetailsBySegment != null
            ? List<dynamic>.from(fareDetailsBySegment!.map((x) => x.toJson()))
            : null,
      };
}

class TravelerPricingPrice {
  final String? currency;
  final String? total;
  final String? base;

  TravelerPricingPrice({this.currency, this.total, this.base});

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
          currency: json['currency'], total: json['total'], base: json['base']);

  Map<String, dynamic> toJson() =>
      {'currency': currency, 'total': total, 'base': base};
}

class FareDetailsBySegment {
  final String? segmentId;
  final String? cabin;
  final String? fareBasis;
  final String? brandedFare;
  final String? brandedFareLabel;
  final String? fareDetailsBySegmentClass;
  final IncludedCBags? includedCheckedBags;
  final IncludedCBags? includedCabinBags;
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

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) =>
      FareDetailsBySegment(
        segmentId: json['segmentId'],
        cabin: json['cabin'],
        fareBasis: json['fareBasis'],
        brandedFare: json['brandedFare'],
        brandedFareLabel: json['brandedFareLabel'],
        fareDetailsBySegmentClass: json['class'],
        includedCheckedBags: json['includedCheckedBags'] != null
            ? IncludedCBags.fromJson(json['includedCheckedBags'])
            : null,
        includedCabinBags: json['includedCabinBags'] != null
            ? IncludedCBags.fromJson(json['includedCabinBags'])
            : null,
        amenities: json['amenities'] != null
            ? List<Amenity>.from(
                json['amenities'].map((x) => Amenity.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'segmentId': segmentId,
        'cabin': cabin,
        'fareBasis': fareBasis,
        'brandedFare': brandedFare,
        'brandedFareLabel': brandedFareLabel,
        'class': fareDetailsBySegmentClass,
        'includedCheckedBags': includedCheckedBags?.toJson(),
        'includedCabinBags': includedCabinBags?.toJson(),
        'amenities': amenities != null
            ? List<dynamic>.from(amenities!.map((x) => x.toJson()))
            : null,
      };
}

class IncludedCBags {
  final int? weight;
  final String? weightUnit;

  IncludedCBags({this.weight, this.weightUnit});

  factory IncludedCBags.fromJson(Map<String, dynamic> json) =>
      IncludedCBags(weight: json['weight'], weightUnit: json['weightUnit']);

  Map<String, dynamic> toJson() => {'weight': weight, 'weightUnit': weightUnit};
}

class Amenity {
  final String? description;
  final bool? isChargeable;
  final String? amenityType;
  final AmenityProvider? amenityProvider;

  Amenity(
      {this.description,
      this.isChargeable,
      this.amenityType,
      this.amenityProvider});

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        description: json['description'],
        isChargeable: json['isChargeable'],
        amenityType: json['amenityType'],
        amenityProvider: json['amenityProvider'] != null
            ? AmenityProvider.fromJson(json['amenityProvider'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'isChargeable': isChargeable,
        'amenityType': amenityType,
        'amenityProvider': amenityProvider?.toJson(),
      };
}

class AmenityProvider {
  final String? name;

  AmenityProvider({this.name});

  factory AmenityProvider.fromJson(Map<String, dynamic> json) =>
      AmenityProvider(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {'name': name};
}

class FlightDictionary {
  final Dictionaries dictionaries;
  FlightDictionary({required this.dictionaries});
  factory FlightDictionary.fromJson(Map<String, dynamic> json) {
    return FlightDictionary(
      dictionaries: Dictionaries.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() => {
        'dictionaries': dictionaries.toJson(),
      };
}

class Dictionaries {
  final Map<String, String> aircraft;
  final Map<String, String> carriers;

  Dictionaries({
    required this.aircraft,
    required this.carriers,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) {
    return Dictionaries(
      aircraft: Map<String, String>.from(json['aircraft']),
      carriers: Map<String, String>.from(json['carriers']),
    );
  }

  Map<String, dynamic> toJson() => {
        'aircraft': aircraft,
        'carriers': carriers,
      };
}
