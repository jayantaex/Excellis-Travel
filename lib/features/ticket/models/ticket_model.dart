// -----------------------------------------------------------------------------
// TICKET DATA MODEL
// -----------------------------------------------------------------------------

class TicketDataModel {
  factory TicketDataModel.fromJson(Map<String, dynamic> json) =>
      TicketDataModel(
        id: json['id'],
        bookingReference: json['booking_reference'],
        userId: json['user_id'],
        flightOfferId: json['flight_offer_id'],
        flightData: json['flight_data'] == null
            ? null
            : Flight.fromJson(json['flight_data']),
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
        totalAmount: json['total_amount'],
        currency: json['currency'],
        bookingStatus: json['booking_status'],
        paymentStatus: json['payment_status'],
        bookingType: json['booking_type'],
        expiresAt: json['expires_at'] == null
            ? null
            : DateTime.parse(json['expires_at']),
        confirmationNumber: json['confirmation_number'],
        ticketNumbers: json['ticket_numbers'] == null
            ? null
            : List<String>.from(json['ticket_numbers'].map((x) => x)),
        pnrNumber: json['pnr_number'],
        cancellationPolicy: json['cancellation_policy'] == null
            ? null
            : CancellationPolicy.fromJson(json['cancellation_policy']),
        refundPolicy: json['refund_policy'] == null
            ? null
            : RefundPolicy.fromJson(json['refund_policy']),
        flightOrderId: json['flight_order_id'],
        amadeusOrderData: json['amadeus_order_data'] == null
            ? null
            : AmadeusOrderData.fromJson(json['amadeus_order_data']),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  TicketDataModel({
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
  final int? id;
  final String? bookingReference;
  final int? userId;
  final String? flightOfferId;
  final Flight? flightData;
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
  final List<String>? ticketNumbers;
  final String? pnrNumber;
  final CancellationPolicy? cancellationPolicy;
  final RefundPolicy? refundPolicy;
  final String? flightOrderId;
  final AmadeusOrderData? amadeusOrderData;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
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
        'expires_at': expiresAt?.toIso8601String(),
        'confirmation_number': confirmationNumber,
        'ticket_numbers': ticketNumbers == null
            ? null
            : List<dynamic>.from(ticketNumbers!.map((String x) => x)),
        'pnr_number': pnrNumber,
        'cancellation_policy': cancellationPolicy?.toJson(),
        'refund_policy': refundPolicy?.toJson(),
        'flight_order_id': flightOrderId,
        'amadeus_order_data': amadeusOrderData?.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

// -----------------------------------------------------------------------------
// AMADEUS RELATED MODELS
// -----------------------------------------------------------------------------

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
        id: json['id'],
        type: json['type'],
        remarks:
            json['remarks'] == null ? null : Remarks.fromJson(json['remarks']),
        contacts: json['contacts'] == null
            ? null
            : List<ContactElement>.from(
                json['contacts'].map((x) => ContactElement.fromJson(x))),
        travelers: json['travelers'] == null
            ? null
            : List<Traveler>.from(
                json['travelers'].map((x) => Traveler.fromJson(x))),
        flightOffers: json['flight_offers'] == null
            ? null
            : List<Flight>.from(
                json['flight_offers'].map((x) => Flight.fromJson(x))),
        queuingOfficeId: json['queuing_office_id'],
        automatedProcess: json['automated_process'] == null
            ? null
            : List<AutomatedProcess>.from(json['automated_process']
                .map((x) => AutomatedProcess.fromJson(x))),
        associatedRecords: json['associated_records'] == null
            ? null
            : List<AssociatedRecord>.from(json['associated_records']
                .map((x) => AssociatedRecord.fromJson(x))),
        ticketingAgreement: json['ticketing_agreement'] == null
            ? null
            : TicketingAgreement.fromJson(json['ticketing_agreement']),
      );
  final String? id;
  final String? type;
  final Remarks? remarks;
  final List<ContactElement>? contacts;
  final List<Traveler>? travelers;
  final List<Flight>? flightOffers;
  final String? queuingOfficeId;
  final List<AutomatedProcess>? automatedProcess;
  final List<AssociatedRecord>? associatedRecords;
  final TicketingAgreement? ticketingAgreement;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'remarks': remarks?.toJson(),
        'contacts': contacts == null
            ? null
            : List<dynamic>.from(
                contacts!.map((ContactElement x) => x.toJson())),
        'travelers': travelers == null
            ? null
            : List<dynamic>.from(travelers!.map((Traveler x) => x.toJson())),
        'flight_offers': flightOffers == null
            ? null
            : List<dynamic>.from(flightOffers!.map((Flight x) => x.toJson())),
        'queuing_office_id': queuingOfficeId,
        'automated_process': automatedProcess == null
            ? null
            : List<dynamic>.from(
                automatedProcess!.map((AutomatedProcess x) => x.toJson())),
        'associated_records': associatedRecords == null
            ? null
            : List<dynamic>.from(
                associatedRecords!.map((AssociatedRecord x) => x.toJson())),
        'ticketing_agreement': ticketingAgreement?.toJson(),
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
        reference: json['reference'],
        creationDate: json['creation_date'] == null
            ? null
            : DateTime.parse(json['creation_date']),
        flightOfferId: json['flight_offer_id'],
        originSystemCode: json['origin_system_code'],
      );
  final String? reference;
  final DateTime? creationDate;
  final String? flightOfferId;
  final String? originSystemCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'reference': reference,
        'creation_date': creationDate?.toIso8601String(),
        'flight_offer_id': flightOfferId,
        'origin_system_code': originSystemCode,
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
        code: json['code'],
        queue: json['queue'] == null ? null : Queue.fromJson(json['queue']),
        officeId: json['office_id'],
      );
  final String? code;
  final Queue? queue;
  final String? officeId;

  Map<String, dynamic> toJson() => <String, dynamic>{
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
        number: json['number'],
        category: json['category'],
      );
  final String? number;
  final String? category;

  Map<String, dynamic> toJson() => <String, dynamic>{
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
            : List<Phone>.from(json['phones'].map((x) => Phone.fromJson(x))),
        address:
            json['address'] == null ? null : Address.fromJson(json['address']),
        purpose: json['purpose'],
        companyName: json['companyName'],
        emailAddress: json['emailAddress'],
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phones': phones == null
            ? null
            : List<dynamic>.from(phones!.map((Phone x) => x.toJson())),
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
        lines: json['lines'] == null
            ? null
            : List<String>.from(json['lines'].map((x) => x)),
        cityName: json['cityName'],
        postalCode: json['postalCode'],
        countryCode: json['countryCode'],
      );
  final List<String>? lines;
  final String? cityName;
  final String? postalCode;
  final String? countryCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lines': lines == null
            ? null
            : List<dynamic>.from(lines!.map((String x) => x)),
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
        firstName: json['firstName'],
      );
  final String? firstName;

  Map<String, dynamic> toJson() => <String, dynamic>{
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
        number: json['number'],
        deviceType: json['deviceType'],
        countryCallingCode: json['countryCallingCode'],
      );
  final String? number;
  final String? deviceType;
  final String? countryCallingCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'number': number,
        'deviceType': deviceType,
        'countryCallingCode': countryCallingCode,
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
                json['general'].map((x) => General.fromJson(x))),
      );
  final List<General>? general;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'general': general == null
            ? null
            : List<dynamic>.from(general!.map((General x) => x.toJson())),
      };
}

class General {
  General({
    this.text,
    this.subType,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        text: json['text'],
        subType: json['subType'],
      );
  final String? text;
  final String? subType;

  Map<String, dynamic> toJson() => <String, dynamic>{
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
        delay: json['delay'],
        option: json['option'],
      );
  final String? delay;
  final String? option;

  Map<String, dynamic> toJson() => <String, dynamic>{
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
        id: json['id'],
        name: json['name'] == null ? null : Name.fromJson(json['name']),
        gender: json['gender'],
        contact: json['contact'] == null
            ? null
            : TravelerContact.fromJson(json['contact']),
        dateOfBirth: json['dateOfBirth'] == null
            ? null
            : DateTime.parse(json['dateOfBirth']),
      );
  final String? id;
  final Name? name;
  final String? gender;
  final TravelerContact? contact;
  final DateTime? dateOfBirth;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name?.toJson(),
        'gender': gender,
        'contact': contact?.toJson(),
        'dateOfBirth': dateOfBirth == null
            ? null
            : "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
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
            : List<Phone>.from(json['phones'].map((x) => Phone.fromJson(x))),
        purpose: json['purpose'],
        emailAddress: json['emailAddress'],
      );
  final List<Phone>? phones;
  final String? purpose;
  final String? emailAddress;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phones': phones == null
            ? null
            : List<dynamic>.from(phones!.map((Phone x) => x.toJson())),
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
        lastName: json['lastName'],
        firstName: json['firstName'],
      );
  final String? lastName;
  final String? firstName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lastName': lastName,
        'firstName': firstName,
      };
}

// -----------------------------------------------------------------------------
// FLIGHT RELATED MODELS
// -----------------------------------------------------------------------------

class Flight {
  Flight({
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
    this.paymentCardRequired,
    this.instantTicketingRequired,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        id: json['id'],
        type: json['type'],
        price: json['price'] == null
            ? null
            : FlightDataPrice.fromJson(json['price']),
        source: json['source'],
        itineraries: json['itineraries'] == null
            ? null
            : List<Itinerary>.from(
                json['itineraries'].map((x) => Itinerary.fromJson(x))),
        nonHomogeneous: json['nonHomogeneous'],
        pricingOptions: json['pricingOptions'] == null
            ? null
            : PricingOptions.fromJson(json['pricingOptions']),
        travelerPricings: json['travelerPricings'] == null
            ? null
            : List<TravelerPricing>.from(json['travelerPricings']
                .map((x) => TravelerPricing.fromJson(x))),
        lastTicketingDate: json['lastTicketingDate'] == null
            ? null
            : DateTime.parse(json['lastTicketingDate']),
        validatingAirlineCodes: json['validatingAirlineCodes'] == null
            ? null
            : List<String>.from(json['validatingAirlineCodes'].map((x) => x)),
        paymentCardRequired: json['paymentCardRequired'],
        instantTicketingRequired: json['instantTicketingRequired'],
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
  final List<String>? validatingAirlineCodes;
  final bool? paymentCardRequired;
  final bool? instantTicketingRequired;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'price': price?.toJson(),
        'source': source,
        'itineraries': itineraries == null
            ? null
            : List<dynamic>.from(itineraries!.map((Itinerary x) => x.toJson())),
        'nonHomogeneous': nonHomogeneous,
        'pricingOptions': pricingOptions?.toJson(),
        'travelerPricings': travelerPricings == null
            ? null
            : List<dynamic>.from(
                travelerPricings!.map((TravelerPricing x) => x.toJson())),
        'lastTicketingDate': lastTicketingDate?.toIso8601String(),
        'validatingAirlineCodes': validatingAirlineCodes == null
            ? null
            : List<dynamic>.from(validatingAirlineCodes!.map((String x) => x)),
        'paymentCardRequired': paymentCardRequired,
        'instantTicketingRequired': instantTicketingRequired,
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
                json['segments'].map((x) => Segment.fromJson(x))),
      );
  final List<Segment>? segments;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'segments': segments == null
            ? null
            : List<dynamic>.from(segments!.map((Segment x) => x.toJson())),
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
        id: json['id'],
        number: json['number'],
        arrival:
            json['arrival'] == null ? null : Arrival.fromJson(json['arrival']),
        aircraft: json['aircraft'] == null
            ? null
            : Aircraft.fromJson(json['aircraft']),
        duration: json['duration'],
        departure: json['departure'] == null
            ? null
            : Arrival.fromJson(json['departure']),
        operating: json['operating'] == null
            ? null
            : Operating.fromJson(json['operating']),
        carrierCode: json['carrierCode'],
        co2Emissions: json['co2Emissions'] == null
            ? null
            : List<Co2Emission>.from(
                json['co2Emissions'].map((x) => Co2Emission.fromJson(x))),
        numberOfStops: json['numberOfStops'],
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
        'co2Emissions': co2Emissions == null
            ? null
            : List<dynamic>.from(
                co2Emissions!.map((Co2Emission x) => x.toJson())),
        'numberOfStops': numberOfStops,
      };
}

class Aircraft {
  Aircraft({
    this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json['code'],
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
        at: json['at'] == null ? null : DateTime.parse(json['at']),
        iataCode: json['iataCode'],
        terminal: json['terminal'],
      );
  final DateTime? at;
  final String? iataCode;
  final String? terminal;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'at': at?.toIso8601String(),
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
        cabin: json['cabin'],
        weight: json['weight'],
        weightUnit: json['weightUnit'],
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
        carrierCode: json['carrierCode'],
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

  factory FlightDataPrice.fromJson(Map<String, dynamic> json) =>
      FlightDataPrice(
        base: json['base'],
        fees: json['fees'] == null
            ? null
            : List<Fee>.from(json['fees'].map((x) => Fee.fromJson(x))),
        total: json['total'],
        currency: json['currency'],
        grandTotal: json['grandTotal'],
        billingCurrency: json['billingCurrency'],
      );
  final String? base;
  final List<Fee>? fees;
  final String? total;
  final String? currency;
  final String? grandTotal;
  final String? billingCurrency;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'base': base,
        'fees': fees == null
            ? null
            : List<dynamic>.from(fees!.map((Fee x) => x.toJson())),
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
        type: json['type'],
        amount: json['amount'],
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
        fareType: json['fareType'] == null
            ? null
            : List<String>.from(json['fareType'].map((x) => x)),
        includedCheckedBagsOnly: json['includedCheckedBagsOnly'],
      );
  final List<String>? fareType;
  final bool? includedCheckedBagsOnly;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fareType': fareType == null
            ? null
            : List<dynamic>.from(fareType!.map((String x) => x)),
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
        fareOption: json['fareOption'],
        travelerId: json['travelerId'],
        travelerType: json['travelerType'],
        fareDetailsBySegment: json['fareDetailsBySegment'] == null
            ? null
            : List<FareDetailsBySegment>.from(json['fareDetailsBySegment']
                .map((x) => FareDetailsBySegment.fromJson(x))),
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
        'fareDetailsBySegment': fareDetailsBySegment == null
            ? null
            : List<dynamic>.from(fareDetailsBySegment!
                .map((FareDetailsBySegment x) => x.toJson())),
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
        cabin: json['cabin'],
        fareDetailsBySegmentClass: json['class'],
        fareBasis: json['fareBasis'],
        segmentId: json['segmentId'],
        brandedFare: json['brandedFare'],
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

  Map<String, dynamic> toJson() => <String, dynamic>{
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
        weightUnit: json['weightUnit'],
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

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) =>
      TravelerPricingPrice(
        base: json['base'],
        taxes: json['taxes'] == null
            ? null
            : List<Tax>.from(json['taxes'].map((x) => Tax.fromJson(x))),
        total: json['total'],
        currency: json['currency'],
        refundableTaxes: json['refundableTaxes'],
      );
  final String? base;
  final List<Tax>? taxes;
  final String? total;
  final String? currency;
  final String? refundableTaxes;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'base': base,
        'taxes': taxes == null
            ? null
            : List<dynamic>.from(taxes!.map((Tax x) => x.toJson())),
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
        code: json['code'],
        amount: json['amount'],
      );
  final String? code;
  final String? amount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'amount': amount,
      };
}

// -----------------------------------------------------------------------------
// TRAVELLER & FARE MODELS
// -----------------------------------------------------------------------------

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
            : List<Adult>.from(json['adults'].map((x) => Adult.fromJson(x))),
        infants: json['infants'] == null
            ? null
            : List<dynamic>.from(json['infants'].map((x) => x)),
        children: json['children'] == null
            ? null
            : List<dynamic>.from(json['children'].map((x) => x)),
      );
  final List<Adult>? adults;
  final List<dynamic>? infants;
  final List<dynamic>? children;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'adults': adults == null
            ? null
            : List<dynamic>.from(adults!.map((Adult x) => x.toJson())),
        'infants':
            infants == null ? null : List<dynamic>.from(infants!.map((x) => x)),
        'children': children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x)),
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
        open: json['open'],
        title: json['title'],
        lastName: json['last_name'],
        firstName: json['first_name'],
        dateOfBirth: json['date_of_birth'] == null
            ? null
            : DateTime.parse(json['date_of_birth']),
        nationality: json['nationality'],
      );
  final bool? open;
  final String? title;
  final String? lastName;
  final String? firstName;
  final DateTime? dateOfBirth;
  final String? nationality;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'open': open,
        'title': title,
        'last_name': lastName,
        'first_name': firstName,
        'date_of_birth': dateOfBirth == null
            ? null
            : "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        'nationality': nationality,
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
        city: json['city'],
        state: json['state'],
        country: json['country'],
        pinCode: json['pin_code'],
        addressLine1: json['address_line1'],
        addressLine2: json['address_line2'],
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
        'pin_code': pinCode,
        'address_line1': addressLine1,
        'address_line2': addressLine2,
      };
}

class ContactDetails {
  ContactDetails({
    this.email,
    this.countryCode,
    this.phoneNumber,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
        email: json['email'],
        countryCode: json['country_code'],
        phoneNumber: json['phone_number'],
      );
  final String? email;
  final String? countryCode;
  final String? phoneNumber;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'country_code': countryCode,
        'phone_number': phoneNumber,
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
        taxes: json['taxes'],
        markup: double.parse('${json["markup"] ?? 0.0}'),
        baseFare: json['base_fare'],
        discount: json['discount'],
        totalFare: double.parse('${json["total_fare"] ?? 0.0}'),
        selectedFare: json['selected_fare'],
        showTotalFare: json['show_total_fare'],
        taxesWithMarkup: json['taxes_with_markup'],
        originalSubtotal: json['original_subtotal'],
      );
  final int? taxes;
  final double? markup;
  final int? baseFare;
  final int? discount;
  final double? totalFare;
  final String? selectedFare;
  final bool? showTotalFare;
  final int? taxesWithMarkup;
  final int? originalSubtotal;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'taxes': taxes,
        'markup': markup,
        'base_fare': baseFare,
        'discount': discount,
        'total_fare': totalFare,
        'selected_fare': selectedFare,
        'show_total_fare': showTotalFare,
        'taxes_with_markup': taxesWithMarkup,
        'original_subtotal': originalSubtotal,
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
        cancellationFee: json['cancellation_fee'],
        refundPercentage: json['refund_percentage'],
        freeCancellationUntil: json['free_cancellation_until'] == null
            ? null
            : DateTime.parse(json['free_cancellation_until']),
      );
  final int? cancellationFee;
  final int? refundPercentage;
  final DateTime? freeCancellationUntil;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cancellation_fee': cancellationFee,
        'refund_percentage': refundPercentage,
        'free_cancellation_until': freeCancellationUntil?.toIso8601String(),
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
        processingTime: json['processing_time'],
        refundDeadline: json['refund_deadline'] == null
            ? null
            : DateTime.parse(json['refund_deadline']),
      );
  final bool? refundable;
  final String? processingTime;
  final DateTime? refundDeadline;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'refundable': refundable,
        'processing_time': processingTime,
        'refund_deadline': refundDeadline?.toIso8601String(),
      };
}
