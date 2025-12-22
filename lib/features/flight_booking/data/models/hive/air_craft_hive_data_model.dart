import 'package:hive/hive.dart';

part 'air_craft_hive_data_model.g.dart';

@HiveType(typeId: 2)
class AirCraftHiveDataModel {
  AirCraftHiveDataModel({
    this.aircraft,
  });
  @HiveField(0)
  final Map<String, dynamic>? aircraft;
}
