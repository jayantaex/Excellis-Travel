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
      data: (fields[0] as Map).cast<String, dynamic>(),
      dictionaries: (fields[1] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FlightHiveDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.dictionaries);
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
