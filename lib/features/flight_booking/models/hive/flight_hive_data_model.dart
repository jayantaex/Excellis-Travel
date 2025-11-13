import 'package:hive/hive.dart';

// You need to run code generation for the 'part' file:
// flutter pub run build_runner build
part 'flight_hive_data_model.g.dart'; // Updated part file name

// --- FlightHiveDataModel (Type ID: 0) ---
@HiveType(typeId: 0)
class FlightHiveDataModel extends HiveObject { 

  FlightHiveDataModel({
    required this.data, 
    required this.dictionaries
  });
  // Corresponds to the "data": {} part of the JSON.
  @HiveField(0)
  final Map<String, dynamic> data; 

  // Corresponds to the "dictionaries": {} part of the JSON.
  @HiveField(1)
  final Map<String, dynamic> dictionaries;
}