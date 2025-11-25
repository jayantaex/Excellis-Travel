// Helper extension to convert enums to their short string representation (e.g., Cabin.ECONOMY -> 'ECONOMY')
extension EnumExtension on Object {
  String toShortString() => toString().split('.').last;
}

class SeatMapDataModel {

  factory SeatMapDataModel.fromJson(Map<String, dynamic> json) => SeatMapDataModel(
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
        dictionaries: Dictionaries.fromJson(json['dictionaries']),
      );

  SeatMapDataModel({
    required this.data,
    required this.dictionaries,
  });
  final List<Datum> data;
  final Dictionaries dictionaries;

  Map<String, dynamic> toJson() => <String, dynamic >{
        'data': List<dynamic>.from(data.map((Datum x) => x.toJson())),
        'dictionaries': dictionaries.toJson(),
      };
}

class Datum {

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
        id: json['id'],
        type: json['type'],
        departure: Arrival.fromJson(json['departure']),
        arrival: Arrival.fromJson(json['arrival']),
        carrierCode: json['carrierCode'],
        number: json['number'],
        operating: Operating.fromJson(json['operating']),
        aircraft: Aircraft.fromJson(json['aircraft']),
        datumClass: json['class'],
        flightOfferId: json['flightOfferId'],
        segmentId: json['segmentId'],
        decks: List<Deck>.from(json['decks'].map((x) => Deck.fromJson(x))),
        aircraftCabinAmenities: AircraftCabinAmenities.fromJson(json['aircraftCabinAmenities']),
        availableSeatsCounters: List<AvailableSeatsCounter>.from(json['availableSeatsCounters'].map((x) => AvailableSeatsCounter.fromJson(x))),
      );
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'departure': departure.toJson(),
        'arrival': arrival.toJson(),
        'carrierCode': carrierCode,
        'number': number,
        'operating': operating.toJson(),
        'aircraft': aircraft.toJson(),
        'class': datumClass,
        'flightOfferId': flightOfferId,
        'segmentId': segmentId,
        'decks': List<dynamic>.from(decks.map((Deck x) => x.toJson())),
        'aircraftCabinAmenities': aircraftCabinAmenities.toJson(),
        'availableSeatsCounters': List<dynamic>.from(availableSeatsCounters.map((AvailableSeatsCounter x) => x.toJson())),
      };
}

class Aircraft {

  Aircraft({
    required this.code,
  });

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        code: json['code'],
      );
  final String code;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
      };
}

class AircraftCabinAmenities {

  AircraftCabinAmenities({
    required this.power,
    required this.seat,
    required this.wifi,
    required this.entertainment,
    required this.food,
    required this.beverage,
  });

  factory AircraftCabinAmenities.fromJson(Map<String, dynamic> json) => AircraftCabinAmenities(
        power: Power.fromJson(json['power']),
        seat: AircraftCabinAmenitiesSeat.fromJson(json['seat']),
        wifi: Wifi.fromJson(json['wifi']),
        entertainment: List<Entertainment>.from(json['entertainment'].map((x) => Entertainment.fromJson(x))),
        food: Food.fromJson(json['food']),
        beverage: Beverage.fromJson(json['beverage']),
      );
  final Power power;
  final AircraftCabinAmenitiesSeat seat;
  final Wifi wifi;
  final List<Entertainment> entertainment;
  final Food food;
  final Beverage beverage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'power': power.toJson(),
        'seat': seat.toJson(),
        'wifi': wifi.toJson(),
        'entertainment': List<dynamic>.from(entertainment.map((Entertainment x) => x.toJson())),
        'food': food.toJson(),
        'beverage': beverage.toJson(),
      };
}

class Beverage {

  Beverage({
    required this.isChargeable,
    required this.beverageType,
  });

  factory Beverage.fromJson(Map<String, dynamic> json) => Beverage(
        isChargeable: json['isChargeable'],
        beverageType: json['beverageType'],
      );
  final bool isChargeable;
  final String beverageType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isChargeable': isChargeable,
        'beverageType': beverageType,
      };
}

class Entertainment {

  Entertainment({
    required this.isChargeable,
    required this.entertainmentType,
  });

  factory Entertainment.fromJson(Map<String, dynamic> json) => Entertainment(
        isChargeable: json['isChargeable'],
        entertainmentType: json['entertainmentType'],
      );
  final bool isChargeable;
  final String entertainmentType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isChargeable': isChargeable,
        'entertainmentType': entertainmentType,
      };
}

class Food {

  Food({
    required this.isChargeable,
    required this.foodType,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        isChargeable: json['isChargeable'],
        foodType: json['foodType'],
      );
  final bool isChargeable;
  final String foodType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isChargeable': isChargeable,
        'foodType': foodType,
      };
}

class Power {

  Power({
    required this.isChargeable,
    required this.powerType,
    required this.usbType,
  });

  factory Power.fromJson(Map<String, dynamic> json) => Power(
        isChargeable: json['isChargeable'],
        powerType: json['powerType'],
        usbType: json['usbType'],
      );
  final bool isChargeable;
  final String powerType;
  final String usbType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isChargeable': isChargeable,
        'powerType': powerType,
        'usbType': usbType,
      };
}

class AircraftCabinAmenitiesSeat {

  AircraftCabinAmenitiesSeat({
    required this.legSpace,
    required this.spaceUnit,
    required this.tilt,
    required this.medias,
  });

  factory AircraftCabinAmenitiesSeat.fromJson(Map<String, dynamic> json) => AircraftCabinAmenitiesSeat(
        legSpace: json['legSpace'],
        spaceUnit: json['spaceUnit'],
        tilt: json['tilt'],
        medias: List<Media>.from(json['medias'].map((x) => Media.fromJson(x))),
      );
  final int legSpace;
  final String spaceUnit;
  final String tilt;
  final List<Media> medias;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'legSpace': legSpace,
        'spaceUnit': spaceUnit,
        'tilt': tilt,
        'medias': List<dynamic>.from(medias.map((Media x) => x.toJson())),
      };
}

class Media {

  Media({
    required this.title,
    required this.href,
    required this.description,
    required this.mediaType,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        title: json['title'],
        href: json['href'],
        description: Description.fromJson(json['description']),
        mediaType: json['mediaType'],
      );
  final String title;
  final String href;
  final Description description;
  final String mediaType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'href': href,
        'description': description.toJson(),
        'mediaType': mediaType,
      };
}

class Description {

  Description({
    required this.text,
    required this.lang,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        text: json['text'],
        lang: json['lang'],
      );
  final String text;
  final String lang;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'lang': lang,
      };
}

class Wifi {

  Wifi({
    required this.isChargeable,
    required this.wifiCoverage,
  });

  factory Wifi.fromJson(Map<String, dynamic> json) => Wifi(
        isChargeable: json['isChargeable'],
        wifiCoverage: json['wifiCoverage'],
      );
  final bool isChargeable;
  final String wifiCoverage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isChargeable': isChargeable,
        'wifiCoverage': wifiCoverage,
      };
}

class Arrival {

  Arrival({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        iataCode: json['iataCode'],
        terminal: json['terminal'],
        at: DateTime.parse(json['at']),
      );
  final String iataCode;
  final String terminal;
  final DateTime at;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'iataCode': iataCode,
        'terminal': terminal,
        'at': at.toIso8601String(),
      };
}

class AvailableSeatsCounter {

  AvailableSeatsCounter({
    required this.travelerId,
    required this.value,
  });

  factory AvailableSeatsCounter.fromJson(Map<String, dynamic> json) => AvailableSeatsCounter(
        travelerId: json['travelerId'],
        value: json['value'],
      );
  final String travelerId;
  final int value;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'travelerId': travelerId,
        'value': value,
      };
}

class Deck {

  Deck({
    required this.deckType,
    required this.deckConfiguration,
    required this.facilities,
    required this.seats,
  });

  factory Deck.fromJson(Map<String, dynamic> json) => Deck(
        deckType: json['deckType'],
        deckConfiguration: DeckConfiguration.fromJson(json['deckConfiguration']),
        facilities: List<Facility>.from(json['facilities'].map((x) => Facility.fromJson(x))),
        seats: List<SeatElement>.from(json['seats'].map((x) => SeatElement.fromJson(x))),
      );
  final String deckType;
  final DeckConfiguration deckConfiguration;
  final List<Facility> facilities;
  final List<SeatElement> seats;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deckType': deckType,
        'deckConfiguration': deckConfiguration.toJson(),
        'facilities': List<dynamic>.from(facilities.map((Facility x) => x.toJson())),
        'seats': List<dynamic>.from(seats.map((SeatElement x) => x.toJson())),
      };
}

class DeckConfiguration {

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
        width: json['width'],
        length: json['length'],
        startSeatRow: json['startSeatRow'],
        endSeatRow: json['endSeatRow'],
        startWingsRow: json['startWingsRow'],
        endWingsRow: json['endWingsRow'],
        exitRowsX: List<int>.from(json['exitRowsX'].map((x) => x)),
      );
  final int width;
  final int length;
  final int startSeatRow;
  final int endSeatRow;
  final int startWingsRow;
  final int endWingsRow;
  final List<int> exitRowsX;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'width': width,
        'length': length,
        'startSeatRow': startSeatRow,
        'endSeatRow': endSeatRow,
        'startWingsRow': startWingsRow,
        'endWingsRow': endWingsRow,
        'exitRowsX': List<dynamic>.from(exitRowsX.map((int x) => x)),
      };
}

class Facility { // Nullable

  Facility({
    required this.code,
    required this.column,
    required this.position,
    required this.coordinates,
    this.row,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        code: FacilityCode.values.firstWhere((FacilityCode e) => e.toShortString() == json['code']),
        column: json['column'],
        position: Position.values.firstWhere((Position e) => e.toShortString() == json['position']),
        coordinates: Coordinates.fromJson(json['coordinates']),
        row: json['row'],
      );
  final FacilityCode code;
  final String column;
  final Position position;
  final Coordinates coordinates;
  final String? row;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code.toShortString(),
        'column': column,
        'position': position.toShortString(),
        'coordinates': coordinates.toJson(),
        'row': row,
      };
}

enum FacilityCode {
  CL,
  G,
  LA,
  SO
}

class Coordinates {

  Coordinates({
    required this.x,
    required this.y,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        x: json['x'],
        y: json['y'],
      );
  final int x;
  final int y;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'x': x,
        'y': y,
      };
}

enum Position {
  FRONT,
  REAR,
  SEAT
}

class SeatElement {

  SeatElement({
    required this.cabin,
    required this.number,
    required this.characteristicsCodes,
    required this.travelerPricing,
    required this.coordinates,
  });

  factory SeatElement.fromJson(Map<String, dynamic> json) => SeatElement(
        cabin: Cabin.values.firstWhere((Cabin e) => e.toShortString() == json['cabin']),
        number: json['number'],
        characteristicsCodes: List<String>.from(json['characteristicsCodes'].map((x) => x)),
        travelerPricing: List<TravelerPricing>.from(json['travelerPricing'].map((x) => TravelerPricing.fromJson(x))),
        coordinates: Coordinates.fromJson(json['coordinates']),
      );
  final Cabin cabin;
  final String number;
  final List<String> characteristicsCodes;
  final List<TravelerPricing> travelerPricing;
  final Coordinates coordinates;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cabin': cabin.toShortString(),
        'number': number,
        'characteristicsCodes': List<dynamic>.from(characteristicsCodes.map((String x) => x)),
        'travelerPricing': List<dynamic>.from(travelerPricing.map((TravelerPricing x) => x.toJson())),
        'coordinates': coordinates.toJson(),
      };
}

enum Cabin {
  ECONOMY
}

class TravelerPricing { // Nullable

  TravelerPricing({
    required this.travelerId,
    required this.seatAvailabilityStatus,
    this.price,
  });

  factory TravelerPricing.fromJson(Map<String, dynamic> json) => TravelerPricing(
        travelerId: json['travelerId'],
        seatAvailabilityStatus: SeatAvailabilityStatus.values.firstWhere((SeatAvailabilityStatus e) => e.toShortString() == json['seatAvailabilityStatus']),
        price: json['price'] == null ? null : Price.fromJson(json['price']),
      );
  final String travelerId;
  final SeatAvailabilityStatus seatAvailabilityStatus;
  final Price? price;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'travelerId': travelerId,
        'seatAvailabilityStatus': seatAvailabilityStatus.toShortString(),
        'price': price?.toJson(),
      };
}

class Price {

  Price({
    required this.currency,
    required this.total,
    required this.base,
    required this.taxes,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: Currency.values.firstWhere((Currency e) => e.toShortString() == json['currency']),
        total: json['total'],
        base: json['base'],
        taxes: List<Tax>.from(json['taxes'].map((x) => Tax.fromJson(x))),
      );
  final Currency currency;
  final String total;
  final String base;
  final List<Tax> taxes;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'currency': currency.toShortString(),
        'total': total,
        'base': base,
        'taxes': List<dynamic>.from(taxes.map((Tax x) => x.toJson())),
      };
}

enum Currency {
  EUR
}

class Tax {

  Tax({
    required this.amount,
    required this.code,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        amount: json['amount'],
        code: TaxCode.values.firstWhere((TaxCode e) => e.toShortString() == json['code']),
      );
  final String amount;
  final TaxCode code;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'code': code.toShortString(),
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

  Operating({
    required this.carrierCode,
  });

  factory Operating.fromJson(Map<String, dynamic> json) => Operating(
        carrierCode: json['carrierCode'],
      );
  final String carrierCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'carrierCode': carrierCode,
      };
}

class Dictionaries {

  Dictionaries({
    required this.locations,
    required this.facilities,
    required this.seatCharacteristics,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
        locations: Locations.fromJson(json['locations']),
        facilities: Facilities.fromJson(json['facilities']),
        seatCharacteristics: SeatCharacteristics.fromJson(json['seatCharacteristics']),
      );
  final Locations locations;
  final Facilities facilities;
  final SeatCharacteristics seatCharacteristics;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'locations': locations.toJson(),
        'facilities': facilities.toJson(),
        'seatCharacteristics': seatCharacteristics.toJson(),
      };
}

class Facilities {

  Facilities({
    required this.la,
    required this.g,
    required this.cl,
    required this.so,
  });

  factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        la: json['LA'],
        g: json['G'],
        cl: json['CL'],
        so: json['SO'],
      );
  final String la;
  final String g;
  final String cl;
  final String so;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'LA': la,
        'G': g,
        'CL': cl,
        'SO': so,
      };
}

class Locations {

  Locations({
    required this.nce,
    required this.ory,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        // Assuming keys are lowercase airport codes in the JSON
        nce: Nce.fromJson(json['NCE']),
        ory: Nce.fromJson(json['ORY']),
      );
  final Nce nce;
  final Nce ory;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'NCE': nce.toJson(),
        'ORY': ory.toJson(),
      };
}

class Nce {

  Nce({
    required this.cityCode,
    required this.countryCode,
  });

  factory Nce.fromJson(Map<String, dynamic> json) => Nce(
        cityCode: json['cityCode'],
        countryCode: json['countryCode'],
      );
  final String cityCode;
  final String countryCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cityCode': cityCode,
        'countryCode': countryCode,
      };
}

class SeatCharacteristics {

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
        the1: json['1'],
        the9: json['9'],
        a: json['A'],
        rs: json['RS'],
        de: json['DE'],
        c: json['C'],
        ch: json['CH'],
        e: json['E'],
        ls: json['LS'],
        k: json['K'],
        l: json['L'],
        the1AAqcPremiumSeat: json['1A_AQC_PREMIUM_SEAT'],
        o: json['O'],
        the1A: json['1A'],
        the1B: json['1B'],
        the1D: json['1D'],
        u: json['U'],
        v: json['V'],
        w: json['W'],
        ie: json['IE'],
        fc: json['FC'],
      );
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        // Mapping Dart property names back to inferred JSON keys
        '1': the1,
        '9': the9,
        'A': a,
        'RS': rs,
        'DE': de,
        'C': c,
        'CH': ch,
        'E': e,
        'LS': ls,
        'K': k,
        'L': l,
        '1A_AQC_PREMIUM_SEAT': the1AAqcPremiumSeat,
        'O': o,
        '1A': the1A,
        '1B': the1B,
        '1D': the1D,
        'U': u,
        'V': v,
        'W': w,
        'IE': ie,
        'FC': fc,
      };
}