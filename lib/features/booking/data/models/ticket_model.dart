import 'dart:convert';

// --- Top-Level Model for the partial JSON ---

class BookingListModel {
  BookingListModel({
    this.bookings,
    this.pagination,
  });

  factory BookingListModel.fromRawJson(String str) =>
      BookingListModel.fromJson(json.decode(str));

  factory BookingListModel.fromJson(Map<String, dynamic> json) =>
      BookingListModel(
        bookings: json['bookings'] == null
            ? null
            : List<Booking>.from(
                json['bookings']!.map((x) => Booking.fromJson(x))),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination']),
      );
  final List<Booking>? bookings;
  final Pagination? pagination;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'bookings': bookings == null
            ? null
            : List<dynamic>.from(bookings!.map((x) => x.toJson())),
        'pagination': pagination?.toJson(),
      };
}

// --- Booking and Related Models ---

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
    this.referenceNumber,
    this.cancellationPolicy,
    this.refundPolicy,
    this.flightOrderId,
    this.amadeusOrderData,
    this.createdAt,
    this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json['id'],
        bookingReference: '${json['booking_reference']}',
        userId: json['user_id'],
        flightOfferId: '${json['flight_offer_id']}',
        flightData: json['flight_data'] == null
            ? null
            : FlightData.fromJson(json['flight_data']),
        travellerDetails: json['traveller_details'] == null
            ? null
            : TravellerDetails.fromJson(json['traveller_details']),
        billingAddress: json['billing_address'] == null
            ? null
            : BillingAddress.fromJson(json['billing_address']),
        contactDetails: json['contact_details'] == null
            ? null
            : ContactDetails.fromJson(json['contact_details']),
        seatSelections: json['seat_selections'],
        mealSelections: json['meal_selections'],
        insuranceSelections: json['insurance_selections'],
        fareDetails: json['fare_details'] == null
            ? null
            : FareDetails.fromJson(json['fare_details']),
        totalAmount: '${json['total_amount']}',
        currency: '${json['currency']}',
        bookingStatus: '${json['booking_status']}',
        paymentStatus: '${json['payment_status']}',
        bookingType: '${json['booking_type']}',
        expiresAt: '${json['expires_at']}',
        confirmationNumber: '${json['confirmation_number']}',
        referenceNumber: '${json['reference_number']}',
        ticketNumbers: json['ticket_numbers'] == null
            ? null
            : List<String>.from(json['ticket_numbers']!.map((x) => '$x')),
        pnrNumber: '${json['pnr_number']}',
        cancellationPolicy: json['cancellation_policy'] == null
            ? null
            : CancellationPolicy.fromJson(json['cancellation_policy']),
        refundPolicy: json['refund_policy'] == null
            ? null
            : RefundPolicy.fromJson(json['refund_policy']),
        flightOrderId: '${json['flight_order_id']}',
        amadeusOrderData: json['amadeus_order_data'] == null
            ? null
            : AmadeusOrderData.fromJson(json['amadeus_order_data']),
        createdAt: '${json['created_at']}',
        updatedAt: '${json['updated_at']}',
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
  final String? expiresAt;
  final String? confirmationNumber;
  final List<String>? ticketNumbers;
  final String? pnrNumber;
  final String? referenceNumber;
  final CancellationPolicy? cancellationPolicy;
  final RefundPolicy? refundPolicy;
  final String? flightOrderId;
  final AmadeusOrderData? amadeusOrderData;
  final String? createdAt;
  final String? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'booking_reference': bookingReference,
        'user_id': userId,
        'flight_offer_id': flightOfferId,
        'flight_data': flightData?.toJson(),
        'traveller_details': travellerDetails?.toJson(),
        'billing_address': billingAddress?.toJson(),
        'contact_details': contactDetails?.toJson(),
        'seat_selections': seatSelections,
        'meal_selections': mealSelections,
        'insurance_selections': insuranceSelections,
        'fare_details': fareDetails?.toJson(),
        'total_amount': totalAmount,
        'currency': currency,
        'booking_status': bookingStatus,
        'payment_status': paymentStatus,
        'booking_type': bookingType,
        'expires_at': expiresAt,
        'confirmation_number': confirmationNumber,
        'ticket_numbers': ticketNumbers == null
            ? null
            : List<dynamic>.from(ticketNumbers!.map((x) => x)),
        'pnr_number': pnrNumber,
        'cancellation_policy': cancellationPolicy?.toJson(),
        'refund_policy': refundPolicy?.toJson(),
        'flight_order_id': flightOrderId,
        'amadeus_order_data': amadeusOrderData?.toJson(),
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

// ---------------------------------------------
// NESTED MODELS (AmadeusOrderData, FlightOffer, etc.)
// ---------------------------------------------

class AmadeusOrderData {
  AmadeusOrderData({
    this.id,
    this.type,
    this.remarks,
    this.contacts,
    this.travelers,
    this.flightOffers,
    this.queuingOfficeId,
    this.automatedProcess,
    this.associatedRecords,
    this.ticketingAgreement,
  });

  factory AmadeusOrderData.fromJson(Map<String, dynamic> json) =>
      AmadeusOrderData(
        id: '${json['id']}',
        type: '${json['type']}',
        remarks:
            json['remarks'] == null ? null : Remarks.fromJson(json['remarks']),
        contacts: json['contacts'] == null
            ? null
            : List<ContactElement>.from(
                json['contacts']!.map((x) => ContactElement.fromJson(x))),
        travelers: json['travelers'] == null
            ? null
            : List<Traveler>.from(
                json['travelers']!.map((x) => Traveler.fromJson(x))),
        flightOffers: json['flightOffers'] == null
            ? null
            : List<FlightOffer>.from(
                json['flightOffers']!.map((x) => FlightOffer.fromJson(x))),
        queuingOfficeId: '${json['queuingOfficeId']}',
        automatedProcess: json['automatedProcess'] == null
            ? null
            : List<AutomatedProcess>.from(json['automatedProcess']!
                .map((x) => AutomatedProcess.fromJson(x))),
        associatedRecords: json['associatedRecords'] == null
            ? null
            : List<AssociatedRecord>.from(json['associatedRecords']!
                .map((x) => AssociatedRecord.fromJson(x))),
        ticketingAgreement: json['ticketingAgreement'] == null
            ? null
            : TicketingAgreement.fromJson(json['ticketingAgreement']),
      );
  final String? id;
  final String? type;
  final Remarks? remarks;
  final List<ContactElement>? contacts;
  final List<Traveler>? travelers;
  final List<FlightOffer>? flightOffers;
  final String? queuingOfficeId;
  final List<AutomatedProcess>? automatedProcess;
  final List<AssociatedRecord>? associatedRecords;
  final TicketingAgreement? ticketingAgreement;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'remarks': remarks?.toJson(),
        'contacts': contacts == null
            ? null
            : List<dynamic>.from(contacts!.map((x) => x.toJson())),
        'travelers': travelers == null
            ? null
            : List<dynamic>.from(travelers!.map((x) => x.toJson())),
        'flightOffers': flightOffers == null
            ? null
            : List<dynamic>.from(flightOffers!.map((x) => x.toJson())),
        'queuingOfficeId': queuingOfficeId,
        'automatedProcess': automatedProcess == null
            ? null
            : List<dynamic>.from(automatedProcess!.map((x) => x.toJson())),
        'associatedRecords': associatedRecords == null
            ? null
            : List<dynamic>.from(associatedRecords!.map((x) => x.toJson())),
        'ticketingAgreement': ticketingAgreement?.toJson(),
      };
}

class AssociatedRecord {
  AssociatedRecord({
    this.reference,
    this.creationDate,
    this.flightOfferId,
    this.originSystemCode,
  });

  factory AssociatedRecord.fromJson(Map<String, dynamic> json) =>
      AssociatedRecord(
        reference: '${json['reference']}',
        creationDate: json['creationDate'] ?? '',
        flightOfferId: '${json['flightOfferId']}',
        originSystemCode: '${json['originSystemCode']}',
      );
  final String? reference;
  final String? creationDate;
  final String? flightOfferId;
  final String? originSystemCode;

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'creationDate': creationDate ?? '',
        'flightOfferId': flightOfferId,
        'originSystemCode': originSystemCode,
      };
}

class AutomatedProcess {
  AutomatedProcess({
    this.code,
    this.queue,
    this.officeId,
  });

  factory AutomatedProcess.fromJson(Map<String, dynamic> json) =>
      AutomatedProcess(
        code: '${json['code']}',
        queue: json['queue'] == null ? null : Queue.fromJson(json['queue']),
        officeId: '${json['officeId']}',
      );
  final String? code;
  final Queue? queue;
  final String? officeId;

  Map<String, dynamic> toJson() => {
        'code': code,
        'queue': queue?.toJson(),
        'officeId': officeId,
      };
}

class Queue {
  Queue({
    this.number,
    this.category,
  });

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
        number: '${json['number']}',
        category: '${json['category']}',
      );
  final String? number;
  final String? category;

  Map<String, dynamic> toJson() => {
        'number': number,
        'category': category,
      };
}

class ContactElement {
  ContactElement({
    this.phones,
    this.address,
    this.purpose,
    this.companyName,
    this.emailAddress,
    this.addresseeName,
  });

  factory ContactElement.fromJson(Map<String, dynamic> json) => ContactElement(
        phones: json['phones'] == null
            ? null
            : List<Phone>.from(json['phones']!.map((x) => Phone.fromJson(x))),
        address:
            json['address'] == null ? null : Address.fromJson(json['address']),
        purpose: '${json['purpose']}',
        companyName: '${json['companyName']}',
        emailAddress: '${json['emailAddress']}',
        addresseeName: json['addresseeName'] == null
            ? null
            : AddresseeName.fromJson(json['addresseeName']),
      );
  final List<Phone>? phones;
  final Address? address;
  final String? purpose;
  final String? companyName;
  final String? emailAddress;
  final AddresseeName? addresseeName;

  Map<String, dynamic> toJson() => {
        'phones': phones == null
            ? null
            : List<dynamic>.from(phones!.map((x) => x.toJson())),
        'address': address?.toJson(),
        'purpose': purpose,
        'companyName': companyName,
        'emailAddress': emailAddress,
        'addresseeName': addresseeName?.toJson(),
      };
}

class Address {
  Address({
    this.lines,
    this.cityName,
    this.postalCode,
    this.countryCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        lines: json['lines'],
        cityName: '${json['cityName']}',
        postalCode: '${json['postalCode']}',
        countryCode: '${json['countryCode']}',
      );
  final List<dynamic>? lines;
  final String? cityName;
  final String? postalCode;
  final String? countryCode;

  Map<String, dynamic> toJson() => {
        'lines': lines,
        'cityName': cityName,
        'postalCode': postalCode,
        'countryCode': countryCode,
      };
}

class AddresseeName {
  AddresseeName({
    this.firstName,
  });

  factory AddresseeName.fromJson(Map<String, dynamic> json) => AddresseeName(
        firstName: '${json['firstName']}',
      );
  final String? firstName;

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
      };
}

class Phone {
  Phone({
    this.number,
    this.deviceType,
    this.countryCallingCode,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        number: '${json['number']}',
        deviceType: '${json['deviceType']}',
        countryCallingCode: '${json['countryCallingCode']}',
      );
  final String? number;
  final String? deviceType;
  final String? countryCallingCode;

  Map<String, dynamic> toJson() => {
        'number': number,
        'deviceType': deviceType,
        'countryCallingCode': countryCallingCode,
      };
}

class FlightOffer {
  FlightOffer({
    this.id,
    this.type,
    this.price,
    this.source,
    this.itineraries,
    this.nonHomogeneous,
    this.pricingOptions,
    this.travelerPricings,
    this.lastTicketingDate,
    this.validatingAirlineCodes,
  });

  factory FlightOffer.fromJson(Map<String, dynamic> json) => FlightOffer(
        id: '${json['id']}',
        type: '${json['type']}',
        price: json['price'] == null
            ? null
            : FlightOfferPrice.fromJson(json['price']),
        source: '${json['source']}',
        itineraries: json['itineraries'] == null
            ? null
            : List<Itinerary>.from(
                json['itineraries']!.map((x) => Itinerary.fromJson(x))),
        nonHomogeneous: json['nonHomogeneous'],
        pricingOptions: json['pricingOptions'] == null
            ? null
            : PricingOptions.fromJson(json['pricingOptions']),
        travelerPricings: json['travelerPricings'] == null
            ? null
            : List<TravelerPricing>.from(json['travelerPricings']!
                .map((x) => TravelerPricing.fromJson(x))),
        lastTicketingDate: '${json['lastTicketingDate']}',
        validatingAirlineCodes: json['validatingAirlineCodes'],
      );
  final String? id;
  final String? type;
  final FlightOfferPrice? price;
  final String? source;
  final List<Itinerary>? itineraries;
  final bool? nonHomogeneous;
  final PricingOptions? pricingOptions;
  final List<TravelerPricing>? travelerPricings;
  final String? lastTicketingDate;
  final List<dynamic>? validatingAirlineCodes;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'price': price?.toJson(),
        'source': source,
        'itineraries': itineraries == null
            ? null
            : List<dynamic>.from(itineraries!.map((x) => x.toJson())),
        'nonHomogeneous': nonHomogeneous,
        'pricingOptions': pricingOptions?.toJson(),
        'travelerPricings': travelerPricings == null
            ? null
            : List<dynamic>.from(travelerPricings!.map((x) => x.toJson())),
        'lastTicketingDate': lastTicketingDate ?? '',
        'validatingAirlineCodes': validatingAirlineCodes,
      };
}

class Itinerary {
  Itinerary({
    this.segments,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        segments: json['segments'] == null
            ? null
            : List<Segment>.from(
                json['segments']!.map((x) => Segment.fromJson(x))),
      );
  final List<Segment>? segments;

  Map<String, dynamic> toJson() => {
        'segments': segments == null
            ? null
            : List<dynamic>.from(segments!.map((x) => x.toJson())),
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
    this.carrierCode,
    this.co2Emissions,
    this.numberOfStops,
    this.operating,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        id: '${json['id']}',
        number: '${json['number']}',
        arrival:
            json['arrival'] == null ? null : Arrival.fromJson(json['arrival']),
        aircraft: json['aircraft'] == null
            ? null
            : Aircraft.fromJson(json['aircraft']),
        duration: '${json['duration']}',
        departure: json['departure'] == null
            ? null
            : Arrival.fromJson(json['departure']),
        carrierCode: '${json['carrierCode']}',
        co2Emissions: json['co2Emissions'] == null
            ? null
            : List<Co2Emission>.from(
                json['co2Emissions']!.map((x) => Co2Emission.fromJson(x))),
        numberOfStops: json['numberOfStops'],
        operating: json['operating'] == null
            ? null
            : Operating.fromJson(json['operating']),
      );
  final String? id;
  final String? number;
  final Arrival? arrival;
  final Aircraft? aircraft;
  final String? duration;
  final Arrival? departure;
  final String? carrierCode;
  final List<Co2Emission>? co2Emissions;
  final int? numberOfStops;
  final Operating? operating;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'arrival': arrival?.toJson(),
        'aircraft': aircraft?.toJson(),
        'duration': duration,
        'departure': departure?.toJson(),
        'carrierCode': carrierCode,
        'co2Emissions': co2Emissions == null
            ? null
            : List<dynamic>.from(co2Emissions!.map((x) => x.toJson())),
        'numberOfStops': numberOfStops,
        'operating': operating?.toJson(),
      };
}

class Aircraft {
  Aircraft({
    this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: '${json['code']}' == 'null' ? null : '${json['code']}',
      );
  final String? code;

  Map<String, dynamic> toJson() => {
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
        at: '${json['at']}',
        iataCode: '${json['iataCode']}',
        terminal: '${json['terminal']}',
      );
  final String? at;
  final String? iataCode;
  final String? terminal;

  Map<String, dynamic> toJson() => {
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
        cabin: '${json['cabin']}',
        weight: json['weight'],
        weightUnit: '${json['weightUnit']}',
      );
  final String? cabin;
  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() => {
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
        carrierCode: '${json['carrierCode']}',
      );
  final String? carrierCode;

  Map<String, dynamic> toJson() => {
        'carrierCode': carrierCode,
      };
}

class FlightOfferPrice {
  FlightOfferPrice({
    this.basePrice,
    this.fees,
    this.total,
    this.currency,
    this.grandTotal,
    this.billingCurrency,
  });

  factory FlightOfferPrice.fromJson(Map<String, dynamic> json) =>
      FlightOfferPrice(
        basePrice: '${json['base']}',
        fees: json['fees'] == null
            ? null
            : List<Fee>.from(json['fees']!.map((x) => Fee.fromJson(x))),
        total: '${json['total']}',
        currency: '${json['currency']}',
        grandTotal: '${json['grandTotal']}',
        billingCurrency: '${json['billingCurrency']}',
      );
  final String? basePrice;
  final List<Fee>? fees;
  final String? total;
  final String? currency;
  final String? grandTotal;
  final String? billingCurrency;

  Map<String, dynamic> toJson() => {
        'base': basePrice,
        'fees': fees == null
            ? null
            : List<dynamic>.from(fees!.map((x) => x.toJson())),
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
        type: '${json['type']}',
        amount: '${json['amount']}',
      );
  final String? type;
  final String? amount;

  Map<String, dynamic> toJson() => {
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
        fareType: json['fareType'],
        includedCheckedBagsOnly: json['includedCheckedBagsOnly'],
      );
  final List<dynamic>? fareType;
  final bool? includedCheckedBagsOnly;

  Map<String, dynamic> toJson() => {
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

  factory TravelerPricing.fromJson(Map<String, dynamic> json) =>
      TravelerPricing(
        price: json['price'] == null
            ? null
            : TravelerPricingPrice.fromJson(json['price']),
        fareOption: '${json['fareOption']}',
        travelerId: '${json['travelerId']}',
        travelerType: '${json['travelerType']}',
        fareDetailsBySegment: json['fareDetailsBySegment'] == null
            ? null
            : List<FareDetailsBySegment>.from(json['fareDetailsBySegment']!
                .map((x) => FareDetailsBySegment.fromJson(x))),
      );
  final TravelerPricingPrice? price;
  final String? fareOption;
  final String? travelerId;
  final String? travelerType;
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  Map<String, dynamic> toJson() => {
        'price': price?.toJson(),
        'fareOption': fareOption,
        'travelerId': travelerId,
        'travelerType': travelerType,
        'fareDetailsBySegment': fareDetailsBySegment == null
            ? null
            : List<dynamic>.from(fareDetailsBySegment!.map((x) => x.toJson())),
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

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) =>
      FareDetailsBySegment(
        cabin: '${json['cabin']}',
        fareDetailsBySegmentClass: '${json['class']}',
        fareBasis: '${json['fareBasis']}',
        segmentId: '${json['segmentId']}',
        brandedFare: '${json['brandedFare']}',
        includedCheckedBags: json['includedCheckedBags'] == null
            ? null
            : IncludedCheckedBags.fromJson(json['includedCheckedBags']),
      );
  final String? cabin;
  final String? fareDetailsBySegmentClass;
  final String? fareBasis;
  final String? segmentId;
  final String? brandedFare;
  final IncludedCheckedBags? includedCheckedBags;

  Map<String, dynamic> toJson() => {
        'cabin': cabin,
        'class': fareDetailsBySegmentClass,
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

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) =>
      IncludedCheckedBags(
        weight: json['weight'],
        weightUnit: '${json['weightUnit']}',
      );
  final int? weight;
  final String? weightUnit;

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'weightUnit': weightUnit,
      };
}

class TravelerPricingPrice {
  TravelerPricingPrice({
    this.basePrice,
    this.taxes,
    this.total,
    this.currency,
    this.refundableTaxes,
  });

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
        basePrice: '${json['base']}',
        taxes: json['taxes'] == null
            ? null
            : List<Tax>.from(json['taxes']!.map((x) => Tax.fromJson(x))),
        total: '${json['total']}',
        currency: '${json['currency']}',
        refundableTaxes: '${json['refundableTaxes']}',
      );
  final String? basePrice;
  final List<Tax>? taxes;
  final String? total;
  final String? currency;
  final String? refundableTaxes;

  Map<String, dynamic> toJson() => {
        'base': basePrice,
        'taxes': taxes == null
            ? null
            : List<dynamic>.from(taxes!.map((x) => x.toJson())),
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
        code: '${json['code']}',
        amount: '${json['amount']}',
      );
  final String? code;
  final String? amount;

  Map<String, dynamic> toJson() => {
        'code': code,
        'amount': amount,
      };
}

class Remarks {
  Remarks({
    this.general,
  });

  factory Remarks.fromJson(Map<String, dynamic> json) => Remarks(
        general: json['general'] == null
            ? null
            : List<General>.from(
                json['general']!.map((x) => General.fromJson(x))),
      );
  final List<General>? general;

  Map<String, dynamic> toJson() => {
        'general': general == null
            ? null
            : List<dynamic>.from(general!.map((x) => x.toJson())),
      };
}

class General {
  General({
    this.text,
    this.subType,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        text: '${json['text']}',
        subType: '${json['subType']}',
      );
  final String? text;
  final String? subType;

  Map<String, dynamic> toJson() => {
        'text': text,
        'subType': subType,
      };
}

class TicketingAgreement {
  TicketingAgreement({
    this.delay,
    this.option,
  });

  factory TicketingAgreement.fromJson(Map<String, dynamic> json) =>
      TicketingAgreement(
        delay: '${json['delay']}',
        option: '${json['option']}',
      );
  final String? delay;
  final String? option;

  Map<String, dynamic> toJson() => {
        'delay': delay,
        'option': option,
      };
}

class Traveler {
  Traveler({
    this.id,
    this.name,
    this.gender,
    this.contact,
    this.dateOfBirth,
  });

  factory Traveler.fromJson(Map<String, dynamic> json) => Traveler(
        id: '${json['id']}',
        name: json['name'] == null ? null : Name.fromJson(json['name']),
        gender: '${json['gender']}',
        contact: json['contact'] == null
            ? null
            : TravelerContact.fromJson(json['contact']),
        dateOfBirth: json['dateOfBirth'] ?? '',
      );
  final String? id;
  final Name? name;
  final String? gender;
  final TravelerContact? contact;
  final String? dateOfBirth;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name?.toJson(),
        'gender': gender,
        'contact': contact?.toJson(),
        'dateOfBirth': dateOfBirth ?? '',
      };
}

class TravelerContact {
  TravelerContact({
    this.phones,
    this.purpose,
    this.emailAddress,
  });

  factory TravelerContact.fromJson(Map<String, dynamic> json) =>
      TravelerContact(
        phones: json['phones'] == null
            ? null
            : List<Phone>.from(json['phones']!.map((x) => Phone.fromJson(x))),
        purpose: '${json['purpose']}',
        emailAddress: '${json['emailAddress']}',
      );
  final List<Phone>? phones;
  final String? purpose;
  final String? emailAddress;

  Map<String, dynamic> toJson() => {
        'phones': phones == null
            ? null
            : List<dynamic>.from(phones!.map((x) => x.toJson())),
        'purpose': purpose,
        'emailAddress': emailAddress,
      };
}

class Name {
  Name({
    this.lastName,
    this.firstName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        lastName: '${json['lastName']}',
        firstName: '${json['firstName']}',
      );
  final String? lastName;
  final String? firstName;

  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
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
        city: '${json['city']}',
        state: '${json['state']}',
        country: '${json['country']}',
        pinCode: '${json['pinCode']}',
        addressLine1: '${json['addressLine1']}',
        addressLine2: '${json['addressLine2']}',
      );
  final String? city;
  final String? state;
  final String? country;
  final String? pinCode;
  final String? addressLine1;
  final String? addressLine2;

  Map<String, dynamic> toJson() => {
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

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
      CancellationPolicy(
        // Use string interpolation for safety before parsing
        cancellationFee: double.parse('${json['cancellation_fee'] ?? 0.0}'),
        refundPercentage: json['refund_percentage'],
        freeCancellationUntil: json['free_cancellation_until'] ?? '',
      );
  final double? cancellationFee;
  final int? refundPercentage;
  final String? freeCancellationUntil;

  Map<String, dynamic> toJson() => {
        'cancellation_fee': cancellationFee,
        'refund_percentage': refundPercentage,
        'free_cancellation_until': freeCancellationUntil ?? '',
      };
}

class ContactDetails {
  ContactDetails({
    this.email,
    this.countryCode,
    this.phoneNumber,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
        email: '${json['email']}',
        countryCode: '${json['countryCode']}',
        phoneNumber: '${json['phoneNumber']}',
      );
  final String? email;
  final String? countryCode;
  final String? phoneNumber;

  Map<String, dynamic> toJson() => {
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
        // Use string interpolation for safety before parsing (fixes 'int' to 'double' error)
        taxes: double.parse('${json['taxes'] ?? 0.0}'),
        markup: double.parse('${json['markup'] ?? 0.0}'),
        baseFare: double.parse('${json['baseFare'] ?? 0.0}'),
        discount: double.parse('${json['discount'] ?? 0.0}'),
        totalFare: double.parse('${json['totalFare'] ?? 0.0}'),
        selectedFare: '${json['selectedFare']}',
        showTotalFare: json['showTotalFare'] ?? false,
        taxesWithMarkup: double.parse('${json['taxesWithMarkup'] ?? 0.0}'),
        originalSubtotal: double.parse('${json['originalSubtotal'] ?? 0.0}'),
      );
  final double? taxes;
  final double? markup;
  final double? baseFare;
  final double? discount;
  final double? totalFare;
  final String? selectedFare;
  final bool? showTotalFare;
  final double? taxesWithMarkup;
  final double? originalSubtotal;

  Map<String, dynamic> toJson() => {
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
        id: '${json['id']}',
        type: '${json['type']}',
        price: json['price'] == null
            ? null
            : FlightOfferPrice.fromJson(json['price']),
        source: '${json['source']}',
        itineraries: json['itineraries'] == null
            ? null
            : List<Itinerary>.from(
                json['itineraries']!.map((x) => Itinerary.fromJson(x))),
        nonHomogeneous: json['nonHomogeneous'],
        pricingOptions: json['pricingOptions'] == null
            ? null
            : PricingOptions.fromJson(json['pricingOptions']),
        travelerPricings: json['travelerPricings'] == null
            ? null
            : List<TravelerPricing>.from(json['travelerPricings']!
                .map((x) => TravelerPricing.fromJson(x))),
        lastTicketingDate: json['lastTicketingDate'] ?? '',
        paymentCardRequired: json['paymentCardRequired'],
        validatingAirlineCodes: json['validatingAirlineCodes'],
        instantTicketingRequired: json['instantTicketingRequired'],
      );
  final String? id;
  final String? type;
  final FlightOfferPrice? price;
  final String? source;
  final List<Itinerary>? itineraries;
  final bool? nonHomogeneous;
  final PricingOptions? pricingOptions;
  final List<TravelerPricing>? travelerPricings;
  final String? lastTicketingDate;
  final bool? paymentCardRequired;
  final List<dynamic>? validatingAirlineCodes;
  final bool? instantTicketingRequired;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'price': price?.toJson(),
        'source': source,
        'itineraries': itineraries == null
            ? null
            : List<dynamic>.from(itineraries!.map((x) => x.toJson())),
        'nonHomogeneous': nonHomogeneous,
        'pricingOptions': pricingOptions?.toJson(),
        'travelerPricings': travelerPricings == null
            ? null
            : List<dynamic>.from(travelerPricings!.map((x) => x.toJson())),
        'lastTicketingDate': lastTicketingDate ?? '',
        'paymentCardRequired': paymentCardRequired,
        'validatingAirlineCodes': validatingAirlineCodes,
        'instantTicketingRequired': instantTicketingRequired,
      };
}

class RefundPolicy {
  RefundPolicy({
    this.refundable,
    this.processingTime,
    this.refundDeadline,
  });

  factory RefundPolicy.fromJson(Map<String, dynamic> json) => RefundPolicy(
        refundable: json['refundable'],
        processingTime: '${json['processing_time']}',
        refundDeadline: json['refund_deadline'] ?? '',
      );
  final bool? refundable;
  final String? processingTime;
  final String? refundDeadline;

  Map<String, dynamic> toJson() => {
        'refundable': refundable,
        'processing_time': processingTime,
        'refund_deadline': refundDeadline ?? '',
      };
}

class TravellerDetails {
  TravellerDetails({
    this.adults,
    this.infants,
    this.children,
  });

  factory TravellerDetails.fromJson(Map<String, dynamic> json) =>
      TravellerDetails(
        adults: json['adults'] == null
            ? null
            : List<Adult>.from(json['adults']!.map((x) => Adult.fromJson(x))),
        infants: json['infants'] == null
            ? null
            : List<Adult>.from(json['infants']!.map((x) => Adult.fromJson(x))),
        children: json['children'] == null
            ? null
            : List<Adult>.from(json['children']!.map((x) => Adult.fromJson(x))),
      );
  final List<Adult>? adults;
  final List<Adult>? infants;
  final List<Adult>? children;

  Map<String, dynamic> toJson() => {
        'adults': adults == null
            ? null
            : List<Adult>.from(adults!.map((x) => x.toJson())),
        'infants':
            infants == null ? null : List<Adult>.from(infants!.map((x) => x)),
        'children':
            children == null ? null : List<Adult>.from(children!.map((x) => x)),
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
    this.gender,
    this.number,
    this.type,
    this.countryCode,
  });

  factory Adult.fromJson(Map<String, dynamic> json) => Adult(
        open: json['open'],
        title: '${json['title']}',
        lastName: '${json['lastName']}',
        firstName: '${json['firstName']}',
        dateOfBirth: json['dateOfBirth'] ?? '',
        nationality: '${json['nationality']}',
        gender: '${json['gender']}',
        number: '${json['number']}',
        type: '${json['type']}',
        countryCode: '${json['countryCode']}',
      );
  final bool? open;
  final String? title;
  final String? lastName;
  final String? firstName;
  final String? dateOfBirth;
  final String? nationality;
  final String? gender;
  final String? number;
  final String? type;
  final String? countryCode;

  Map<String, dynamic> toJson() => {
        'open': open,
        'title': title,
        'lastName': lastName,
        'firstName': firstName,
        'dateOfBirth': dateOfBirth ?? '',
        'nationality': nationality,
      };
}

class Pagination {
  Pagination({
    this.currentPage,
    this.itemsPerPage,
    this.totalItems,
    this.totalPages,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json['currentPage'],
        itemsPerPage: json['itemsPerPage'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages'],
        hasNextPage: json['hasNextPage'],
        hasPreviousPage: json['hasPreviousPage'],
      );
  final int? currentPage;
  final int? itemsPerPage;
  final int? totalItems;
  final int? totalPages;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'itemsPerPage': itemsPerPage,
        'totalItems': totalItems,
        'totalPages': totalPages,
        'hasNextPage': hasNextPage,
        'hasPreviousPage': hasPreviousPage,
      };
}
