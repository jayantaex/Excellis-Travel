// Helper extension to convert enums to their short string representation (e.g., Cabin.ECONOMY -> 'ECONOMY')
extension EnumExtension on Object {
  String toShortString() {
    return toString().split('.').last;
  }
}

class SeatMapDataModel {
  final List<Datum> data;
  final Dictionaries dictionaries;

  SeatMapDataModel({
    required this.data,
    required this.dictionaries,
  });

  factory SeatMapDataModel.fromJson(Map<String, dynamic> json) => SeatMapDataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dictionaries: Dictionaries.fromJson(json["dictionaries"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "dictionaries": dictionaries.toJson(),
      };
}

class Datum {
  final String id;
  final String type;
  final Arrival departure;
  final Arrival arrival;
  final String carrierCode;
  final String number;
  final Operating operating;
  final Aircraft aircraft;
  final String datumClass;
  final String flightOfferId;
  final String segmentId;
  final List<Deck> decks;
  final AircraftCabinAmenities aircraftCabinAmenities;
  final List<AvailableSeatsCounter> availableSeatsCounters;

  Datum({
    required this.id,
    required this.type,
    required this.departure,
    required this.arrival,
    required this.carrierCode,
    required this.number,
    required this.operating,
    required this.aircraft,
    required this.datumClass,
    required this.flightOfferId,
    required this.segmentId,
    required this.decks,
    required this.aircraftCabinAmenities,
    required this.availableSeatsCounters,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        carrierCode: json["carrierCode"],
        number: json["number"],
        operating: Operating.fromJson(json["operating"]),
        aircraft: Aircraft.fromJson(json["aircraft"]),
        datumClass: json["class"],
        flightOfferId: json["flightOfferId"],
        segmentId: json["segmentId"],
        decks: List<Deck>.from(json["decks"].map((x) => Deck.fromJson(x))),
        aircraftCabinAmenities: AircraftCabinAmenities.fromJson(json["aircraftCabinAmenities"]),
        availableSeatsCounters: List<AvailableSeatsCounter>.from(json["availableSeatsCounters"].map((x) => AvailableSeatsCounter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "carrierCode": carrierCode,
        "number": number,
        "operating": operating.toJson(),
        "aircraft": aircraft.toJson(),
        "class": datumClass,
        "flightOfferId": flightOfferId,
        "segmentId": segmentId,
        "decks": List<dynamic>.from(decks.map((x) => x.toJson())),
        "aircraftCabinAmenities": aircraftCabinAmenities.toJson(),
        "availableSeatsCounters": List<dynamic>.from(availableSeatsCounters.map((x) => x.toJson())),
      };
}

class Aircraft {
  final String code;

  Aircraft({
    required this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class AircraftCabinAmenities {
  final Power power;
  final AircraftCabinAmenitiesSeat seat;
  final Wifi wifi;
  final List<Entertainment> entertainment;
  final Food food;
  final Beverage beverage;

  AircraftCabinAmenities({
    required this.power,
    required this.seat,
    required this.wifi,
    required this.entertainment,
    required this.food,
    required this.beverage,
  });

  factory AircraftCabinAmenities.fromJson(Map<String, dynamic> json) => AircraftCabinAmenities(
        power: Power.fromJson(json["power"]),
        seat: AircraftCabinAmenitiesSeat.fromJson(json["seat"]),
        wifi: Wifi.fromJson(json["wifi"]),
        entertainment: List<Entertainment>.from(json["entertainment"].map((x) => Entertainment.fromJson(x))),
        food: Food.fromJson(json["food"]),
        beverage: Beverage.fromJson(json["beverage"]),
      );

  Map<String, dynamic> toJson() => {
        "power": power.toJson(),
        "seat": seat.toJson(),
        "wifi": wifi.toJson(),
        "entertainment": List<dynamic>.from(entertainment.map((x) => x.toJson())),
        "food": food.toJson(),
        "beverage": beverage.toJson(),
      };
}

class Beverage {
  final bool isChargeable;
  final String beverageType;

  Beverage({
    required this.isChargeable,
    required this.beverageType,
  });

  factory Beverage.fromJson(Map<String, dynamic> json) => Beverage(
        isChargeable: json["isChargeable"],
        beverageType: json["beverageType"],
      );

  Map<String, dynamic> toJson() => {
        "isChargeable": isChargeable,
        "beverageType": beverageType,
      };
}

class Entertainment {
  final bool isChargeable;
  final String entertainmentType;

  Entertainment({
    required this.isChargeable,
    required this.entertainmentType,
  });

  factory Entertainment.fromJson(Map<String, dynamic> json) => Entertainment(
        isChargeable: json["isChargeable"],
        entertainmentType: json["entertainmentType"],
      );

  Map<String, dynamic> toJson() => {
        "isChargeable": isChargeable,
        "entertainmentType": entertainmentType,
      };
}

class Food {
  final bool isChargeable;
  final String foodType;

  Food({
    required this.isChargeable,
    required this.foodType,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        isChargeable: json["isChargeable"],
        foodType: json["foodType"],
      );

  Map<String, dynamic> toJson() => {
        "isChargeable": isChargeable,
        "foodType": foodType,
      };
}

class Power {
  final bool isChargeable;
  final String powerType;
  final String usbType;

  Power({
    required this.isChargeable,
    required this.powerType,
    required this.usbType,
  });

  factory Power.fromJson(Map<String, dynamic> json) => Power(
        isChargeable: json["isChargeable"],
        powerType: json["powerType"],
        usbType: json["usbType"],
      );

  Map<String, dynamic> toJson() => {
        "isChargeable": isChargeable,
        "powerType": powerType,
        "usbType": usbType,
      };
}

class AircraftCabinAmenitiesSeat {
  final int legSpace;
  final String spaceUnit;
  final String tilt;
  final List<Media> medias;

  AircraftCabinAmenitiesSeat({
    required this.legSpace,
    required this.spaceUnit,
    required this.tilt,
    required this.medias,
  });

  factory AircraftCabinAmenitiesSeat.fromJson(Map<String, dynamic> json) => AircraftCabinAmenitiesSeat(
        legSpace: json["legSpace"],
        spaceUnit: json["spaceUnit"],
        tilt: json["tilt"],
        medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "legSpace": legSpace,
        "spaceUnit": spaceUnit,
        "tilt": tilt,
        "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
      };
}

class Media {
  final String title;
  final String href;
  final Description description;
  final String mediaType;

  Media({
    required this.title,
    required this.href,
    required this.description,
    required this.mediaType,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        title: json["title"],
        href: json["href"],
        description: Description.fromJson(json["description"]),
        mediaType: json["mediaType"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "href": href,
        "description": description.toJson(),
        "mediaType": mediaType,
      };
}

class Description {
  final String text;
  final String lang;

  Description({
    required this.text,
    required this.lang,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        text: json["text"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "lang": lang,
      };
}

class Wifi {
  final bool isChargeable;
  final String wifiCoverage;

  Wifi({
    required this.isChargeable,
    required this.wifiCoverage,
  });

  factory Wifi.fromJson(Map<String, dynamic> json) => Wifi(
        isChargeable: json["isChargeable"],
        wifiCoverage: json["wifiCoverage"],
      );

  Map<String, dynamic> toJson() => {
        "isChargeable": isChargeable,
        "wifiCoverage": wifiCoverage,
      };
}

class Arrival {
  final String iataCode;
  final String terminal;
  final DateTime at;

  Arrival({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        iataCode: json["iataCode"],
        terminal: json["terminal"],
        at: DateTime.parse(json["at"]),
      );

  Map<String, dynamic> toJson() => {
        "iataCode": iataCode,
        "terminal": terminal,
        "at": at.toIso8601String(),
      };
}

class AvailableSeatsCounter {
  final String travelerId;
  final int value;

  AvailableSeatsCounter({
    required this.travelerId,
    required this.value,
  });

  factory AvailableSeatsCounter.fromJson(Map<String, dynamic> json) => AvailableSeatsCounter(
        travelerId: json["travelerId"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "travelerId": travelerId,
        "value": value,
      };
}

class Deck {
  final String deckType;
  final DeckConfiguration deckConfiguration;
  final List<Facility> facilities;
  final List<SeatElement> seats;

  Deck({
    required this.deckType,
    required this.deckConfiguration,
    required this.facilities,
    required this.seats,
  });

  factory Deck.fromJson(Map<String, dynamic> json) => Deck(
        deckType: json["deckType"],
        deckConfiguration: DeckConfiguration.fromJson(json["deckConfiguration"]),
        facilities: List<Facility>.from(json["facilities"].map((x) => Facility.fromJson(x))),
        seats: List<SeatElement>.from(json["seats"].map((x) => SeatElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deckType": deckType,
        "deckConfiguration": deckConfiguration.toJson(),
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "seats": List<dynamic>.from(seats.map((x) => x.toJson())),
      };
}

class DeckConfiguration {
  final int width;
  final int length;
  final int startSeatRow;
  final int endSeatRow;
  final int startWingsRow;
  final int endWingsRow;
  final List<int> exitRowsX;

  DeckConfiguration({
    required this.width,
    required this.length,
    required this.startSeatRow,
    required this.endSeatRow,
    required this.startWingsRow,
    required this.endWingsRow,
    required this.exitRowsX,
  });

  factory DeckConfiguration.fromJson(Map<String, dynamic> json) => DeckConfiguration(
        width: json["width"],
        length: json["length"],
        startSeatRow: json["startSeatRow"],
        endSeatRow: json["endSeatRow"],
        startWingsRow: json["startWingsRow"],
        endWingsRow: json["endWingsRow"],
        exitRowsX: List<int>.from(json["exitRowsX"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "length": length,
        "startSeatRow": startSeatRow,
        "endSeatRow": endSeatRow,
        "startWingsRow": startWingsRow,
        "endWingsRow": endWingsRow,
        "exitRowsX": List<dynamic>.from(exitRowsX.map((x) => x)),
      };
}

class Facility {
  final FacilityCode code;
  final String column;
  final Position position;
  final Coordinates coordinates;
  final String? row; // Nullable

  Facility({
    required this.code,
    required this.column,
    required this.position,
    required this.coordinates,
    this.row,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        code: FacilityCode.values.firstWhere((e) => e.toShortString() == json["code"]),
        column: json["column"],
        position: Position.values.firstWhere((e) => e.toShortString() == json["position"]),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        row: json["row"],
      );

  Map<String, dynamic> toJson() => {
        "code": code.toShortString(),
        "column": column,
        "position": position.toShortString(),
        "coordinates": coordinates.toJson(),
        "row": row,
      };
}

enum FacilityCode {
  CL,
  G,
  LA,
  SO
}

class Coordinates {
  final int x;
  final int y;

  Coordinates({
    required this.x,
    required this.y,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

enum Position {
  FRONT,
  REAR,
  SEAT
}

class SeatElement {
  final Cabin cabin;
  final String number;
  final List<String> characteristicsCodes;
  final List<TravelerPricing> travelerPricing;
  final Coordinates coordinates;

  SeatElement({
    required this.cabin,
    required this.number,
    required this.characteristicsCodes,
    required this.travelerPricing,
    required this.coordinates,
  });

  factory SeatElement.fromJson(Map<String, dynamic> json) => SeatElement(
        cabin: Cabin.values.firstWhere((e) => e.toShortString() == json["cabin"]),
        number: json["number"],
        characteristicsCodes: List<String>.from(json["characteristicsCodes"].map((x) => x)),
        travelerPricing: List<TravelerPricing>.from(json["travelerPricing"].map((x) => TravelerPricing.fromJson(x))),
        coordinates: Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "cabin": cabin.toShortString(),
        "number": number,
        "characteristicsCodes": List<dynamic>.from(characteristicsCodes.map((x) => x)),
        "travelerPricing": List<dynamic>.from(travelerPricing.map((x) => x.toJson())),
        "coordinates": coordinates.toJson(),
      };
}

enum Cabin {
  ECONOMY
}

class TravelerPricing {
  final String travelerId;
  final SeatAvailabilityStatus seatAvailabilityStatus;
  final Price? price; // Nullable

  TravelerPricing({
    required this.travelerId,
    required this.seatAvailabilityStatus,
    this.price,
  });

  factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
        travelerId: json["travelerId"],
        seatAvailabilityStatus: SeatAvailabilityStatus.values.firstWhere((e) => e.toShortString() == json["seatAvailabilityStatus"]),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "travelerId": travelerId,
        "seatAvailabilityStatus": seatAvailabilityStatus.toShortString(),
        "price": price?.toJson(),
      };
}

class Price {
  final Currency currency;
  final String total;
  final String base;
  final List<Tax> taxes;

  Price({
    required this.currency,
    required this.total,
    required this.base,
    required this.taxes,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: Currency.values.firstWhere((e) => e.toShortString() == json["currency"]),
        total: json["total"],
        base: json["base"],
        taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency.toShortString(),
        "total": total,
        "base": base,
        "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
      };
}

enum Currency {
  EUR
}

class Tax {
  final String amount;
  final TaxCode code;

  Tax({
    required this.amount,
    required this.code,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        amount: json["amount"],
        code: TaxCode.values.firstWhere((e) => e.toShortString() == json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "code": code.toShortString(),
      };
}

enum TaxCode {
  SUPPLIER
}

enum SeatAvailabilityStatus {
  AVAILABLE,
  BLOCKED
}

class Operating {
  final String carrierCode;

  Operating({
    required this.carrierCode,
  });

  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
        carrierCode: json["carrierCode"],
      );

  Map<String, dynamic> toJson() => {
        "carrierCode": carrierCode,
      };
}

class Dictionaries {
  final Locations locations;
  final Facilities facilities;
  final SeatCharacteristics seatCharacteristics;

  Dictionaries({
    required this.locations,
    required this.facilities,
    required this.seatCharacteristics,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
        locations: Locations.fromJson(json["locations"]),
        facilities: Facilities.fromJson(json["facilities"]),
        seatCharacteristics: SeatCharacteristics.fromJson(json["seatCharacteristics"]),
      );

  Map<String, dynamic> toJson() => {
        "locations": locations.toJson(),
        "facilities": facilities.toJson(),
        "seatCharacteristics": seatCharacteristics.toJson(),
      };
}

class Facilities {
  final String la;
  final String g;
  final String cl;
  final String so;

  Facilities({
    required this.la,
    required this.g,
    required this.cl,
    required this.so,
  });

  factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        la: json["LA"],
        g: json["G"],
        cl: json["CL"],
        so: json["SO"],
      );

  Map<String, dynamic> toJson() => {
        "LA": la,
        "G": g,
        "CL": cl,
        "SO": so,
      };
}

class Locations {
  final Nce nce;
  final Nce ory;

  Locations({
    required this.nce,
    required this.ory,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        // Assuming keys are lowercase airport codes in the JSON
        nce: Nce.fromJson(json["NCE"]),
        ory: Nce.fromJson(json["ORY"]),
      );

  Map<String, dynamic> toJson() => {
        "NCE": nce.toJson(),
        "ORY": ory.toJson(),
      };
}

class Nce {
  final String cityCode;
  final String countryCode;

  Nce({
    required this.cityCode,
    required this.countryCode,
  });

  factory Nce.fromJson(Map<String, dynamic> json) => Nce(
        cityCode: json["cityCode"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toJson() => {
        "cityCode": cityCode,
        "countryCode": countryCode,
      };
}

class SeatCharacteristics {
  final String the1;
  final String the9;
  final String a;
  final String rs;
  final String de;
  final String c;
  final String ch;
  final String e;
  final String ls;
  final String k;
  final String l;
  final String the1AAqcPremiumSeat;
  final String o;
  final String the1A;
  final String the1B;
  final String the1D;
  final String u;
  final String v;
  final String w;
  final String ie;
  final String fc;

  SeatCharacteristics({
    required this.the1,
    required this.the9,
    required this.a,
    required this.rs,
    required this.de,
    required this.c,
    required this.ch,
    required this.e,
    required this.ls,
    required this.k,
    required this.l,
    required this.the1AAqcPremiumSeat,
    required this.o,
    required this.the1A,
    required this.the1B,
    required this.the1D,
    required this.u,
    required this.v,
    required this.w,
    required this.ie,
    required this.fc,
  });

  factory SeatCharacteristics.fromJson(Map<String, dynamic> json) => SeatCharacteristics(
        // Inferred JSON keys based on Dart property names
        the1: json["1"],
        the9: json["9"],
        a: json["A"],
        rs: json["RS"],
        de: json["DE"],
        c: json["C"],
        ch: json["CH"],
        e: json["E"],
        ls: json["LS"],
        k: json["K"],
        l: json["L"],
        the1AAqcPremiumSeat: json["1A_AQC_PREMIUM_SEAT"],
        o: json["O"],
        the1A: json["1A"],
        the1B: json["1B"],
        the1D: json["1D"],
        u: json["U"],
        v: json["V"],
        w: json["W"],
        ie: json["IE"],
        fc: json["FC"],
      );

  Map<String, dynamic> toJson() => {
        // Mapping Dart property names back to inferred JSON keys
        "1": the1,
        "9": the9,
        "A": a,
        "RS": rs,
        "DE": de,
        "C": c,
        "CH": ch,
        "E": e,
        "LS": ls,
        "K": k,
        "L": l,
        "1A_AQC_PREMIUM_SEAT": the1AAqcPremiumSeat,
        "O": o,
        "1A": the1A,
        "1B": the1B,
        "1D": the1D,
        "U": u,
        "V": v,
        "W": w,
        "IE": ie,
        "FC": fc,
      };
}