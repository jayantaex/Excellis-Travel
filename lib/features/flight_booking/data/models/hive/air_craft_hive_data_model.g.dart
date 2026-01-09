// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_craft_hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AirCraftHiveDataModelAdapter extends TypeAdapter<AirCraftHiveDataModel> {
  @override
  final int typeId = 2;

  @override
  AirCraftHiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AirCraftHiveDataModel(
      aircraft: (fields[0] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, AirCraftHiveDataModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.aircraft);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirCraftHiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
