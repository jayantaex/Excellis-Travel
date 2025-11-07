// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlightHiveDataModelAdapter extends TypeAdapter<FlightHiveDataModel> {
  @override
  final int typeId = 0;

  @override
  FlightHiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlightHiveDataModel(
      datam: fields[0] as Datam?,
    );
  }

  @override
  void write(BinaryWriter writer, FlightHiveDataModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.datam);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightHiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatamAdapter extends TypeAdapter<Datam> {
  @override
  final int typeId = 1;

  @override
  Datam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datam(
      type: fields[0] as String?,
      id: fields[1] as String?,
      source: fields[2] as String?,
      instantTicketingRequired: fields[3] as bool?,
      nonHomogeneous: fields[4] as bool?,
      oneWay: fields[5] as bool?,
      isUpsellOffer: fields[6] as bool?,
      lastTicketingDate: fields[7] as String?,
      lastTicketingDateTime: fields[8] as String?,
      numberOfBookableSeats: fields[9] as int?,
      itineraries: (fields[10] as List?)?.cast<Itinerary>(),
      price: fields[11] as DatamPrice?,
      pricingOptions: fields[12] as PricingOptions?,
      validatingAirlineCodes: (fields[13] as List?)?.cast<String>(),
      travelerPricings: (fields[14] as List?)?.cast<TravelerPricing>(),
    );
  }

  @override
  void write(BinaryWriter writer, Datam obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.instantTicketingRequired)
      ..writeByte(4)
      ..write(obj.nonHomogeneous)
      ..writeByte(5)
      ..write(obj.oneWay)
      ..writeByte(6)
      ..write(obj.isUpsellOffer)
      ..writeByte(7)
      ..write(obj.lastTicketingDate)
      ..writeByte(8)
      ..write(obj.lastTicketingDateTime)
      ..writeByte(9)
      ..write(obj.numberOfBookableSeats)
      ..writeByte(10)
      ..write(obj.itineraries)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(12)
      ..write(obj.pricingOptions)
      ..writeByte(13)
      ..write(obj.validatingAirlineCodes)
      ..writeByte(14)
      ..write(obj.travelerPricings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItineraryAdapter extends TypeAdapter<Itinerary> {
  @override
  final int typeId = 2;

  @override
  Itinerary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Itinerary(
      duration: fields[0] as String?,
      segments: (fields[1] as List?)?.cast<Segment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Itinerary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.duration)
      ..writeByte(1)
      ..write(obj.segments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItineraryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SegmentAdapter extends TypeAdapter<Segment> {
  @override
  final int typeId = 3;

  @override
  Segment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Segment(
      departure: fields[0] as Departure?,
      arrival: fields[1] as Arrival?,
      carrierCode: fields[2] as String?,
      number: fields[3] as String?,
      aircraft: fields[4] as Aircraft?,
      operating: fields[5] as Operating?,
      duration: fields[6] as String?,
      id: fields[7] as String?,
      numberOfStops: fields[8] as int?,
      blacklistedInEu: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Segment obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.departure)
      ..writeByte(1)
      ..write(obj.arrival)
      ..writeByte(2)
      ..write(obj.carrierCode)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.aircraft)
      ..writeByte(5)
      ..write(obj.operating)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.numberOfStops)
      ..writeByte(9)
      ..write(obj.blacklistedInEu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SegmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DepartureAdapter extends TypeAdapter<Departure> {
  @override
  final int typeId = 4;

  @override
  Departure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Departure(
      iataCode: fields[0] as String?,
      terminal: fields[1] as String?,
      at: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Departure obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.iataCode)
      ..writeByte(1)
      ..write(obj.terminal)
      ..writeByte(2)
      ..write(obj.at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ArrivalAdapter extends TypeAdapter<Arrival> {
  @override
  final int typeId = 5;

  @override
  Arrival read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Arrival(
      iataCode: fields[0] as String?,
      at: fields[2] as String?,
      terminal: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Arrival obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.iataCode)
      ..writeByte(1)
      ..write(obj.terminal)
      ..writeByte(2)
      ..write(obj.at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArrivalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AircraftAdapter extends TypeAdapter<Aircraft> {
  @override
  final int typeId = 6;

  @override
  Aircraft read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Aircraft(
      code: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Aircraft obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AircraftAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OperatingAdapter extends TypeAdapter<Operating> {
  @override
  final int typeId = 7;

  @override
  Operating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Operating(
      carrierCode: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Operating obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.carrierCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatamPriceAdapter extends TypeAdapter<DatamPrice> {
  @override
  final int typeId = 8;

  @override
  DatamPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatamPrice(
      currency: fields[0] as String?,
      total: fields[1] as String?,
      base: fields[2] as String?,
      fees: (fields[3] as List?)?.cast<Fee>(),
      grandTotal: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DatamPrice obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.total)
      ..writeByte(2)
      ..write(obj.base)
      ..writeByte(3)
      ..write(obj.fees)
      ..writeByte(4)
      ..write(obj.grandTotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatamPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeeAdapter extends TypeAdapter<Fee> {
  @override
  final int typeId = 9;

  @override
  Fee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fee(
      amount: fields[0] as String?,
      type: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Fee obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PricingOptionsAdapter extends TypeAdapter<PricingOptions> {
  @override
  final int typeId = 10;

  @override
  PricingOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PricingOptions(
      fareType: (fields[0] as List?)?.cast<String>(),
      includedCheckedBagsOnly: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PricingOptions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fareType)
      ..writeByte(1)
      ..write(obj.includedCheckedBagsOnly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricingOptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TravelerPricingAdapter extends TypeAdapter<TravelerPricing> {
  @override
  final int typeId = 11;

  @override
  TravelerPricing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelerPricing(
      travelerId: fields[0] as String?,
      fareOption: fields[1] as String?,
      travelerType: fields[2] as String?,
      price: fields[3] as TravelerPricingPrice?,
      fareDetailsBySegment: (fields[4] as List?)?.cast<FareDetailsBySegment>(),
    );
  }

  @override
  void write(BinaryWriter writer, TravelerPricing obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.travelerId)
      ..writeByte(1)
      ..write(obj.fareOption)
      ..writeByte(2)
      ..write(obj.travelerType)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.fareDetailsBySegment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelerPricingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TravelerPricingPriceAdapter extends TypeAdapter<TravelerPricingPrice> {
  @override
  final int typeId = 12;

  @override
  TravelerPricingPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelerPricingPrice(
      currency: fields[0] as String?,
      total: fields[1] as String?,
      base: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TravelerPricingPrice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.total)
      ..writeByte(2)
      ..write(obj.base);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelerPricingPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FareDetailsBySegmentAdapter extends TypeAdapter<FareDetailsBySegment> {
  @override
  final int typeId = 13;

  @override
  FareDetailsBySegment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FareDetailsBySegment(
      segmentId: fields[0] as String?,
      cabin: fields[1] as String?,
      fareBasis: fields[2] as String?,
      brandedFare: fields[3] as String?,
      brandedFareLabel: fields[4] as String?,
      fareDetailsBySegmentClass: fields[5] as String?,
      includedCheckedBags: fields[6] as IncludedCBags?,
      includedCabinBags: fields[7] as IncludedCBags?,
      amenities: (fields[8] as List?)?.cast<Amenity>(),
    );
  }

  @override
  void write(BinaryWriter writer, FareDetailsBySegment obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.segmentId)
      ..writeByte(1)
      ..write(obj.cabin)
      ..writeByte(2)
      ..write(obj.fareBasis)
      ..writeByte(3)
      ..write(obj.brandedFare)
      ..writeByte(4)
      ..write(obj.brandedFareLabel)
      ..writeByte(5)
      ..write(obj.fareDetailsBySegmentClass)
      ..writeByte(6)
      ..write(obj.includedCheckedBags)
      ..writeByte(7)
      ..write(obj.includedCabinBags)
      ..writeByte(8)
      ..write(obj.amenities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FareDetailsBySegmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IncludedCBagsAdapter extends TypeAdapter<IncludedCBags> {
  @override
  final int typeId = 14;

  @override
  IncludedCBags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncludedCBags(
      weight: fields[0] as int?,
      weightUnit: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IncludedCBags obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.weightUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncludedCBagsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AmenityAdapter extends TypeAdapter<Amenity> {
  @override
  final int typeId = 15;

  @override
  Amenity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Amenity(
      description: fields[0] as String?,
      isChargeable: fields[1] as bool?,
      amenityType: fields[2] as String?,
      amenityProvider: fields[3] as AmenityProvider?,
    );
  }

  @override
  void write(BinaryWriter writer, Amenity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.isChargeable)
      ..writeByte(2)
      ..write(obj.amenityType)
      ..writeByte(3)
      ..write(obj.amenityProvider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmenityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AmenityProviderAdapter extends TypeAdapter<AmenityProvider> {
  @override
  final int typeId = 16;

  @override
  AmenityProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AmenityProvider(
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AmenityProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmenityProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
