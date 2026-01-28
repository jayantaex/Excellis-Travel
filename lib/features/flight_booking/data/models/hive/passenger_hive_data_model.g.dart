// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassengerHiveDataModelAdapter
    extends TypeAdapter<PassengerHiveDataModel> {
  @override
  final int typeId = 3;

  @override
  PassengerHiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PassengerHiveDataModel(
      id: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      emailAddress: fields[3] as String,
      dateOfBirth: fields[4] as DateTime,
      gender: fields[5] as String,
      number: fields[6] as String,
      type: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PassengerHiveDataModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.emailAddress)
      ..writeByte(4)
      ..write(obj.dateOfBirth)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.number)
      ..writeByte(7)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassengerHiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
