import 'package:hive_flutter/hive_flutter.dart';
import '../../features/flight_booking/data/models/hive/air_craft_hive_data_model.dart';
import '../../features/flight_booking/data/models/hive/air_port_hive_data_model.dart';
import '../../features/flight_booking/data/models/hive/flight_hive_data_model.dart';
import '../constants/app_constants.dart';

class LocalDB {
  Future<void> initLocalDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FlightHiveDataModelAdapter());
    Hive.registerAdapter(AirPortHiveDataModelAdapter());
    Hive.registerAdapter(AirCraftHiveDataModelAdapter());
  }

  Future<Box<FlightHiveDataModel>> getFlightBox<T>() async {
    await Hive.openBox<FlightHiveDataModel>(AppConstants.flightBox);
    return Hive.box<FlightHiveDataModel>(AppConstants.flightBox);
  }

  Future<Box<AirPortHiveDataModel>> getAirPortBox<T>() async {
    await Hive.openBox<AirPortHiveDataModel>(AppConstants.airPortBox);
    return Hive.box<AirPortHiveDataModel>(AppConstants.airPortBox);
  }

  Future<Box<AirCraftHiveDataModel>> getAirCraftBox<T>() async {
    await Hive.openBox<AirCraftHiveDataModel>(AppConstants.airCraftBox);
    return Hive.box<AirCraftHiveDataModel>(AppConstants.airCraftBox);
  }

  void closeLocalDB() {
    Hive.close();
  }

  void clearLocalDB({required String key}) {
    Hive.deleteBoxFromDisk(key);
  }

  Future<void> clearAllLocalDB() async {
    await Hive.deleteFromDisk();
  }
}
