class FlightsDataModel {
  factory FlightsDataModel.fromJson(Map<String, dynamic> json) =>
      FlightsDataModel(
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        datam: json['data'] != null
            ? List<Datam>.from(json['data'].map(
                (dataItem) => Datam.fromJson(dataItem as Map<String, dynamic>)))
            : null,
        // Corrected path to Dictionaries inside the 'dictionaries' key
        dictionaries: json['dictionaries'] != null
            ? FlightDictionary.fromJson(
                json['dictionaries'] as Map<String, dynamic>)
            : null,
      );

  FlightsDataModel({this.meta, this.datam, this.dictionaries});
  final Meta? meta;
  final List<Datam>? datam;
  final FlightDictionary? dictionaries;

  Map<String, dynamic> toJson() => {
        'meta': meta?.toJson(),
        'data': datam != null
            ? List<dynamic>.from(datam!.map((dataItem) => dataItem.toJson()))
            : null,
        'dictionaries': dictionaries?.toJson(),
      };
}

class Meta {
  Meta({this.count});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        count: json['count'],
      );
  final int? count;

  Map<String, dynamic> toJson() => {
        'count': count,
      };
}

class Datam {
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
        lastTicketingDate: json['lastTicketingDate'],
        lastTicketingDateTime: json['lastTicketingDateTime'],
        numberOfBookableSeats: json['numberOfBookableSeats'],
        itineraries: json['itineraries'] != null
            ? List<Itinerary>.from(json['itineraries']
                .map((itineraryJson) => Itinerary.fromJson(itineraryJson)))
            : null,
        price: json['price'] != null
            ? DatamPrice.fromJson(json['price'] as Map<String, dynamic>)
            : null,
        pricingOptions: json['pricingOptions'] != null
            ? PricingOptions.fromJson(
                json['pricingOptions'] as Map<String, dynamic>)
            : null,
        validatingAirlineCodes: json['validatingAirlineCodes'] != null
            ? List<String>.from(json['validatingAirlineCodes'])
            : null,
        travelerPricings: json['travelerPricings'] != null
            ? List<TravelerPricing>.from(json['travelerPricings'].map(
                (pricingJson) => TravelerPricing.fromJson(
                    pricingJson as Map<String, dynamic>)))
            : null,
      );
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
            ? List<Map<String, dynamic>>.from(
                itineraries!.map((Itinerary itinerary) => itinerary.toJson()))
            : null,
        'price': price?.toJson(),
        'pricingOptions': pricingOptions?.toJson(),
        'validatingAirlineCodes': validatingAirlineCodes,
        'travelerPricings': travelerPricings != null
            ? List<Map<String, dynamic>>.from(travelerPricings!
                .map((TravelerPricing pricing) => pricing.toJson()))
            : null,
      };
}

class Itinerary {
  Itinerary({this.duration, this.segments});

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        duration: json['duration'],
        segments: json['segments'] != null
            ? List<Segment>.from(json['segments'].map((segmentJson) =>
                Segment.fromJson(segmentJson as Map<String, dynamic>)))
            : null,
      );
  final String? duration;
  final List<Segment>? segments;

  Map<String, dynamic> toJson() => {
        'duration': duration,
        'segments': segments != null
            ? List<dynamic>.from(segments!.map((segment) => segment.toJson()))
            : null,
      };
}

class Segment {
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
            ? Departure.fromJson(json['departure'] as Map<String, dynamic>)
            : null,
        arrival: json['arrival'] != null
            ? Arrival.fromJson(json['arrival'] as Map<String, dynamic>)
            : null,
        carrierCode: json['carrierCode'],
        number: json['number'],
        aircraft: json['aircraft'] != null
            ? Aircraft.fromJson(json['aircraft'] as Map<String, dynamic>)
            : null,
        operating: json['operating'] != null
            ? Operating.fromJson(json['operating'] as Map<String, dynamic>)
            : null,
        duration: json['duration'],
        id: json['id'],
        numberOfStops: json['numberOfStops'],
        blacklistedInEu: json['blacklistedInEU'],
      );
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
  Departure({this.iataCode, this.terminal, this.at});

  factory Departure.fromJson(Map<String, dynamic> json) => Departure(
        iataCode: json['iataCode'],
        terminal: json['terminal'],
        at: json['at'],
      );
  final String? iataCode;
  final String? terminal;
  final String? at;

  Map<String, dynamic> toJson() => {
        'iataCode': iataCode,
        'terminal': terminal,
        'at': at,
      };
}

class Arrival {
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
  final String? iataCode;
  final String? terminal;
  final String? at;

  Map<String, dynamic> toJson() => {
        'iataCode': iataCode,
        'at': at,
        'terminal': terminal,
      };
}

class Aircraft {
  Aircraft({this.code});

  factory Aircraft.fromJson(Map<String, dynamic> json) =>
      Aircraft(code: json['code']);
  final String? code;

  Map<String, dynamic> toJson() => {'code': code};
}

class Operating {
  Operating({this.carrierCode});

  factory Operating.fromJson(Map<String, dynamic> json) =>
      Operating(carrierCode: json['carrierCode']);
  final String? carrierCode;

  Map<String, dynamic> toJson() => {'carrierCode': carrierCode};
}

class DatamPrice {
  DatamPrice(
      {this.currency,
      this.total,
      this.base,
      this.fees,
      this.grandTotal,
      this.publishedPrice,
      this.offerPrice});

  factory DatamPrice.fromJson(Map<String, dynamic> json) => DatamPrice(
        currency: json['currency'],
        total: json['total'],
        base: json['base'],
        fees: json['fees'] != null
            ? List<Fee>.from(json['fees'].map(
                (feeJson) => Fee.fromJson(feeJson as Map<String, dynamic>)))
            : null,
        grandTotal: json['grandTotal'],
      );
  final String? currency;
  final String? total;
  final String? base;
  final List<Fee>? fees;
  final String? grandTotal;
  String? offerPrice;
  String? publishedPrice;

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'total': total,
        'base': base,
        'fees': fees != null
            ? List<dynamic>.from(fees!.map((fee) => fee.toJson()))
            : null,
        'grandTotal': grandTotal,
        'offerPrice': offerPrice, // Included markupPrice in toJson
      };
}

class Fee {
  Fee({this.amount, this.type});

  factory Fee.fromJson(Map<String, dynamic> json) =>
      Fee(amount: json['amount'], type: json['type']);
  final String? amount;
  final String? type;

  Map<String, dynamic> toJson() => {'amount': amount, 'type': type};
}

class PricingOptions {
  PricingOptions({this.fareType, this.includedCheckedBagsOnly});

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
        fareType: json['fareType'] != null
            ? List<String>.from(json['fareType'])
            : null,
        includedCheckedBagsOnly: json['includedCheckedBagsOnly'],
      );
  final List<String>? fareType;
  final bool? includedCheckedBagsOnly;

  Map<String, dynamic> toJson() => {
        'fareType': fareType,
        'includedCheckedBagsOnly': includedCheckedBagsOnly,
      };
}

class TravelerPricing {
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
            ? TravelerPricingPrice.fromJson(
                json['price'] as Map<String, dynamic>)
            : null,
        fareDetailsBySegment: json['fareDetailsBySegment'] != null
            ? List<FareDetailsBySegment>.from(json['fareDetailsBySegment'].map(
                (detailsJson) => FareDetailsBySegment.fromJson(
                    detailsJson as Map<String, dynamic>)))
            : null,
      );
  final String? travelerId;
  final String? fareOption;
  final String? travelerType;
  final TravelerPricingPrice? price;
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  Map<String, dynamic> toJson() => {
        'travelerId': travelerId,
        'fareOption': fareOption,
        'travelerType': travelerType,
        'price': price?.toJson(),
        'fareDetailsBySegment': fareDetailsBySegment != null
            ? List<Map<String, dynamic>>.from(fareDetailsBySegment!
                .map((FareDetailsBySegment details) => details.toJson()))
            : null,
      };
}

class TravelerPricingPrice {
  TravelerPricingPrice({this.currency, this.total, this.base});

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
          currency: json['currency'], total: json['total'], base: json['base']);
  final String? currency;
  final String? total;
  final String? base;

  Map<String, dynamic> toJson() =>
      {'currency': currency, 'total': total, 'base': base};
}

class FareDetailsBySegment {
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
            ? IncludedCBags.fromJson(
                json['includedCheckedBags'] as Map<String, dynamic>)
            : null,
        includedCabinBags: json['includedCabinBags'] != null
            ? IncludedCBags.fromJson(
                json['includedCabinBags'] as Map<String, dynamic>)
            : null,
        amenities: json['amenities'] != null
            ? List<Amenity>.from(json['amenities'].map((amenityJson) =>
                Amenity.fromJson(amenityJson as Map<String, dynamic>)))
            : null,
      );
  final String? segmentId;
  final String? cabin;
  final String? fareBasis;
  final String? brandedFare;
  final String? brandedFareLabel;
  final String? fareDetailsBySegmentClass;
  final IncludedCBags? includedCheckedBags;
  final IncludedCBags? includedCabinBags;
  final List<Amenity>? amenities;

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
            ? List<Map<String, dynamic>>.from(
                amenities!.map((Amenity amenity) => amenity.toJson()))
            : null,
      };
}

class IncludedCBags {
  IncludedCBags({this.weight, this.weightUnit});

  factory IncludedCBags.fromJson(Map<String, dynamic> json) =>
      IncludedCBags(weight: json['weight'], weightUnit: json['weightUnit']);
  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() => {'weight': weight, 'weightUnit': weightUnit};
}

class Amenity {
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
            ? AmenityProvider.fromJson(
                json['amenityProvider'] as Map<String, dynamic>)
            : null,
      );
  final String? description;
  final bool? isChargeable;
  final String? amenityType;
  final AmenityProvider? amenityProvider;

  Map<String, dynamic> toJson() => {
        'description': description,
        'isChargeable': isChargeable,
        'amenityType': amenityType,
        'amenityProvider': amenityProvider?.toJson(),
      };
}

class AmenityProvider {
  AmenityProvider({this.name});

  factory AmenityProvider.fromJson(Map<String, dynamic> json) =>
      AmenityProvider(
        name: json['name'],
      );
  final String? name;

  Map<String, dynamic> toJson() => {'name': name};
}

class FlightDictionary {
  FlightDictionary({required this.dictionaries});

  factory FlightDictionary.fromJson(Map<String, dynamic> json) =>
      FlightDictionary(dictionaries: Dictionaries.fromJson(json));

  final Dictionaries dictionaries;

  Map<String, dynamic> toJson() => dictionaries.toJson();
}

class Dictionaries {
  Dictionaries({
    this.aircraft,
    this.carriers,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
        aircraft: json['aircraft'] != null
            ? Map<String, String>.from(json['aircraft'])
            : <String, String>{},
        carriers: json['carriers'] != null
            ? Map<String, String>.from(json['carriers'])
            : <String, String>{},
      );
  Map<String, String>? aircraft;
  Map<String, String>? carriers;

  Map<String, dynamic> toJson() => {
        // Maps are directly serializable if their keys and values are strings
        'aircraft': aircraft,
        'carriers': carriers,
      };
}
