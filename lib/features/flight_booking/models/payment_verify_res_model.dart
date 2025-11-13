// You'll need this import for jsonDecode/jsonEncode if you use the top-level functions.
// import 'dart:convert';
// Use jsonDecode/jsonEncode(model.toJson()) to convert.

class PaymentVerifiedModel {

  factory PaymentVerifiedModel.fromJson(Map<String, dynamic> json) => PaymentVerifiedModel(
      booking: json['booking'] == null
          ? null
          : Booking.fromJson(json['booking'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );

  PaymentVerifiedModel({
    this.booking,
    this.payment,
  });
  final Booking? booking;
  final Payment? payment;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'booking': booking?.toJson(),
      'payment': payment?.toJson(),
    };
}

class Booking {

  Booking({
    this.id,
    this.bookingReference,
    this.userId,
    this.flightOfferId,
    this.flightData,
    this.travellerDetails,
    this.billingAddress,
    this.contactDetails,
    this.seatSelections,
    this.mealSelections,
    this.insuranceSelections,
    this.fareDetails,
    this.totalAmount,
    this.currency,
    this.bookingStatus,
    this.paymentStatus,
    this.bookingType,
    this.expiresAt,
    this.confirmationNumber,
    this.ticketNumbers,
    this.pnrNumber,
    this.cancellationPolicy,
    this.refundPolicy,
    this.flightOrderId,
    this.amadeusOrderData,
    this.createdAt,
    this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as int?,
      bookingReference: json['booking_reference'] as String?,
      userId: json['user_id'] as int?,
      flightOfferId: json['flight_offer_id'] as String?,
      flightData: json['flight_data'] == null
          ? null
          : FlightData.fromJson(json['flight_data'] as Map<String, dynamic>),
      travellerDetails: json['traveller_details'] == null
          ? null
          : TravellerDetails.fromJson(
              json['traveller_details'] as Map<String, dynamic>),
      billingAddress: json['billing_address'] == null
          ? null
          : BillingAddress.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      contactDetails: json['contact_details'] == null
          ? null
          : ContactDetails.fromJson(
              json['contact_details'] as Map<String, dynamic>),
      seatSelections: json['seat_selections'],
      mealSelections: json['meal_selections'],
      insuranceSelections: json['insurance_selections'],
      fareDetails: json['fare_details'] == null
          ? null
          : FareDetails.fromJson(json['fare_details'] as Map<String, dynamic>),
      totalAmount: json['total_amount'] as String?,
      currency: json['currency'] as String?,
      bookingStatus: json['booking_status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      bookingType: json['booking_type'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.tryParse(json['expires_at'] as String),
      confirmationNumber: json['confirmation_number'] as String?,
      ticketNumbers: json['ticket_numbers'],
      pnrNumber: json['pnr_number'],
      cancellationPolicy: json['cancellation_policy'] == null
          ? null
          : CancellationPolicy.fromJson(
              json['cancellation_policy'] as Map<String, dynamic>),
      refundPolicy: json['refund_policy'] == null
          ? null
          : RefundPolicy.fromJson(
              json['refund_policy'] as Map<String, dynamic>),
      flightOrderId: json['flight_prder_id'],
      amadeusOrderData: json['amadeus_order_data'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'] as String),
    );
  final int? id;
  final String? bookingReference;
  final int? userId;
  final String? flightOfferId;
  final FlightData? flightData;
  final TravellerDetails? travellerDetails;
  final BillingAddress? billingAddress;
  final ContactDetails? contactDetails;
  final dynamic seatSelections;
  final dynamic mealSelections;
  final dynamic insuranceSelections;
  final FareDetails? fareDetails;
  final String? totalAmount;
  final String? currency;
  final String? bookingStatus;
  final String? paymentStatus;
  final String? bookingType;
  final DateTime? expiresAt;
  final String? confirmationNumber;
  final dynamic ticketNumbers;
  final dynamic pnrNumber;
  final CancellationPolicy? cancellationPolicy;
  final RefundPolicy? refundPolicy;
  final dynamic flightOrderId;
  final dynamic amadeusOrderData;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'bookingReference': bookingReference,
      'userId': userId,
      'flightOfferId': flightOfferId,
      'flightData': flightData?.toJson(),
      'travellerDetails': travellerDetails?.toJson(),
      'billingAddress': billingAddress?.toJson(),
      'contactDetails': contactDetails?.toJson(),
      'seatSelections': seatSelections,
      'mealSelections': mealSelections,
      'insuranceSelections': insuranceSelections,
      'fareDetails': fareDetails?.toJson(),
      'totalAmount': totalAmount,
      'currency': currency,
      'bookingStatus': bookingStatus,
      'paymentStatus': paymentStatus,
      'bookingType': bookingType,
      'expiresAt': expiresAt?.toIso8601String(),
      'confirmationNumber': confirmationNumber,
      'ticketNumbers': ticketNumbers,
      'pnrNumber': pnrNumber,
      'cancellationPolicy': cancellationPolicy?.toJson(),
      'refundPolicy': refundPolicy?.toJson(),
      'flightOrderId': flightOrderId,
      'amadeusOrderData': amadeusOrderData,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
}

class BillingAddress {

  BillingAddress({
    this.city,
    this.state,
    this.country,
    this.pinCode,
    this.addressLine1,
    this.addressLine2,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pinCode: json['pinCode'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
    );
  final String? city;
  final String? state;
  final String? country;
  final String? pinCode;
  final String? addressLine1;
  final String? addressLine2;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'city': city,
      'state': state,
      'country': country,
      'pinCode': pinCode,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
    };
}

class CancellationPolicy {

  CancellationPolicy({
    this.cancellationFee,
    this.refundPercentage,
    this.freeCancellationUntil,
  });

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) => CancellationPolicy(
      cancellationFee: json['cancellationFee'] as int?,
      refundPercentage: json['refundPercentage'] as int?,
      freeCancellationUntil: json['freeCancellationUntil'] == null
          ? null
          : DateTime.tryParse(json['freeCancellationUntil'] as String),
    );
  final int? cancellationFee;
  final int? refundPercentage;
  final DateTime? freeCancellationUntil;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'cancellationFee': cancellationFee,
      'refundPercentage': refundPercentage,
      'freeCancellationUntil': freeCancellationUntil?.toIso8601String(),
    };
}

class ContactDetails {

  ContactDetails({
    this.email,
    this.countryCode,
    this.phoneNumber,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
      email: json['email'] as String?,
      countryCode: json['countryCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  final String? email;
  final String? countryCode;
  final String? phoneNumber;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'email': email,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
    };
}

class FareDetails {

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

  factory FareDetails.fromJson(Map<String, dynamic> json) => FareDetails(
      taxes: json['taxes'] as int?,
      markup: (json['markup'] as num?)?.toDouble(),
      baseFare: json['baseFare'] as int?,
      discount: json['discount'] as int?,
      totalFare: (json['totalFare'] as num?)?.toDouble(),
      selectedFare: json['selectedFare'] as String?,
      showTotalFare: json['showTotalFare'] as bool?,
      taxesWithMarkup: (json['taxesWithMarkup'] as num?)?.toDouble(),
      originalSubtotal: json['originalSubtotal'] as int?,
    );
  final int? taxes;
  final double? markup;
  final int? baseFare;
  final int? discount;
  final double? totalFare;
  final String? selectedFare;
  final bool? showTotalFare;
  final double? taxesWithMarkup;
  final int? originalSubtotal;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'taxes': taxes,
      'markup': markup,
      'baseFare': baseFare,
      'discount': discount,
      'totalFare': totalFare,
      'selectedFare': selectedFare,
      'showTotalFare': showTotalFare,
      'taxesWithMarkup': taxesWithMarkup,
      'originalSubtotal': originalSubtotal,
    };
}

class FlightData {

  FlightData({
    this.id,
    this.type,
    this.price,
    this.source,
    this.itineraries,
    this.nonHomogeneous,
    this.pricingOptions,
    this.travelerPricings,
    this.lastTicketingDate,
    this.paymentCardRequired,
    this.validatingAirlineCodes,
    this.instantTicketingRequired,
  });

  factory FlightData.fromJson(Map<String, dynamic> json) => FlightData(
      id: json['id'] as String?,
      type: json['type'] as String?,
      price: json['price'] == null
          ? null
          : FlightDataPrice.fromJson(json['price'] as Map<String, dynamic>),
      source: json['source'] as String?,
      itineraries: (json['itineraries'] as List<dynamic>?)
          ?.map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nonHomogeneous: json['nonHomogeneous'] as bool?,
      pricingOptions: json['pricingOptions'] == null
          ? null
          : PricingOptions.fromJson(
              json['pricingOptions'] as Map<String, dynamic>),
      travelerPricings: (json['travelerPricings'] as List<dynamic>?)
          ?.map((e) => TravelerPricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastTicketingDate: json['lastTicketingDate'] == null
          ? null
          : DateTime.tryParse(json['lastTicketingDate'] as String),
      paymentCardRequired: json['paymentCardRequired'] as bool?,
      validatingAirlineCodes: (json['validatingAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      instantTicketingRequired: json['instantTicketingRequired'] as bool?,
    );
  final String? id;
  final String? type;
  final FlightDataPrice? price;
  final String? source;
  final List<Itinerary>? itineraries;
  final bool? nonHomogeneous;
  final PricingOptions? pricingOptions;
  final List<TravelerPricing>? travelerPricings;
  final DateTime? lastTicketingDate;
  final bool? paymentCardRequired;
  final List<String>? validatingAirlineCodes;
  final bool? instantTicketingRequired;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'type': type,
      'price': price?.toJson(),
      'source': source,
      'itineraries': itineraries?.map((Itinerary e) => e.toJson()).toList(),
      'nonHomogeneous': nonHomogeneous,
      'pricingOptions': pricingOptions?.toJson(),
      'travelerPricings': travelerPricings?.map((TravelerPricing e) => e.toJson()).toList(),
      'lastTicketingDate': lastTicketingDate?.toIso8601String(),
      'paymentCardRequired': paymentCardRequired,
      'validatingAirlineCodes': validatingAirlineCodes,
      'instantTicketingRequired': instantTicketingRequired,
    };
}

class Itinerary {

  Itinerary({
    this.segments,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  final List<Segment>? segments;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'segments': segments?.map((Segment e) => e.toJson()).toList(),
    };
}

class Segment {

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

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
      id: json['id'] as String?,
      number: json['number'] as String?,
      arrival: json['arrival'] == null
          ? null
          : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
      aircraft: json['aircraft'] == null
          ? null
          : Aircraft.fromJson(json['aircraft'] as Map<String, dynamic>),
      duration: json['duration'] as String?,
      departure: json['departure'] == null
          ? null
          : Arrival.fromJson(json['departure'] as Map<String, dynamic>),
      operating: json['operating'] == null
          ? null
          : Operating.fromJson(json['operating'] as Map<String, dynamic>),
      carrierCode: json['carrierCode'] as String?,
      co2Emissions: (json['co2Emissions'] as List<dynamic>?)
          ?.map((e) => Co2Emission.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfStops: json['numberOfStops'] as int?,
    );
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

  Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'number': number,
      'arrival': arrival?.toJson(),
      'aircraft': aircraft?.toJson(),
      'duration': duration,
      'departure': departure?.toJson(),
      'operating': operating?.toJson(),
      'carrierCode': carrierCode,
      'co2Emissions': co2Emissions?.map((Co2Emission e) => e.toJson()).toList(),
      'numberOfStops': numberOfStops,
    };
}

class Aircraft {

  Aircraft({
    this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
      code: json['code'] as String?,
    );
  final String? code;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'code': code,
    };
}

class Arrival {

  Arrival({
    this.at,
    this.iataCode,
    this.terminal,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
      at: json['at'],
      iataCode: json['iataCode'] as String?,
      terminal: json['terminal'] as String?,
    );
  final String? at;
  final String? iataCode;
  final String? terminal;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'at': at,
      'iataCode': iataCode,
      'terminal': terminal,
    };
}

class Co2Emission {

  Co2Emission({
    this.cabin,
    this.weight,
    this.weightUnit,
  });

  factory Co2Emission.fromJson(Map<String, dynamic> json) => Co2Emission(
      cabin: json['cabin'] as String?,
      weight: json['weight'] as int?,
      weightUnit: json['weightUnit'] as String?,
    );
  final String? cabin;
  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'cabin': cabin,
      'weight': weight,
      'weightUnit': weightUnit,
    };
}

class Operating {

  Operating({
    this.carrierCode,
  });

  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
      carrierCode: json['carrierCode'] as String?,
    );
  final String? carrierCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'carrierCode': carrierCode,
    };
}

class FlightDataPrice {

  FlightDataPrice({
    this.base,
    this.fees,
    this.total,
    this.currency,
    this.grandTotal,
    this.billingCurrency,
  });

  factory FlightDataPrice.fromJson(Map<String, dynamic> json) => FlightDataPrice(
      base: json['base'] as String?,
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => Fee.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      grandTotal: json['grandTotal'] as String?,
      billingCurrency: json['billingCurrency'] as String?,
    );
  final String? base;
  final List<Fee>? fees;
  final String? total;
  final String? currency;
  final String? grandTotal;
  final String? billingCurrency;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'base': base,
      'fees': fees?.map((Fee e) => e.toJson()).toList(),
      'total': total,
      'currency': currency,
      'grandTotal': grandTotal,
      'billingCurrency': billingCurrency,
    };
}

class Fee {

  Fee({
    this.type,
    this.amount,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
      type: json['type'] as String?,
      amount: json['amount'] as String?,
    );
  final String? type;
  final String? amount;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'type': type,
      'amount': amount,
    };
}

class PricingOptions {

  PricingOptions({
    this.fareType,
    this.includedCheckedBagsOnly,
  });

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
      fareType: (json['fareType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      includedCheckedBagsOnly: json['includedCheckedBagsOnly'] as bool?,
    );
  final List<String>? fareType;
  final bool? includedCheckedBagsOnly;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'fareType': fareType,
      'includedCheckedBagsOnly': includedCheckedBagsOnly,
    };
}

class TravelerPricing {

  TravelerPricing({
    this.price,
    this.fareOption,
    this.travelerId,
    this.travelerType,
    this.fareDetailsBySegment,
  });

  factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
      price: json['price'] == null
          ? null
          : TravelerPricingPrice.fromJson(
              json['price'] as Map<String, dynamic>),
      fareOption: json['fareOption'] as String?,
      travelerId: json['travelerId'] as String?,
      travelerType: json['travelerType'] as String?,
      fareDetailsBySegment: (json['fareDetailsBySegment'] as List<dynamic>?)
          ?.map((e) => FareDetailsBySegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  final TravelerPricingPrice? price;
  final String? fareOption;
  final String? travelerId;
  final String? travelerType;
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'price': price?.toJson(),
      'fareOption': fareOption,
      'travelerId': travelerId,
      'travelerType': travelerType,
      'fareDetailsBySegment':
          fareDetailsBySegment?.map((FareDetailsBySegment e) => e.toJson()).toList(),
    };
}

class FareDetailsBySegment {

  FareDetailsBySegment({
    this.cabin,
    this.fareDetailsBySegmentClass,
    this.fareBasis,
    this.segmentId,
    this.brandedFare,
    this.includedCheckedBags,
  });

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) => FareDetailsBySegment(
      cabin: json['cabin'] as String?,
      fareDetailsBySegmentClass: json['fareDetailsBySegmentClass'] as String?,
      fareBasis: json['fareBasis'] as String?,
      segmentId: json['segmentId'] as String?,
      brandedFare: json['brandedFare'] as String?,
      includedCheckedBags: json['includedCheckedBags'] == null
          ? null
          : IncludedCheckedBags.fromJson(
              json['includedCheckedBags'] as Map<String, dynamic>),
    );
  final String? cabin;
  final String? fareDetailsBySegmentClass;
  final String? fareBasis;
  final String? segmentId;
  final String? brandedFare;
  final IncludedCheckedBags? includedCheckedBags;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'cabin': cabin,
      'fareDetailsBySegmentClass': fareDetailsBySegmentClass,
      'fareBasis': fareBasis,
      'segmentId': segmentId,
      'brandedFare': brandedFare,
      'includedCheckedBags': includedCheckedBags?.toJson(),
    };
}

class IncludedCheckedBags {

  IncludedCheckedBags({
    this.weight,
    this.weightUnit,
  });

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) => IncludedCheckedBags(
      weight: json['weight'] as int?,
      weightUnit: json['weightUnit'] as String?,
    );
  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'weight': weight,
      'weightUnit': weightUnit,
    };
}

class TravelerPricingPrice {

  TravelerPricingPrice({
    this.base,
    this.taxes,
    this.total,
    this.currency,
    this.refundableTaxes,
  });

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) => TravelerPricingPrice(
      base: json['base'] as String?,
      taxes: (json['taxes'] as List<dynamic>?)
          ?.map((e) => Tax.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      refundableTaxes: json['refundableTaxes'] as String?,
    );
  final String? base;
  final List<Tax>? taxes;
  final String? total;
  final String? currency;
  final String? refundableTaxes;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'base': base,
      'taxes': taxes?.map((Tax e) => e.toJson()).toList(),
      'total': total,
      'currency': currency,
      'refundableTaxes': refundableTaxes,
    };
}

class Tax {

  Tax({
    this.code,
    this.amount,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
      code: json['code'] as String?,
      amount: json['amount'] as String?,
    );
  final String? code;
  final String? amount;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'code': code,
      'amount': amount,
    };
}

class RefundPolicy {

  RefundPolicy({
    this.refundable,
    this.processingTime,
    this.refundDeadline,
  });

  factory RefundPolicy.fromJson(Map<String, dynamic> json) => RefundPolicy(
      refundable: json['refundable'] as bool?,
      processingTime: json['processingTime'] as String?,
      refundDeadline: json['refundDeadline'] == null
          ? null
          : DateTime.tryParse(json['refundDeadline'] as String),
    );
  final bool? refundable;
  final String? processingTime;
  final DateTime? refundDeadline;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'refundable': refundable,
      'processingTime': processingTime,
      'refundDeadline': refundDeadline?.toIso8601String(),
    };
}

class TravellerDetails {

  TravellerDetails({
    this.adults,
    this.infants,
    this.children,
  });

  factory TravellerDetails.fromJson(Map<String, dynamic> json) => TravellerDetails(
      adults: (json['adults'] as List<dynamic>?)
          ?.map((e) => Adult.fromJson(e as Map<String, dynamic>))
          .toList(),
      infants: json['infants'] as List<dynamic>?,
      children: json['children'] as List<dynamic>?,
    );
  final List<Adult>? adults;
  final List<dynamic>? infants;
  final List<dynamic>? children;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'adults': adults?.map((Adult e) => e.toJson()).toList(),
      'infants': infants,
      'children': children,
    };
}

class Adult {

  Adult({
    this.open,
    this.title,
    this.lastName,
    this.firstName,
    this.dateOfBirth,
    this.nationality,
  });

  factory Adult.fromJson(Map<String, dynamic> json) => Adult(
      open: json['open'] as bool?,
      title: json['title'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      dateOfBirth: json['dateOfBirth'],
      nationality: json['nationality'] as String?,
    );
  final bool? open;
  final String? title;
  final String? lastName;
  final String? firstName;
  final String? dateOfBirth;
  final String? nationality;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'open': open,
      'title': title,
      'lastName': lastName,
      'firstName': firstName,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
    };
}

class Payment {

  Payment({
    this.id,
    this.bookingId,
    this.paymentReference,
    this.razorpayOrderId,
    this.razorpayPaymentId,
    this.razorpaySignature,
    this.amount,
    this.currency,
    this.paymentMethod,
    this.paymentGateway,
    this.paymentStatus,
    this.failureReason,
    this.gatewayResponse,
    this.refundAmount,
    this.refundStatus,
    this.refundReference,
    this.processedAt,
    this.refundedAt,
    this.createdAt,
    this.updatedAt,
    this.booking,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int?,
      bookingId: json['booking_id'] as int?,
      paymentReference: json['payment_reference'] as String?,
      razorpayOrderId: json['razorpay_order_id'] as String?,
      razorpayPaymentId: json['razorpay_payment_id'] as String?,
      razorpaySignature: json['razorpay_signature'] as String?,
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
      paymentMethod: json['payment_method'],
      paymentGateway: json['payment_gateway'] as String?,
      paymentStatus: json['payment_status'] as String?,
      failureReason: json['failure_reason'],
      gatewayResponse: json['gateway_esponse'] == null
          ? null
          : GatewayResponse.fromJson(
              json['gateway_response'] as Map<String, dynamic>),
      refundAmount: json['refund_amount'] as String?,
      refundStatus: json['refund_status'] as String?,
      refundReference: json['refund_reference'],
      processedAt: json['processed_at'] == null
          ? null
          : DateTime.tryParse(json['processed_at'] as String),
      refundedAt: json['refunded_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'] as String),
      booking: json['booking'] == null
          ? null
          : Booking.fromJson(json['booking'] as Map<String, dynamic>),
    );
  final int? id;
  final int? bookingId;
  final String? paymentReference;
  final String? razorpayOrderId;
  final String? razorpayPaymentId;
  final String? razorpaySignature;
  final String? amount;
  final String? currency;
  final dynamic paymentMethod;
  final String? paymentGateway;
  final String? paymentStatus;
  final dynamic failureReason;
  final GatewayResponse? gatewayResponse;
  final String? refundAmount;
  final String? refundStatus;
  final dynamic refundReference;
  final DateTime? processedAt;
  final dynamic refundedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Booking? booking;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'bookingId': bookingId,
      'paymentReference': paymentReference,
      'razorpayOrderId': razorpayOrderId,
      'razorpayPaymentId': razorpayPaymentId,
      'razorpaySignature': razorpaySignature,
      'amount': amount,
      'currency': currency,
      'paymentMethod': paymentMethod,
      'paymentGateway': paymentGateway,
      'paymentStatus': paymentStatus,
      'failureReason': failureReason,
      'gatewayResponse': gatewayResponse?.toJson(),
      'refundAmount': refundAmount,
      'refundStatus': refundStatus,
      'refundReference': refundReference,
      'processedAt': processedAt?.toIso8601String(),
      'refundedAt': refundedAt,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'booking': booking?.toJson(),
    };
}

class GatewayResponse {

  GatewayResponse({
    this.id,
    this.notes,
    this.amount,
    this.entity,
    this.status,
    this.receipt,
    this.attempts,
    this.currency,
    this.offerId,
    this.amountDue,
    this.createdAt,
    this.amountPaid,
  });

  factory GatewayResponse.fromJson(Map<String, dynamic> json) => GatewayResponse(
      id: json['id'] as String?,
      notes: json['notes'] == null
          ? null
          : Notes.fromJson(json['notes'] as Map<String, dynamic>),
      amount: json['amount'] as int?,
      entity: json['entity'] as String?,
      status: json['status'] as String?,
      receipt: json['receipt'] as String?,
      attempts: json['attempts'] as int?,
      currency: json['currency'] as String?,
      offerId: json['offerId'],
      amountDue: json['amountDue'] as int?,
      createdAt: json['createdAt'] as int?,
      amountPaid: json['amountPaid'] as int?,
    );
  final String? id;
  final Notes? notes;
  final int? amount;
  final String? entity;
  final String? status;
  final String? receipt;
  final int? attempts;
  final String? currency;
  final dynamic offerId;
  final int? amountDue;
  final int? createdAt;
  final int? amountPaid;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'notes': notes?.toJson(),
      'amount': amount,
      'entity': entity,
      'status': status,
      'receipt': receipt,
      'attempts': attempts,
      'currency': currency,
      'offerId': offerId,
      'amountDue': amountDue,
      'createdAt': createdAt,
      'amountPaid': amountPaid,
    };
}

class Notes {

  Notes({
    this.bookingId,
    this.bookingReference,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
      bookingId: json['bookingId'] as String?,
      bookingReference: json['bookingReference'] as String?,
    );
  final String? bookingId;
  final String? bookingReference;

  Map<String, dynamic> toJson() => <String, dynamic>{
      'bookingId': bookingId,
      'bookingReference': bookingReference,
    };
}
