// -------------------------------------------------------------
// MAIN MODEL
// -------------------------------------------------------------

class FlightOrderModel {
  final String? type;
  final String? id;
  final String? queuingOfficeId;
  final List<AssociatedRecord>? associatedRecords;
  final List<FlightOffer>? flightOffers;
  final List<Traveler>? travelers;
  final Remarks? remarks;
  final TicketingAgreement? ticketingAgreement;
  final List<AutomatedProcess>? automatedProcess;
  final List<ContactElement>? contacts;

  FlightOrderModel({
    this.type,
    this.id,
    this.queuingOfficeId,
    this.associatedRecords,
    this.flightOffers,
    this.travelers,
    this.remarks,
    this.ticketingAgreement,
    this.automatedProcess,
    this.contacts,
  });

  factory FlightOrderModel.fromJson(Map<String, dynamic> json) => FlightOrderModel(
        type: json["type"],
        id: json["id"],
        queuingOfficeId: json["queuingOfficeId"],
        associatedRecords: json["associatedRecords"] == null
            ? null
            : List<AssociatedRecord>.from(json["associatedRecords"].map((x) => AssociatedRecord.fromJson(x))),
        flightOffers: json["flightOffers"] == null
            ? null
            : List<FlightOffer>.from(json["flightOffers"].map((x) => FlightOffer.fromJson(x))),
        travelers: json["travelers"] == null
            ? null
            : List<Traveler>.from(json["travelers"].map((x) => Traveler.fromJson(x))),
        remarks: json["remarks"] == null ? null : Remarks.fromJson(json["remarks"]),
        ticketingAgreement: json["ticketingAgreement"] == null
            ? null
            : TicketingAgreement.fromJson(json["ticketingAgreement"]),
        automatedProcess: json["automatedProcess"] == null
            ? null
            : List<AutomatedProcess>.from(json["automatedProcess"].map((x) => AutomatedProcess.fromJson(x))),
        contacts: json["contacts"] == null
            ? null
            : List<ContactElement>.from(json["contacts"].map((x) => ContactElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "queuingOfficeId": queuingOfficeId,
        "associatedRecords": associatedRecords == null
            ? null
            : List<dynamic>.from(associatedRecords!.map((x) => x.toJson())),
        "flightOffers": flightOffers == null
            ? null
            : List<dynamic>.from(flightOffers!.map((x) => x.toJson())),
        "travelers": travelers == null
            ? null
            : List<dynamic>.from(travelers!.map((x) => x.toJson())),
        "remarks": remarks?.toJson(),
        "ticketingAgreement": ticketingAgreement?.toJson(),
        "automatedProcess": automatedProcess == null
            ? null
            : List<dynamic>.from(automatedProcess!.map((x) => x.toJson())),
        "contacts": contacts == null
            ? null
            : List<dynamic>.from(contacts!.map((x) => x.toJson())),
      };
}

// -------------------------------------------------------------
// ASSOCIATED RECORD
// -------------------------------------------------------------

class AssociatedRecord {
  final String? reference;
  final DateTime? creationDate;
  final String? originSystemCode;
  final String? flightOfferId;

  AssociatedRecord({
    this.reference,
    this.creationDate,
    this.originSystemCode,
    this.flightOfferId,
  });

  factory AssociatedRecord.fromJson(Map<String, dynamic> json) => AssociatedRecord(
        reference: json["reference"],
        creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
        originSystemCode: json["originSystemCode"],
        flightOfferId: json["flightOfferId"],
      );

  Map<String, dynamic> toJson() => {
        "reference": reference,
        "creationDate": creationDate?.toIso8601String(),
        "originSystemCode": originSystemCode,
        "flightOfferId": flightOfferId,
      };
}

// -------------------------------------------------------------
// AUTOMATED PROCESS
// -------------------------------------------------------------

class AutomatedProcess {
  final String? code;
  final Queue? queue;
  final String? officeId;

  AutomatedProcess({
    this.code,
    this.queue,
    this.officeId,
  });

  factory AutomatedProcess.fromJson(Map<String, dynamic> json) => AutomatedProcess(
        code: json["code"],
        queue: json["queue"] == null ? null : Queue.fromJson(json["queue"]),
        officeId: json["officeId"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "queue": queue?.toJson(),
        "officeId": officeId,
      };
}

// -------------------------------------------------------------
// QUEUE
// -------------------------------------------------------------

class Queue {
  final String? number;
  final String? category;

  Queue({
    this.number,
    this.category,
  });

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
        number: json["number"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "category": category,
      };
}

// -------------------------------------------------------------
// CONTACT ELEMENT
// -------------------------------------------------------------

class ContactElement {
  final AddresseeName? addresseeName;
  final Address? address;
  final String? purpose;
  final List<Phone>? phones;
  final String? companyName;
  final String? emailAddress;

  ContactElement({
    this.addresseeName,
    this.address,
    this.purpose,
    this.phones,
    this.companyName,
    this.emailAddress,
  });

  factory ContactElement.fromJson(Map<String, dynamic> json) => ContactElement(
        addresseeName:
            json["addresseeName"] == null ? null : AddresseeName.fromJson(json["addresseeName"]),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        purpose: json["purpose"],
        phones: json["phones"] == null
            ? null
            : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
        companyName: json["companyName"],
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "addresseeName": addresseeName?.toJson(),
        "address": address?.toJson(),
        "purpose": purpose,
        "phones": phones == null ? null : List<dynamic>.from(phones!.map((x) => x.toJson())),
        "companyName": companyName,
        "emailAddress": emailAddress,
      };
}

// -------------------------------------------------------------
// ADDRESS
// -------------------------------------------------------------

class Address {
  final List<String>? lines;
  final String? postalCode;
  final String? countryCode;
  final String? cityName;

  Address({
    this.lines,
    this.postalCode,
    this.countryCode,
    this.cityName,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        lines: json["lines"] == null ? null : List<String>.from(json["lines"].map((x) => x)),
        postalCode: json["postalCode"],
        countryCode: json["countryCode"],
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "lines": lines == null ? null : List<dynamic>.from(lines!.map((x) => x)),
        "postalCode": postalCode,
        "countryCode": countryCode,
        "cityName": cityName,
      };
}

// -------------------------------------------------------------
// ADDRESSEE NAME (NOTE: Original class only had firstName, I've added lastName based on common JSON data)
// -------------------------------------------------------------

class AddresseeName {
  final String? firstName;
  final String? lastName; // Added based on common JSON structure

  AddresseeName({
    this.firstName,
    this.lastName,
  });

  factory AddresseeName.fromJson(Map<String, dynamic> json) => AddresseeName(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}

// -------------------------------------------------------------
// PHONE
// -------------------------------------------------------------

class Phone {
  final String? deviceType;
  final String? countryCallingCode;
  final String? number;

  Phone({
    this.deviceType,
    this.countryCallingCode,
    this.number,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        deviceType: json["deviceType"],
        countryCallingCode: json["countryCallingCode"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "deviceType": deviceType,
        "countryCallingCode": countryCallingCode,
        "number": number,
      };
}

// -------------------------------------------------------------
// FLIGHT OFFER
// -------------------------------------------------------------

class FlightOffer {
  final String? type;
  final String? id;
  final String? source;
  final bool? nonHomogeneous;
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
    this.nonHomogeneous,
    this.lastTicketingDate,
    this.itineraries,
    this.price,
    this.pricingOptions,
    this.validatingAirlineCodes,
    this.travelerPricings,
  });

  factory FlightOffer.fromJson(Map<String, dynamic> json) => FlightOffer(
        type: json["type"],
        id: json["id"],
        source: json["source"],
        nonHomogeneous: json["nonHomogeneous"],
        lastTicketingDate:
            json["lastTicketingDate"] == null ? null : DateTime.parse(json["lastTicketingDate"]),
        itineraries: json["itineraries"] == null
            ? null
            : List<Itinerary>.from(json["itineraries"].map((x) => Itinerary.fromJson(x))),
        price: json["price"] == null ? null : FlightOfferPrice.fromJson(json["price"]),
        pricingOptions:
            json["pricingOptions"] == null ? null : PricingOptions.fromJson(json["pricingOptions"]),
        validatingAirlineCodes: json["validatingAirlineCodes"] == null
            ? null
            : List<String>.from(json["validatingAirlineCodes"].map((x) => x)),
        travelerPricings: json["travelerPricings"] == null
            ? null
            : List<TravelerPricing>.from(json["travelerPricings"].map((x) => TravelerPricing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "source": source,
        "nonHomogeneous": nonHomogeneous,
        "lastTicketingDate": lastTicketingDate?.toIso8601String().split('T').first, // Date only
        "itineraries": itineraries == null
            ? null
            : List<dynamic>.from(itineraries!.map((x) => x.toJson())),
        "price": price?.toJson(),
        "pricingOptions": pricingOptions?.toJson(),
        "validatingAirlineCodes": validatingAirlineCodes == null
            ? null
            : List<dynamic>.from(validatingAirlineCodes!.map((x) => x)),
        "travelerPricings": travelerPricings == null
            ? null
            : List<dynamic>.from(travelerPricings!.map((x) => x.toJson())),
      };
}

// -------------------------------------------------------------
// ITINERARY
// -------------------------------------------------------------

class Itinerary {
  final List<Segment>? segments;

  Itinerary({
    this.segments,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        segments: json["segments"] == null
            ? null
            : List<Segment>.from(json["segments"].map((x) => Segment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "segments": segments == null ? null : List<dynamic>.from(segments!.map((x) => x.toJson())),
      };
}

// -------------------------------------------------------------
// SEGMENT
// -------------------------------------------------------------

class Segment {
  final Arrival? departure;
  final Arrival? arrival;
  final String? carrierCode;
  final String? number;
  final Aircraft? aircraft;
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
    this.duration,
    this.id,
    this.numberOfStops,
    this.co2Emissions,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        departure: json["departure"] == null ? null : Arrival.fromJson(json["departure"]),
        arrival: json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
        carrierCode: json["carrierCode"],
        number: json["number"],
        aircraft: json["aircraft"] == null ? null : Aircraft.fromJson(json["aircraft"]),
        duration: json["duration"],
        id: json["id"].toString(), // Ensures ID is a String
        numberOfStops: json["numberOfStops"],
        co2Emissions: json["co2Emissions"] == null
            ? null
            : List<Co2Emission>.from(json["co2Emissions"].map((x) => Co2Emission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "departure": departure?.toJson(),
        "arrival": arrival?.toJson(),
        "carrierCode": carrierCode,
        "number": number,
        "aircraft": aircraft?.toJson(),
        "duration": duration,
        "id": id,
        "numberOfStops": numberOfStops,
        "co2Emissions": co2Emissions == null
            ? null
            : List<dynamic>.from(co2Emissions!.map((x) => x.toJson())),
      };
}

// -------------------------------------------------------------
// AIRCRAFT
// -------------------------------------------------------------

class Aircraft {
  final String? code;

  Aircraft({
    this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

// -------------------------------------------------------------
// ARRIVAL / DEPARTURE (Using Arrival class for both as per your definition)
// -------------------------------------------------------------

class Arrival {
  final String? iataCode;
  final String? terminal;
  final DateTime? at;

  Arrival({
    this.iataCode,
    this.terminal,
    this.at,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        iataCode: json["iataCode"],
        terminal: json["terminal"],
        at: json["at"] == null ? null : DateTime.parse(json["at"]),
      );

  Map<String, dynamic> toJson() => {
        "iataCode": iataCode,
        "terminal": terminal,
        "at": at?.toIso8601String(),
      };
}

// -------------------------------------------------------------
// CO2 EMISSION
// -------------------------------------------------------------

class Co2Emission {
  final int? weight;
  final String? weightUnit;
  final String? cabin;

  Co2Emission({
    this.weight,
    this.weightUnit,
    this.cabin,
  });

  factory Co2Emission.fromJson(Map<String, dynamic> json) => Co2Emission(
        weight: json["weight"],
        weightUnit: json["weightUnit"],
        cabin: json["cabin"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "weightUnit": weightUnit,
        "cabin": cabin,
      };
}

// -------------------------------------------------------------
// FLIGHT OFFER PRICE
// -------------------------------------------------------------

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

  factory FlightOfferPrice.fromJson(Map<String, dynamic> json) => FlightOfferPrice(
        currency: json["currency"],
        total: json["total"].toString(), // Ensures total is a String
        base: json["base"].toString(), // Ensures base is a String
        fees: json["fees"] == null
            ? null
            : List<Fee>.from(json["fees"].map((x) => Fee.fromJson(x))),
        grandTotal: json["grandTotal"].toString(), // Ensures grandTotal is a String
        billingCurrency: json["billingCurrency"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "total": total,
        "base": base,
        "fees": fees == null ? null : List<dynamic>.from(fees!.map((x) => x.toJson())),
        "grandTotal": grandTotal,
        "billingCurrency": billingCurrency,
      };
}

// -------------------------------------------------------------
// FEE
// -------------------------------------------------------------

class Fee {
  final String? amount;
  final String? type;

  Fee({
    this.amount,
    this.type,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        amount: json["amount"].toString(), // Ensures amount is a String
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "type": type,
      };
}

// -------------------------------------------------------------
// PRICING OPTIONS
// -------------------------------------------------------------

class PricingOptions {
  final List<String>? fareType;
  final bool? includedCheckedBagsOnly;

  PricingOptions({
    this.fareType,
    this.includedCheckedBagsOnly,
  });

  factory PricingOptions.fromJson(Map<String, dynamic> json) => PricingOptions(
        fareType:
            json["fareType"] == null ? null : List<String>.from(json["fareType"].map((x) => x)),
        includedCheckedBagsOnly: json["includedCheckedBagsOnly"],
      );

  Map<String, dynamic> toJson() => {
        "fareType": fareType == null ? null : List<dynamic>.from(fareType!.map((x) => x)),
        "includedCheckedBagsOnly": includedCheckedBagsOnly,
      };
}

// -------------------------------------------------------------
// TRAVELER PRICING
// -------------------------------------------------------------

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

  factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
        travelerId: json["travelerId"].toString(), // Ensures ID is a String
        fareOption: json["fareOption"],
        travelerType: json["travelerType"],
        price: json["price"] == null ? null : TravelerPricingPrice.fromJson(json["price"]),
        fareDetailsBySegment: json["fareDetailsBySegment"] == null
            ? null
            : List<FareDetailsBySegment>.from(
                json["fareDetailsBySegment"].map((x) => FareDetailsBySegment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "travelerId": travelerId,
        "fareOption": fareOption,
        "travelerType": travelerType,
        "price": price?.toJson(),
        "fareDetailsBySegment": fareDetailsBySegment == null
            ? null
            : List<dynamic>.from(fareDetailsBySegment!.map((x) => x.toJson())),
      };
}

// -------------------------------------------------------------
// FARE DETAILS BY SEGMENT
// -------------------------------------------------------------

class FareDetailsBySegment {
  final String? segmentId;
  final String? cabin;
  final String? fareBasis;
  final String? brandedFare;
  final String? fareDetailsBySegmentClass;
  final IncludedCheckedBags? includedCheckedBags;

  FareDetailsBySegment({
    this.segmentId,
    this.cabin,
    this.fareBasis,
    this.brandedFare,
    this.fareDetailsBySegmentClass,
    this.includedCheckedBags,
  });

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json) => FareDetailsBySegment(
        segmentId: json["segmentId"].toString(), // Ensures ID is a String
        cabin: json["cabin"],
        fareBasis: json["fareBasis"],
        brandedFare: json["brandedFare"],
        // Renamed 'class' to 'fareDetailsBySegmentClass' to avoid Dart keyword conflict
        fareDetailsBySegmentClass: json["class"],
        includedCheckedBags: json["includedCheckedBags"] == null
            ? null
            : IncludedCheckedBags.fromJson(json["includedCheckedBags"]),
      );

  Map<String, dynamic> toJson() => {
        "segmentId": segmentId,
        "cabin": cabin,
        "fareBasis": fareBasis,
        "brandedFare": brandedFare,
        "class": fareDetailsBySegmentClass, // Use original key name in JSON
        "includedCheckedBags": includedCheckedBags?.toJson(),
      };
}

// -------------------------------------------------------------
// INCLUDED CHECKED BAGS
// -------------------------------------------------------------

class IncludedCheckedBags {
  final int? quantity;
  // NOTE: Your previous JSON also had 'weight' and 'weightUnit'. 
  // If those are needed, they should be added here.
  final int? weight; 
  final String? weightUnit;

  IncludedCheckedBags({
    this.quantity,
    this.weight,
    this.weightUnit,
  });

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json) => IncludedCheckedBags(
        quantity: json["quantity"],
        weight: json["weight"],
        weightUnit: json["weightUnit"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "weight": weight,
        "weightUnit": weightUnit,
      };
}

// -------------------------------------------------------------
// TRAVELER PRICING PRICE
// -------------------------------------------------------------

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

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json) => TravelerPricingPrice(
        currency: json["currency"],
        total: json["total"].toString(), // Ensures total is a String
        base: json["base"].toString(), // Ensures base is a String
        taxes: json["taxes"] == null
            ? null
            : List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
        refundableTaxes: json["refundableTaxes"]?.toString(), // Ensures refundableTaxes is a String
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "total": total,
        "base": base,
        "taxes": taxes == null ? null : List<dynamic>.from(taxes!.map((x) => x.toJson())),
        "refundableTaxes": refundableTaxes,
      };
}

// -------------------------------------------------------------
// TAX
// -------------------------------------------------------------

class Tax {
  final String? amount;
  final String? code;

  Tax({
    this.amount,
    this.code,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        amount: json["amount"].toString(), // Ensures amount is a String
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "code": code,
      };
}

// -------------------------------------------------------------
// REMARKS
// -------------------------------------------------------------

class Remarks {
  final List<General>? general;

  Remarks({
    this.general,
  });

  factory Remarks.fromJson(Map<String, dynamic> json) => Remarks(
        general: json["general"] == null
            ? null
            : List<General>.from(json["general"].map((x) => General.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "general": general == null ? null : List<dynamic>.from(general!.map((x) => x.toJson())),
      };
}

// -------------------------------------------------------------
// GENERAL (INSIDE REMARKS)
// -------------------------------------------------------------

class General {
  final String? subType;
  final String? text;

  General({
    this.subType,
    this.text,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        subType: json["subType"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "subType": subType,
        "text": text,
      };
}

// -------------------------------------------------------------
// TICKETING AGREEMENT
// -------------------------------------------------------------

class TicketingAgreement {
  final String? option;
  final String? delay;

  TicketingAgreement({
    this.option,
    this.delay,
  });

  factory TicketingAgreement.fromJson(Map<String, dynamic> json) => TicketingAgreement(
        option: json["option"],
        delay: json["delay"],
      );

  Map<String, dynamic> toJson() => {
        "option": option,
        "delay": delay,
      };
}

// -------------------------------------------------------------
// TRAVELER
// -------------------------------------------------------------

class Traveler {
  final String? id;
  final DateTime? dateOfBirth;
  final String? gender;
  final Name? name;
  final List<Document>? documents;
  final TravelerContact? contact;

  Traveler({
    this.id,
    this.dateOfBirth,
    this.gender,
    this.name,
    this.documents,
    this.contact,
  });

  factory Traveler.fromJson(Map<String, dynamic> json) => Traveler(
        id: json["id"].toString(), // Ensures ID is a String
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        documents: json["documents"] == null
            ? null
            : List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
        contact: json["contact"] == null ? null : TravelerContact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateOfBirth": dateOfBirth?.toIso8601String().split('T').first, // Date only
        "gender": gender,
        "name": name?.toJson(),
        "documents": documents == null ? null : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "contact": contact?.toJson(),
      };
}

// -------------------------------------------------------------
// TRAVELER CONTACT
// -------------------------------------------------------------

class TravelerContact {
  final String? purpose;
  final List<Phone>? phones;
  final String? emailAddress;

  TravelerContact({
    this.purpose,
    this.phones,
    this.emailAddress,
  });

  factory TravelerContact.fromJson(Map<String, dynamic> json) => TravelerContact(
        purpose: json["purpose"],
        phones: json["phones"] == null
            ? null
            : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "purpose": purpose,
        "phones": phones == null ? null : List<dynamic>.from(phones!.map((x) => x.toJson())),
        "emailAddress": emailAddress,
      };
}

// -------------------------------------------------------------
// DOCUMENT
// -------------------------------------------------------------

class Document {
  final String? number;
  final DateTime? issuanceDate;
  final DateTime? expiryDate;
  final String? issuanceCountry;
  final String? issuanceLocation;
  final String? nationality;
  final String? birthPlace;
  final String? documentType;
  final bool? holder;

  Document({
    this.number,
    this.issuanceDate,
    this.expiryDate,
    this.issuanceCountry,
    this.issuanceLocation,
    this.nationality,
    this.birthPlace,
    this.documentType,
    this.holder,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        number: json["number"],
        issuanceDate: json["issuanceDate"] == null ? null : DateTime.parse(json["issuanceDate"]),
        expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
        issuanceCountry: json["issuanceCountry"],
        issuanceLocation: json["issuanceLocation"],
        nationality: json["nationality"],
        birthPlace: json["birthPlace"],
        documentType: json["documentType"],
        holder: json["holder"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "issuanceDate": issuanceDate?.toIso8601String().split('T').first, // Date only
        "expiryDate": expiryDate?.toIso8601String().split('T').first, // Date only
        "issuanceCountry": issuanceCountry,
        "issuanceLocation": issuanceLocation,
        "nationality": nationality,
        "birthPlace": birthPlace,
        "documentType": documentType,
        "holder": holder,
      };
}

// -------------------------------------------------------------
// NAME (INSIDE TRAVELER)
// -------------------------------------------------------------

class Name {
  final String? firstName;
  final String? lastName;

  Name({
    this.firstName,
    this.lastName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}