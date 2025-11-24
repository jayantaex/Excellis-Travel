import 'package:hive/hive.dart';

part 'air_port_hive_data_model.g.dart';

@HiveType(typeId: 1)
class AirPortHiveDataModel {
  AirPortHiveDataModel({
    this.airport,
  });
  @HiveField(0)
  final Map<String, dynamic>? airport;
}
