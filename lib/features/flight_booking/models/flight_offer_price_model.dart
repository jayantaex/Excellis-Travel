class FlightOfferPriceDataModel {
  final Data? data;
  final Dictionaries? dictionaries;

  FlightOfferPriceDataModel({
    this.data,
    this.dictionaries,
  });

  // Decoder: From JSON map to FlightOfferPriceDataModel instance
  factory FlightOfferPriceDataModel.fromJson(Map<String, dynamic> json) => FlightOfferPriceDataModel(
    data: json['data'] == null ? null : Data.fromJson(json['data'] as Map<String, dynamic>),
    dictionaries: json['dictionaries'] == null ? null : Dictionaries.fromJson(json['dictionaries'] as Map<String, dynamic>),
  );

  // Encoder: From FlightOfferPriceDataModel instance to JSON map
  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'dictionaries': dictionaries?.toJson(),
  };
}

class Data {
  final String? type;
  final List<FlightOffer>? flightOffers;
  final BookingRequirements? bookingRequirements;

  Data({
    this.type,
    this.flightOffers,
    this.bookingRequirements,
  });

  // Decoder
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json['type'] as String?,
    flightOffers: (json['flightOffers'] as List<dynamic>?)
        ?.map((x) => FlightOffer.fromJson(x as Map<String, dynamic>))
        .toList(),
    bookingRequirements: json['bookingRequirements'] == null
        ? null
        : BookingRequirements.fromJson(json['bookingRequirements'] as Map<String, dynamic>),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'type': type,
    'flightOffers': flightOffers?.map((x) => x.toJson()).toList(),
    'bookingRequirements': bookingRequirements?.toJson(),
  };
}


class FlightOffer {
  final String? type;
  final String? id;
  final String? source;
  final bool? instantTicketingRequired;
  final bool? nonHomogeneous;
  final bool? paymentCardRequired;
  final DateTime? lastTicketingDate;
  final List<Itinerary>? itineraries;
  final FlightOfferPrice? price;
  final PricingOptions? pricingOptions;
  final List<String>? validatingAirlineCodes;
  final List<TravelerPricing>? travelerPricings;

  FlightOffer({
    this.type,
    this.id,
    this.source,
    this.instantTicketingRequired,
    this.nonHomogeneous,
    this.paymentCardRequired,
    this.lastTicketingDate,
    this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    this.travelerPricings,
  });

  // Decoder
  factory FlightOffer.fromJson(Map<String, dynamic> json) => FlightOffer(
    type: json['type'] as String?,
    id: json['id'] as String?,
    source: json['source'] as String?,
    instantTicketingRequired: json['instantTicketingRequired'] as bool?,
    nonHomogeneous: json['nonHomogeneous'] as bool?,
    paymentCardRequired: json['paymentCardRequired'] as bool?,
    lastTicketingDate: json['lastTicketingDate'] == null
        ? null
        : DateTime.parse(json['lastTicketingDate'] as String),
    itineraries: (json['itineraries'] as List<dynamic>?)
        ?.map((x) => Itinerary.fromJson(x as Map<String, dynamic>))
        .toList(),
    price: json['price'] == null ? null : FlightOfferPrice.fromJson(json['price'] as Map<String, dynamic>),
    pricingOptions: json['pricingOptions'] == null
        ? null
        : PricingOptions.fromJson(json['pricingOptions'] as Map<String, dynamic>),
    validatingAirlineCodes: (json['validatingAirlineCodes'] as List<dynamic>?)
        ?.map((x) => x as String)
        .toList(),
    travelerPricings: (json['travelerPricings'] as List<dynamic>?)
        ?.map((x) => TravelerPricing.fromJson(x as Map<String, dynamic>))
        .toList(),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'type': type,
    'id': id,
    'source': source,
    'instantTicketingRequired': instantTicketingRequired,
    'nonHomogeneous': nonHomogeneous,
    'paymentCardRequired': paymentCardRequired,
    'lastTicketingDate': lastTicketingDate?.toIso8601String(),
    'itineraries': itineraries?.map((x) => x.toJson()).toList(),
    'price': price?.toJson(),
    'pricingOptions': pricingOptions?.toJson(),
    'validatingAirlineCodes': validatingAirlineCodes,
    'travelerPricings': travelerPricings?.map((x) => x.toJson()).toList(),
  };
}

class Itinerary {
  final List<Segment>? segments;

  Itinerary({
    this.segments,
  });

  // Decoder
  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
    segments: (json['segments'] as List<dynamic>?)
        ?.map((x) => Segment.fromJson(x as Map<String, dynamic>))
        .toList(),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'segments': segments?.map((x) => x.toJson()).toList(),
  };
}

class Segment {
  final Arrival? departure;
  final Arrival? arrival;
  final String? carrierCode;
  final String? number;
  final Aircraft? aircraft;
  final Operating? operating;
  final String? duration;
  final String? id;
  final int? numberOfStops;
  final List<Co2Emission>? co2Emissions;

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
    this.co2Emissions,
  });

  // Decoder
  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
    departure: json['departure'] == null ? null : Arrival.fromJson(json['departure'] as Map<String, dynamic>),
    arrival: json['arrival'] == null ? null : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
    carrierCode: json['carrierCode'] as String?,
    number: json['number'] as String?,
    aircraft: json['aircraft'] == null ? null : Aircraft.fromJson(json['aircraft'] as Map<String, dynamic>),
    operating: json['operating'] == null ? null : Operating.fromJson(json['operating'] as Map<String, dynamic>),
    duration: json['duration'] as String?,
    id: json['id'] as String?,
    numberOfStops: json['numberOfStops'] as int?,
    co2Emissions: (json['co2Emissions'] as List<dynamic>?)
        ?.map((x) => Co2Emission.fromJson(x as Map<String, dynamic>))
        .toList(),
  );

  // Encoder
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
    'co2Emissions': co2Emissions?.map((x) => x.toJson()).toList(),
  };
}

class Aircraft {
  final String? code;

  Aircraft({
    this.code,
  });

  // Decoder
  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
    code: json['code'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'code': code,
  };
}

class Arrival {
  final String? iataCode;
  final String? terminal;
  final DateTime? at;

  Arrival({
    this.iataCode,
    this.terminal,
    this.at,
  });

  // Decoder
  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
    iataCode: json['iataCode'] as String?,
    terminal: json['terminal'] as String?,
    at: json['at'] == null ? null : DateTime.parse(json['at'] as String),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'iataCode': iataCode,
    'terminal': terminal,
    'at': at?.toIso8601String(),
  };
}

class Co2Emission {
  final int? weight;
  final String? weightUnit;
  final String? cabin;

  Co2Emission({
    this.weight,
    this.weightUnit,
    this.cabin,
  });

  // Decoder
  factory Co2Emission.fromJson(Map<String, dynamic> json) => Co2Emission(
    weight: json['weight'] as int?,
    weightUnit: json['weightUnit'] as String?,
    cabin: json['cabin'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'weight': weight,
    'weightUnit': weightUnit,
    'cabin': cabin,
  };
}

class Operating {
  final String? carrierCode;

  Operating({
    this.carrierCode,
  });

  // Decoder
  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
    carrierCode: json['carrierCode'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'carrierCode': carrierCode,
  };
}

class FlightOfferPrice {
  final String? currency;
  final String? total;
  final String? base;
  final List<Fee>? fees;
  final String? grandTotal;
  final String? billingCurrency;

  FlightOfferPrice({
    this.currency,
    this.total,
    this.base,
    this.fees,
    this.grandTotal,
    this.billingCurrency,
  });

  // Decoder
  factory FlightOfferPrice.fromJson(Map<String, dynamic> json) => FlightOfferPrice(
    currency: json['currency'] as String?,
    total: json['total'] as String?,
    base: json['base'] as String?,
    fees: (json['fees'] as List<dynamic>?)
        ?.map((x) => Fee.fromJson(x as Map<String, dynamic>))
        .toList(),
    grandTotal: json['grandTotal'] as String?,
    billingCurrency: json['billingCurrency'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'currency': currency,
    'total': total,
    'base': base,
    'fees': fees?.map((x) => x.toJson()).toList(),
    'grandTotal': grandTotal,
    'billingCurrency': billingCurrency,
  };
}

class Fee {
  final String? amount;
  final String? type;

  Fee({
    this.amount,
    this.type,
  });

  // Decoder
  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
    amount: json['amount'] as String?,
    type: json['type'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'amount': amount,
    'type': type,
  };
}

class PricingOptions {
  final List<String>? fareType;
  final bool? includedCheckedBagsOnly;

  PricingOptions({
    this.fareType,
    this.includedCheckedBagsOnly,
  });

  // Decoder
  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
    fareType: (json['fareType'] as List<dynamic>?)
        ?.map((x) => x as String)
        .toList(),
    includedCheckedBagsOnly: json['includedCheckedBagsOnly'] as bool?,
  );

  // Encoder
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

  TravelerPricing({
    this.travelerId,
    this.fareOption,
    this.travelerType,
    this.price,
    this.fareDetailsBySegment,
  });

  // Decoder
  factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
    travelerId: json['travelerId'] as String?,
    fareOption: json['fareOption'] as String?,
    travelerType: json['travelerType'] as String?,
    price: json['price'] == null ? null : TravelerPricingPrice.fromJson(json['price'] as Map<String, dynamic>),
    fareDetailsBySegment: (json['fareDetailsBySegment'] as List<dynamic>?)
        ?.map((x) => FareDetailsBySegment.fromJson(x as Map<String, dynamic>))
        .toList(),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'travelerId': travelerId,
    'fareOption': fareOption,
    'travelerType': travelerType,
    'price': price?.toJson(),
    'fareDetailsBySegment': fareDetailsBySegment?.map((x) => x.toJson()).toList(),
  };
}

class FareDetailsBySegment {
  final String? segmentId;
  final String? cabin;
  final String? fareBasis;
  final String? brandedFare;
  final String? fareDetailsBySegmentClass; // Renamed to avoid reserved keyword 'class' in some contexts
  final IncludedCheckedBags? includedCheckedBags;

  FareDetailsBySegment({
    this.segmentId,
    this.cabin,
    this.fareBasis,
    this.brandedFare,
    this.fareDetailsBySegmentClass,
    this.includedCheckedBags,
  });

  // Decoder
  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) => FareDetailsBySegment(
    segmentId: json['segmentId'] as String?,
    cabin: json['cabin'] as String?,
    fareBasis: json['fareBasis'] as String?,
    brandedFare: json['brandedFare'] as String?,
    fareDetailsBySegmentClass: json['class'] as String?,
    includedCheckedBags: json['includedCheckedBags'] == null
        ? null
        : IncludedCheckedBags.fromJson(json['includedCheckedBags'] as Map<String, dynamic>),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'segmentId': segmentId,
    'cabin': cabin,
    'fareBasis': fareBasis,
    'brandedFare': brandedFare,
    'class': fareDetailsBySegmentClass,
    'includedCheckedBags': includedCheckedBags?.toJson(),
  };
}

class IncludedCheckedBags {
  final int? quantity;

  IncludedCheckedBags({
    this.quantity,
  });

  // Decoder
  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) => IncludedCheckedBags(
    quantity: json['quantity'] as int?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'quantity': quantity,
  };
}

class TravelerPricingPrice {
  final String? currency;
  final String? total;
  final String? base;
  final List<Tax>? taxes;
  final String? refundableTaxes;

  TravelerPricingPrice({
    this.currency,
    this.total,
    this.base,
    this.taxes,
    this.refundableTaxes,
  });

  // Decoder
  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) => TravelerPricingPrice(
    currency: json['currency'] as String?,
    total: json['total'] as String?,
    base: json['base'] as String?,
    taxes: (json['taxes'] as List<dynamic>?)
        ?.map((x) => Tax.fromJson(x as Map<String, dynamic>))
        .toList(),
    refundableTaxes: json['refundableTaxes'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'currency': currency,
    'total': total,
    'base': base,
    'taxes': taxes?.map((x) => x.toJson()).toList(),
    'refundableTaxes': refundableTaxes,
  };
}

class Tax {
  final String? amount;
  final String? code;

  Tax({
    this.amount,
    this.code,
  });

  // Decoder
  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    amount: json['amount'] as String?,
    code: json['code'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'amount': amount,
    'code': code,
  };
}


class BookingRequirements {
  final bool? emailAddressRequired;
  final bool? mobilePhoneNumberRequired;
  final List<TravelerRequirement>? travelerRequirements;

  BookingRequirements({
    this.emailAddressRequired,
    this.mobilePhoneNumberRequired,
    this.travelerRequirements,
  });

  // Decoder
  factory BookingRequirements.fromJson(Map<String, dynamic> json) => BookingRequirements(
    emailAddressRequired: json['emailAddressRequired'] as bool?,
    mobilePhoneNumberRequired: json['mobilePhoneNumberRequired'] as bool?,
    travelerRequirements: (json['travelerRequirements'] as List<dynamic>?)
        ?.map((x) => TravelerRequirement.fromJson(x as Map<String, dynamic>))
        .toList(),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'emailAddressRequired': emailAddressRequired,
    'mobilePhoneNumberRequired': mobilePhoneNumberRequired,
    'travelerRequirements': travelerRequirements?.map((x) => x.toJson()).toList(),
  };
}

class TravelerRequirement {
  final String? travelerId;
  final bool? genderRequired;
  final bool? documentRequired;
  final bool? dateOfBirthRequired;
  final bool? redressRequiredIfAny;
  final bool? residenceRequired;

  TravelerRequirement({
    this.travelerId,
    this.genderRequired,
    this.documentRequired,
    this.dateOfBirthRequired,
    this.redressRequiredIfAny,
    this.residenceRequired,
  });

  // Decoder
  factory TravelerRequirement.fromJson(Map<String, dynamic> json) => TravelerRequirement(
    travelerId: json['travelerId'] as String?,
    genderRequired: json['genderRequired'] as bool?,
    documentRequired: json['documentRequired'] as bool?,
    dateOfBirthRequired: json['dateOfBirthRequired'] as bool?,
    redressRequiredIfAny: json['redressRequiredIfAny'] as bool?,
    residenceRequired: json['residenceRequired'] as bool?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'travelerId': travelerId,
    'genderRequired': genderRequired,
    'documentRequired': documentRequired,
    'dateOfBirthRequired': dateOfBirthRequired,
    'redressRequiredIfAny': redressRequiredIfAny,
    'residenceRequired': residenceRequired,
  };
}

class Dictionaries {
  final Locations? locations;

  Dictionaries({
    this.locations,
  });

  // Decoder
  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
    locations: json['locations'] == null ? null : Locations.fromJson(json['locations'] as Map<String, dynamic>),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'locations': locations?.toJson(),
  };
}

class Locations {
  // Note: The specific keys 'mad', 'bos', 'lhr' suggest dynamic keys, but for 
  // this example, we'll keep them concrete for simplicity.
  final Bos? mad;
  final Bos? bos;
  final Bos? lhr;

  Locations({
    this.mad,
    this.bos,
    this.lhr,
  });

  // Decoder
  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    mad: json['MAD'] == null ? null : Bos.fromJson(json['MAD'] as Map<String, dynamic>),
    bos: json['BOS'] == null ? null : Bos.fromJson(json['BOS'] as Map<String, dynamic>),
    lhr: json['LHR'] == null ? null : Bos.fromJson(json['LHR'] as Map<String, dynamic>),
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    // Keys in the JSON are usually uppercase IATA codes
    'MAD': mad?.toJson(),
    'BOS': bos?.toJson(),
    'LHR': lhr?.toJson(),
  };
}

class Bos {
  final String? cityCode;
  final String? countryCode;

  Bos({
    this.cityCode,
    this.countryCode,
  });

  // Decoder
  factory Bos.fromJson(Map<String, dynamic> json) => Bos(
    cityCode: json['cityCode'] as String?,
    countryCode: json['countryCode'] as String?,
  );

  // Encoder
  Map<String, dynamic> toJson() => {
    'cityCode': cityCode,
    'countryCode': countryCode,
  };
}