class PaymentVarifiedDataModel {
  factory PaymentVarifiedDataModel.fromJson(Map<String, dynamic> json) =>
      PaymentVarifiedDataModel(
        id: json['id'],
        bookingReference: json['booking_reference'],
        userId: json['user_id'],
        flightOfferId: json['flight_offer_id'],
        flightData: json['flight_data'] != null
            ? FlightData.fromJson(json['flight_data'])
            : null,
        travelerPricings: json['traveler_pricings'] != null
            ? (json['traveler_pricings'] as List)
                .map((e) => TravelerPricing.fromJson(e))
                .toList()
            : null,
        travellerDetails: json['traveller_details'] != null
            ? TravellerDetails.fromJson(json['traveller_details'])
            : null,
        fareDetails: json['fare_details'] != null
            ? FareDetails.fromJson(json['fare_details'])
            : null,
        totalAmount: json['total_amount'],
        currency: json['currency'],
        bookingStatus: json['booking_status'],
        paymentStatus: json['payment_status'],
        bookingType: json['booking_type'],
        confirmationNumber: json['confirmation_number'],
      );
  PaymentVarifiedDataModel({
    this.id,
    this.bookingReference,
    this.userId,
    this.flightOfferId,
    this.flightData,
    this.travelerPricings,
    this.travellerDetails,
    this.fareDetails,
    this.totalAmount,
    this.currency,
    this.bookingStatus,
    this.paymentStatus,
    this.bookingType,
    this.confirmationNumber,
  });

  final int? id;
  final String? bookingReference;
  final int? userId;
  final String? flightOfferId;
  final FlightData? flightData;
  final List<TravelerPricing>? travelerPricings;
  final TravellerDetails? travellerDetails;
  final FareDetails? fareDetails;
  final String? totalAmount;
  final String? currency;
  final String? bookingStatus;
  final String? paymentStatus;
  final String? bookingType;
  final String? confirmationNumber;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bookingReference'] = bookingReference;
    data['userId'] = userId;
    data['flightOfferId'] = flightOfferId;
    if (flightData != null) {
      data['flightData'] = flightData!.toJson();
    }
    if (travelerPricings != null) {
      data['travelerPricings'] =
          travelerPricings!.map((v) => v.toJson()).toList();
    }
    if (travellerDetails != null) {
      data['travellerDetails'] = travellerDetails!.toJson();
    }
    if (fareDetails != null) {
      data['fareDetails'] = fareDetails!.toJson();
    }
    data['totalAmount'] = totalAmount;
    data['currency'] = currency;
    data['bookingStatus'] = bookingStatus;
    data['paymentStatus'] = paymentStatus;
    data['bookingType'] = bookingType;
    data['confirmationNumber'] = confirmationNumber;
    return data;
  }
}

class FareDetails {
  factory FareDetails.fromJson(Map<String, dynamic> json) => FareDetails(
        taxes: json['taxes'],
        markup: (json['markup'] as num?)?.toDouble(),
        baseFare: (json['baseFare'] as num?)?.toDouble(),
        discount: json['discount'],
        totalFare: (json['totalFare'] as num?)?.toDouble(),
        selectedFare: json['selectedFare'],
        showTotalFare: json['showTotalFare'],
        taxesWithMarkup: (json['taxesWithMarkup'] as num?)?.toDouble(),
        originalSubtotal: (json['originalSubtotal'] as num?)?.toDouble(),
      );
  FareDetails({
    this.taxes,
    this.markup,
    this.baseFare,
    this.discount,
    this.totalFare,
    this.selectedFare,
    this.showTotalFare,
    this.taxesWithMarkup,
    this.originalSubtotal,
  });

  final int? taxes;
  final double? markup;
  final double? baseFare;
  final int? discount;
  final double? totalFare;
  final String? selectedFare;
  final bool? showTotalFare;
  final double? taxesWithMarkup;
  final double? originalSubtotal;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxes'] = taxes;
    data['markup'] = markup;
    data['baseFare'] = baseFare;
    data['discount'] = discount;
    data['totalFare'] = totalFare;
    data['selectedFare'] = selectedFare;
    data['showTotalFare'] = showTotalFare;
    data['taxesWithMarkup'] = taxesWithMarkup;
    data['originalSubtotal'] = originalSubtotal;
    return data;
  }
}

class FlightData {
  factory FlightData.fromJson(Map<String, dynamic> json) => FlightData(
        id: json['id'],
        type: json['type'],
        price: json['price'] != null
            ? FlightDataPrice.fromJson(json['price'])
            : null,
        source: json['source'],
        itineraries: json['itineraries'] != null
            ? (json['itineraries'] as List)
                .map((e) => Itinerary.fromJson(e))
                .toList()
            : null,
        includedCheckedBagsOnly: json['includedCheckedBagsOnly'],
      );
  FlightData({
    this.id,
    this.type,
    this.price,
    this.source,
    this.itineraries,
    this.includedCheckedBagsOnly,
  });

  final String? id;
  final String? type;
  final FlightDataPrice? price;
  final String? source;
  final List<Itinerary>? itineraries;
  final bool? includedCheckedBagsOnly;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['source'] = source;
    if (itineraries != null) {
      data['itineraries'] = itineraries!.map((v) => v.toJson()).toList();
    }
    data['includedCheckedBagsOnly'] = includedCheckedBagsOnly;
    return data;
  }
}

class Itinerary {
  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        segments: json['segments'] != null
            ? (json['segments'] as List)
                .map((e) => Segment.fromJson(e))
                .toList()
            : null,
      );
  Itinerary({
    this.segments,
  });

  final List<Segment>? segments;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (segments != null) {
      data['segments'] = segments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Segment {
  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        id: json['id'],
        number: json['number'],
        arrival:
            json['arrival'] != null ? Arrival.fromJson(json['arrival']) : null,
        aircraft: json['aircraft'] != null
            ? Aircraft.fromJson(json['aircraft'])
            : null,
        duration: json['duration'],
        departure: json['departure'] != null
            ? Arrival.fromJson(json['departure'])
            : null,
        operating: json['operating'] != null
            ? Operating.fromJson(json['operating'])
            : null,
        carrierCode: json['carrierCode'],
        co2Emissions: json['co2Emissions'] != null
            ? (json['co2Emissions'] as List)
                .map((e) => Co2Emission.fromJson(e))
                .toList()
            : null,
        numberOfStops: json['numberOfStops'],
      );
  Segment({
    this.id,
    this.number,
    this.arrival,
    this.aircraft,
    this.duration,
    this.departure,
    this.operating,
    this.carrierCode,
    this.co2Emissions,
    this.numberOfStops,
  });

  final String? id;
  final String? number;
  final Arrival? arrival;
  final Aircraft? aircraft;
  final String? duration;
  final Arrival? departure;
  final Operating? operating;
  final String? carrierCode;
  final List<Co2Emission>? co2Emissions;
  final int? numberOfStops;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    if (arrival != null) {
      data['arrival'] = arrival!.toJson();
    }
    if (aircraft != null) {
      data['aircraft'] = aircraft!.toJson();
    }
    data['duration'] = duration;
    if (departure != null) {
      data['departure'] = departure!.toJson();
    }
    if (operating != null) {
      data['operating'] = operating!.toJson();
    }
    data['carrierCode'] = carrierCode;
    if (co2Emissions != null) {
      data['co2Emissions'] = co2Emissions!.map((v) => v.toJson()).toList();
    }
    data['numberOfStops'] = numberOfStops;
    return data;
  }
}

class Aircraft {
  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json['code'],
      );
  Aircraft({
    this.code,
  });

  final String? code;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}

class Arrival {
  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        at: json['at'],
        iataCode: json['iataCode'],
        terminal: json['terminal'],
      );
  Arrival({
    this.at,
    this.iataCode,
    this.terminal,
  });

  final String? at;
  final String? iataCode;
  final String? terminal;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['at'] = at;
    data['iataCode'] = iataCode;
    data['terminal'] = terminal;
    return data;
  }
}

class Co2Emission {
  factory Co2Emission.fromJson(Map<String, dynamic> json) => Co2Emission(
        cabin: json['cabin'],
        weight: json['weight'],
        weightUnit: json['weightUnit'],
      );
  Co2Emission({
    this.cabin,
    this.weight,
    this.weightUnit,
  });

  final String? cabin;
  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabin'] = cabin;
    data['weight'] = weight;
    data['weightUnit'] = weightUnit;
    return data;
  }
}

class Operating {
  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
        carrierCode: json['carrierCode'],
      );
  Operating({
    this.carrierCode,
  });

  final String? carrierCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carrierCode'] = carrierCode;
    return data;
  }
}

class FlightDataPrice {
  factory FlightDataPrice.fromJson(Map<String, dynamic> json) =>
      FlightDataPrice(
        base: json['base'],
        fees: json['fees'] != null
            ? (json['fees'] as List).map((e) => Fee.fromJson(e)).toList()
            : null,
        total: json['total'],
        currency: json['currency'],
        grandTotal: json['grandTotal'],
        billingCurrency: json['billingCurrency'],
      );
  FlightDataPrice({
    this.base,
    this.fees,
    this.total,
    this.currency,
    this.grandTotal,
    this.billingCurrency,
  });

  final String? base;
  final List<Fee>? fees;
  final String? total;
  final String? currency;
  final String? grandTotal;
  final String? billingCurrency;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    if (fees != null) {
      data['fees'] = fees!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['currency'] = currency;
    data['grandTotal'] = grandTotal;
    data['billingCurrency'] = billingCurrency;
    return data;
  }
}

class Fee {
  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        type: json['type'],
        amount: json['amount'],
      );
  Fee({
    this.type,
    this.amount,
  });

  final String? type;
  final String? amount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['amount'] = amount;
    return data;
  }
}

class TravelerPricing {
  factory TravelerPricing.fromJson(Map<String, dynamic> json) =>
      TravelerPricing(
        price: json['price'] != null
            ? TravelerPricingPrice.fromJson(json['price'])
            : null,
        fareOption: json['fareOption'],
        travelerId: json['travelerId'],
        travelerType: json['travelerType'],
        fareDetailsBySegment: json['fareDetailsBySegment'] != null
            ? (json['fareDetailsBySegment'] as List)
                .map((e) => FareDetailsBySegment.fromJson(e))
                .toList()
            : null,
      );
  TravelerPricing({
    this.price,
    this.fareOption,
    this.travelerId,
    this.travelerType,
    this.fareDetailsBySegment,
  });

  final TravelerPricingPrice? price;
  final String? fareOption;
  final String? travelerId;
  final String? travelerType;
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['fareOption'] = fareOption;
    data['travelerId'] = travelerId;
    data['travelerType'] = travelerType;
    if (fareDetailsBySegment != null) {
      data['fareDetailsBySegment'] =
          fareDetailsBySegment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FareDetailsBySegment {
  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) =>
      FareDetailsBySegment(
        cabin: json['cabin'],
        fareDetailsBySegmentClass: json['class'], // Often "class" in JSON
        fareBasis: json['fareBasis'],
        segmentId: json['segmentId'],
        brandedFare: json['brandedFare'],
        includedCheckedBags: json['includedCheckedBags'] != null
            ? IncludedCheckedBags.fromJson(json['includedCheckedBags'])
            : null,
      );
  FareDetailsBySegment({
    this.cabin,
    this.fareDetailsBySegmentClass,
    this.fareBasis,
    this.segmentId,
    this.brandedFare,
    this.includedCheckedBags,
  });

  final String? cabin;
  final String? fareDetailsBySegmentClass;
  final String? fareBasis;
  final String? segmentId;
  final String? brandedFare;
  final IncludedCheckedBags? includedCheckedBags;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabin'] = cabin;
    data['class'] = fareDetailsBySegmentClass;
    data['fareBasis'] = fareBasis;
    data['segmentId'] = segmentId;
    data['brandedFare'] = brandedFare;
    if (includedCheckedBags != null) {
      data['includedCheckedBags'] = includedCheckedBags!.toJson();
    }
    return data;
  }
}

class IncludedCheckedBags {
  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) =>
      IncludedCheckedBags(
        weight: json['weight'],
        weightUnit: json['weightUnit'],
      );
  IncludedCheckedBags({
    this.weight,
    this.weightUnit,
  });

  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weight'] = weight;
    data['weightUnit'] = weightUnit;
    return data;
  }
}

class TravelerPricingPrice {
  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
        base: json['base'],
        taxes: json['taxes'] != null
            ? (json['taxes'] as List).map((e) => Tax.fromJson(e)).toList()
            : null,
        total: json['total'],
        currency: json['currency'],
        refundableTaxes: json['refundableTaxes'],
      );
  TravelerPricingPrice({
    this.base,
    this.taxes,
    this.total,
    this.currency,
    this.refundableTaxes,
  });

  final String? base;
  final List<Tax>? taxes;
  final String? total;
  final String? currency;
  final String? refundableTaxes;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    if (taxes != null) {
      data['taxes'] = taxes!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['currency'] = currency;
    data['refundableTaxes'] = refundableTaxes;
    return data;
  }
}

class Tax {
  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        code: json['code'],
        amount: json['amount'],
      );
  Tax({
    this.code,
    this.amount,
  });

  final String? code;
  final String? amount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['amount'] = amount;
    return data;
  }
}

class TravellerDetails {
  factory TravellerDetails.fromJson(Map<String, dynamic> json) =>
      TravellerDetails(
        adults: json['adults'] != null
            ? (json['adults'] as List).map((e) => Adult.fromJson(e)).toList()
            : null,
        infants: json['infants'] ?? [],
        children: json['children'] ?? [],
      );
  TravellerDetails({
    this.adults,
    this.infants,
    this.children,
  });

  final List<Adult>? adults;
  final List<dynamic>? infants;
  final List<dynamic>? children;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (adults != null) {
      data['adults'] = adults!.map((v) => v.toJson()).toList();
    }
    if (infants != null) {
      data['infants'] = infants;
    }
    if (children != null) {
      data['children'] = children;
    }
    return data;
  }
}

class Adult {
  factory Adult.fromJson(Map<String, dynamic> json) => Adult(
        open: json['open'],
        title: json['title'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        dateOfBirth: json['dateOfBirth'] != null
            ? DateTime.parse(json['dateOfBirth'])
            : null,
        nationality: json['nationality'],
      );
  Adult({
    this.open,
    this.title,
    this.lastName,
    this.firstName,
    this.dateOfBirth,
    this.nationality,
  });

  final bool? open;
  final String? title;
  final String? lastName;
  final String? firstName;
  final DateTime? dateOfBirth;
  final String? nationality;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    data['title'] = title;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['dateOfBirth'] = dateOfBirth?.toIso8601String();
    data['nationality'] = nationality;
    return data;
  }
}
