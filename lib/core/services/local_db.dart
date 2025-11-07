import 'package:hive_flutter/hive_flutter.dart';

import '../../features/flight_booking/models/hive/flight_hive_data_model.dart';
import '../constants/app_constants.dart';

class LocalDB {
  Future<void> initLocalDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FlightHiveDataModelAdapter());
    Hive.registerAdapter(DatamAdapter());
    Hive.registerAdapter(ItineraryAdapter());
    Hive.registerAdapter(SegmentAdapter());
    Hive.registerAdapter(DepartureAdapter());
    Hive.registerAdapter(ArrivalAdapter());
    Hive.registerAdapter(AircraftAdapter());
    Hive.registerAdapter(OperatingAdapter());
    Hive.registerAdapter(DatamPriceAdapter());
    Hive.registerAdapter(FeeAdapter());
    Hive.registerAdapter(TravelerPricingAdapter());
    Hive.registerAdapter(TravelerPricingPriceAdapter());
    Hive.registerAdapter(FareDetailsBySegmentAdapter());
    Hive.registerAdapter(IncludedCBagsAdapter());
    Hive.registerAdapter(AmenityAdapter());
    Hive.registerAdapter(AmenityProviderAdapter());
  }

  Future<Box<FlightHiveDataModel>> getFlightBox<T>() async {
    await Hive.openBox<FlightHiveDataModel>(AppConstants.flightBox);
    return Hive.box<FlightHiveDataModel>(AppConstants.flightBox);
  }

  void closeLocalDB() {
    Hive.close();
  }

  void clearLocalDB({required String key}) {
    Hive.deleteBoxFromDisk(key);
  }

  void clearAllLocalDB() {
    Hive.deleteFromDisk();
  }
}
