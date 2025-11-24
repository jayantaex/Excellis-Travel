// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_port_hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AirPortHiveDataModelAdapter extends TypeAdapter<AirPortHiveDataModel> {
  @override
  final int typeId = 1;

  @override
  AirPortHiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AirPortHiveDataModel(
      airport: (fields[0] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, AirPortHiveDataModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.airport);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirPortHiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
