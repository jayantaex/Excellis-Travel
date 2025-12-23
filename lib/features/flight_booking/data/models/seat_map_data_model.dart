import 'dart:convert';

SeatMapDataModel transactionDataModelFromJson(String str) =>
    SeatMapDataModel.fromJson(json.decode(str));

String transactionDataModelToJson(SeatMapDataModel data) =>
    json.encode(data.toJson());

class SeatMapDataModel {
  factory SeatMapDataModel.fromJson(Map<String, dynamic> json) =>
      SeatMapDataModel(
        seatData: json['data'] == null
            ? null
            : List<SeatDatum>.from(
                json['data'].map((x) => SeatDatum.fromJson(x))),
        dictionaries: json['dictionaries'] == null
            ? null
            : Dictionaries.fromJson(json['dictionaries']),
      );
  SeatMapDataModel({
    this.seatData,
    this.dictionaries,
  });

  final List<SeatDatum>? seatData;
  final Dictionaries? dictionaries;

  Map<String, dynamic> toJson() => {
        'data': seatData == null
            ? null
            : List<dynamic>.from(seatData!.map((x) => x.toJson())),
        'dictionaries': dictionaries?.toJson(),
      };
}

class Dictionaries {
  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
        facilities: json['facilities'] == null
            ? null
            : Map<String, String>.from(json['facilities']),
        seatCharacteristics: json['seatCharacteristics'] == null
            ? null
            : Map<String, String>.from(json['seatCharacteristics']),
      );
  Dictionaries({
    this.facilities,
    this.seatCharacteristics,
  });

  final Map<String, String>? facilities;
  final Map<String, String>? seatCharacteristics;

  Map<String, dynamic> toJson() => {
        'facilities': facilities,
        'seatCharacteristics': seatCharacteristics,
      };
}

class SeatDatum {
  factory SeatDatum.fromJson(Map<String, dynamic> json) => SeatDatum(
        id: json['id'],
        type: json['type'],
        seatDatumClass: json['class'],
        flightOfferId: json['flightOfferId'],
        segmentId: json['segmentId'],
        decks: json['decks'] == null
            ? null
            : List<Deck>.from(json['decks'].map((x) => Deck.fromJson(x))),
        aircraftCabinAmenities: json['aircraftCabinAmenities'] == null
            ? null
            : AircraftCabinAmenities.fromJson(json['aircraftCabinAmenities']),
        availableSeatsCounters: json['availableSeatsCounters'] == null
            ? null
            : List<AvailableSeatsCounter>.from(json['availableSeatsCounters']
                .map((x) => AvailableSeatsCounter.fromJson(x))),
      );
  SeatDatum({
    this.id,
    this.type,
    this.seatDatumClass,
    this.flightOfferId,
    this.segmentId,
    this.decks,
    this.aircraftCabinAmenities,
    this.availableSeatsCounters,
  });

  final String? id;
  final String? type;
  final String? seatDatumClass;
  final String? flightOfferId;
  final String? segmentId;
  final List<Deck>? decks;
  final AircraftCabinAmenities? aircraftCabinAmenities;
  final List<AvailableSeatsCounter>? availableSeatsCounters;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'class': seatDatumClass,
        'flightOfferId': flightOfferId,
        'segmentId': segmentId,
        'decks': decks == null
            ? null
            : List<dynamic>.from(decks!.map((x) => x.toJson())),
        'aircraftCabinAmenities': aircraftCabinAmenities?.toJson(),
        'availableSeatsCounters': availableSeatsCounters == null
            ? null
            : List<dynamic>.from(
                availableSeatsCounters!.map((x) => x.toJson())),
      };
}

class AircraftCabinAmenities {
  factory AircraftCabinAmenities.fromJson(Map<String, dynamic> json) =>
      AircraftCabinAmenities(
        power: json['power'] == null ? null : Power.fromJson(json['power']),
        seat: json['seat'] == null
            ? null
            : AircraftCabinAmenitiesSeat.fromJson(json['seat']),
        food: json['food'] == null ? null : Food.fromJson(json['food']),
        beverage: json['beverage'] == null
            ? null
            : Beverage.fromJson(json['beverage']),
      );
  AircraftCabinAmenities({
    this.power,
    this.seat,
    this.food,
    this.beverage,
  });

  final Power? power;
  final AircraftCabinAmenitiesSeat? seat;
  final Food? food;
  final Beverage? beverage;

  Map<String, dynamic> toJson() => {
        'power': power?.toJson(),
        'seat': seat?.toJson(),
        'food': food?.toJson(),
        'beverage': beverage?.toJson(),
      };
}

class Beverage {
  factory Beverage.fromJson(Map<String, dynamic> json) => Beverage(
        isChargeable: json['isChargeable'],
        beverageType: json['beverageType'],
      );
  Beverage({
    this.isChargeable,
    this.beverageType,
  });

  final bool? isChargeable;
  final String? beverageType;

  Map<String, dynamic> toJson() => {
        'isChargeable': isChargeable,
        'beverageType': beverageType,
      };
}

class Food {
  factory Food.fromJson(Map<String, dynamic> json) => Food(
        isChargeable: json['isChargeable'],
        foodType: json['foodType'],
      );
  Food({
    this.isChargeable,
    this.foodType,
  });

  final bool? isChargeable;
  final String? foodType;

  Map<String, dynamic> toJson() => {
        'isChargeable': isChargeable,
        'foodType': foodType,
      };
}

class Power {
  factory Power.fromJson(Map<String, dynamic> json) => Power(
        isChargeable: json['isChargeable'],
        powerType: json['powerType'],
        usbType: json['usbType'],
      );
  Power({
    this.isChargeable,
    this.powerType,
    this.usbType,
  });

  final bool? isChargeable;
  final String? powerType;
  final String? usbType;

  Map<String, dynamic> toJson() => {
        'isChargeable': isChargeable,
        'powerType': powerType,
        'usbType': usbType,
      };
}

class AircraftCabinAmenitiesSeat {
  factory AircraftCabinAmenitiesSeat.fromJson(Map<String, dynamic> json) =>
      AircraftCabinAmenitiesSeat(
        legSpace: json['legSpace'],
        spaceUnit: json['spaceUnit'],
        tilt: json['tilt'],
        medias: json['medias'] == null
            ? null
            : List<Media>.from(json['medias'].map((x) => Media.fromJson(x))),
      );
  AircraftCabinAmenitiesSeat({
    this.legSpace,
    this.spaceUnit,
    this.tilt,
    this.medias,
  });

  final int? legSpace;
  final String? spaceUnit;
  final String? tilt;
  final List<Media>? medias;

  Map<String, dynamic> toJson() => {
        'legSpace': legSpace,
        'spaceUnit': spaceUnit,
        'tilt': tilt,
        'medias': medias == null
            ? null
            : List<dynamic>.from(medias!.map((x) => x.toJson())),
      };
}

class Media {
  factory Media.fromJson(Map<String, dynamic> json) => Media(
        title: json['title'],
        href: json['href'],
        description: json['description'] == null
            ? null
            : Description.fromJson(json['description']),
        mediaType: json['mediaType'],
      );
  Media({
    this.title,
    this.href,
    this.description,
    this.mediaType,
  });

  final String? title;
  final String? href;
  final Description? description;
  final String? mediaType;

  Map<String, dynamic> toJson() => {
        'title': title,
        'href': href,
        'description': description?.toJson(),
        'mediaType': mediaType,
      };
}

class Description {
  factory Description.fromJson(Map<String, dynamic> json) => Description(
        text: json['text'],
        lang: json['lang'],
      );
  Description({
    this.text,
    this.lang,
  });

  final String? text;
  final String? lang;

  Map<String, dynamic> toJson() => {
        'text': text,
        'lang': lang,
      };
}

class AvailableSeatsCounter {
  factory AvailableSeatsCounter.fromJson(Map<String, dynamic> json) =>
      AvailableSeatsCounter(
        travelerId: json['travelerId'],
        value: json['value'],
      );
  AvailableSeatsCounter({
    this.travelerId,
    this.value,
  });

  final String? travelerId;
  final int? value;

  Map<String, dynamic> toJson() => {
        'travelerId': travelerId,
        'value': value,
      };
}

class Deck {
  factory Deck.fromJson(Map<String, dynamic> json) => Deck(
        deckType: json['deckType'],
        deckConfiguration: json['deckConfiguration'] == null
            ? null
            : DeckConfiguration.fromJson(json['deckConfiguration']),
        facilities: json['facilities'] == null
            ? null
            : List<Facility>.from(
                json['facilities'].map((x) => Facility.fromJson(x))),
        seats: json['seats'] == null
            ? null
            : List<SeatElement>.from(
                json['seats'].map((x) => SeatElement.fromJson(x))),
      );
  Deck({
    this.deckType,
    this.deckConfiguration,
    this.facilities,
    this.seats,
  });

  final String? deckType;
  final DeckConfiguration? deckConfiguration;
  final List<Facility>? facilities;
  final List<SeatElement>? seats;

  Map<String, dynamic> toJson() => {
        'deckType': deckType,
        'deckConfiguration': deckConfiguration?.toJson(),
        'facilities': facilities == null
            ? null
            : List<dynamic>.from(facilities!.map((x) => x.toJson())),
        'seats': seats == null
            ? null
            : List<dynamic>.from(seats!.map((x) => x.toJson())),
      };
}

class DeckConfiguration {
  factory DeckConfiguration.fromJson(Map<String, dynamic> json) =>
      DeckConfiguration(
        width: json['width'],
        length: json['length'],
        startSeatRow: json['startSeatRow'],
        endSeatRow: json['endSeatRow'],
        endWingsX: json['endWingsX'],
        startWingsRow: json['startWingsRow'],
        endWingsRow: json['endWingsRow'],
        exitRowsX: json['exitRowsX'] == null
            ? null
            : List<int>.from(json['exitRowsX'].map((x) => x)),
      );
  DeckConfiguration({
    this.width,
    this.length,
    this.startSeatRow,
    this.endSeatRow,
    this.endWingsX,
    this.startWingsRow,
    this.endWingsRow,
    this.exitRowsX,
  });

  final int? width;
  final int? length;
  final int? startSeatRow;
  final int? endSeatRow;
  final int? endWingsX;
  final int? startWingsRow;
  final int? endWingsRow;
  final List<int>? exitRowsX;

  Map<String, dynamic> toJson() => {
        'width': width,
        'length': length,
        'startSeatRow': startSeatRow,
        'endSeatRow': endSeatRow,
        'endWingsX': endWingsX,
        'startWingsRow': startWingsRow,
        'endWingsRow': endWingsRow,
        'exitRowsX': exitRowsX == null
            ? null
            : List<dynamic>.from(exitRowsX!.map((x) => x)),
      };
}

class Facility {
  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        code: json['code'],
        column: json['column'],
        row: json['row'],
        position: json['position'],
        coordinates: json['coordinates'] == null
            ? null
            : Coordinates.fromJson(json['coordinates']),
      );
  Facility({
    this.code,
    this.column,
    this.row,
    this.position,
    this.coordinates,
  });

  final String? code;
  final String? column;
  final String? row;
  final String? position;
  final Coordinates? coordinates;

  Map<String, dynamic> toJson() => {
        'code': code,
        'column': column,
        'row': row,
        'position': position,
        'coordinates': coordinates?.toJson(),
      };
}

class Coordinates {
  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        x: json['x'],
        y: json['y'],
      );
  Coordinates({
    this.x,
    this.y,
  });

  final int? x;
  final int? y;

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}

class SeatElement {
  factory SeatElement.fromJson(Map<String, dynamic> json) => SeatElement(
        cabin: json['cabin'],
        number: json['number'],
        characteristicsCodes: json['characteristicsCodes'] == null
            ? null
            : List<String>.from(json['characteristicsCodes'].map((x) => x)),
        travelerPricing: json['travelerPricing'] == null
            ? null
            : List<TravelerPricing>.from(json['travelerPricing']
                .map((x) => TravelerPricing.fromJson(x))),
        coordinates: json['coordinates'] == null
            ? null
            : Coordinates.fromJson(json['coordinates']),
      );
  SeatElement({
    this.cabin,
    this.number,
    this.characteristicsCodes,
    this.travelerPricing,
    this.coordinates,
  });

  final String? cabin;
  final String? number;
  final List<String>? characteristicsCodes;
  final List<TravelerPricing>? travelerPricing;
  final Coordinates? coordinates;

  Map<String, dynamic> toJson() => {
        'cabin': cabin,
        'number': number,
        'characteristicsCodes': characteristicsCodes == null
            ? null
            : List<dynamic>.from(characteristicsCodes!.map((x) => x)),
        'travelerPricing': travelerPricing == null
            ? null
            : List<dynamic>.from(travelerPricing!.map((x) => x.toJson())),
        'coordinates': coordinates?.toJson(),
      };
}

class TravelerPricing {
  factory TravelerPricing.fromJson(Map<String, dynamic> json) =>
      TravelerPricing(
        travelerId: json['travelerId'],
        seatAvailabilityStatus: json['seatAvailabilityStatus'],
        price: json['price'] == null ? null : Price.fromJson(json['price']),
      );
  TravelerPricing({
    this.travelerId,
    this.seatAvailabilityStatus,
    this.price,
  });

  final String? travelerId;
  final String? seatAvailabilityStatus;
  final Price? price;

  Map<String, dynamic> toJson() => {
        'travelerId': travelerId,
        'seatAvailabilityStatus': seatAvailabilityStatus,
        'price': price?.toJson(),
      };
}

class Price {
  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: json['currency'],
        total: json['total'],
        base: json['base'],
        taxes: json['taxes'] == null
            ? null
            : List<Tax>.from(json['taxes'].map((x) => Tax.fromJson(x))),
      );
  Price({
    this.currency,
    this.total,
    this.base,
    this.taxes,
  });

  final String? currency;
  final String? total;
  final String? base;
  final List<Tax>? taxes;

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'total': total,
        'base': base,
        'taxes': taxes == null
            ? null
            : List<dynamic>.from(taxes!.map((x) => x.toJson())),
      };
}

class Tax {
  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        amount: json['amount'],
        code: json['code'],
      );
  Tax({
    this.amount,
    this.code,
  });

  final String? amount;
  final String? code;

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'code': code,
      };
}
