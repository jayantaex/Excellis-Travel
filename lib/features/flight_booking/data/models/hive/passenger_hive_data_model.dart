import 'package:hive/hive.dart';
part 'passenger_hive_data_model.g.dart';

@HiveType(typeId: 3)
class PassengerHiveDataModel {
  const PassengerHiveDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.dateOfBirth,
    required this.gender,
    required this.number,
    required this.type,
  });
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String emailAddress;
  @HiveField(4)
  final DateTime dateOfBirth;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String number;
  @HiveField(7)
  final String type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['number'] = number;
    data['type'] = type;
    return data;
  }
}
