import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../core/services/local_db.dart';
import '../models/air_port_model.dart';
import '../models/hive/air_craft_hive_data_model.dart';
import '../models/hive/air_port_hive_data_model.dart';

class FlightBookingLocalSrc {
  FlightBookingLocalSrc({required LocalDB localDB}) : _localDB = localDB;
  final LocalDB _localDB;
  Future<List<AirportModel>> getAirport({
    required String keyword,
    required String country,
  }) async {
    final List<AirportModel> airportList = <AirportModel>[];
    try {
      final Box<AirPortHiveDataModel> airportBox =
          await _localDB.getAirPortBox();
      final List<AirPortHiveDataModel> localData = airportBox.values.toList();

      for (var element in localData) {
        final AirportModel airportModel =
            AirportModel.fromJson(jsonDecode(jsonEncode(element.airport)));
        airportList.add(airportModel);
      }
      //filter by city or iata code
      final List<AirportModel> filteredAirportList = airportList
          .where(
            (element) => (element.address!.cityName!
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ||
                element.name!.toLowerCase().contains(keyword.toLowerCase()) ||
                element.iataCode!
                        .toLowerCase()
                        .contains(keyword.toLowerCase()) &&
                    (element.address!.countryCode!.toLowerCase() ==
                        country.toLowerCase())),
          )
          .toList();

      return filteredAirportList;
    } catch (e) {
      return [];
    }
  }

  Future<void> saveAirport(List<AirportModel> remoteAirportList) async {
    try {
      final Box<AirPortHiveDataModel> airportBox =
          await _localDB.getAirPortBox();
      final List<AirPortHiveDataModel> localData = airportBox.values.toList();
      for (var remoteElement in remoteAirportList) {
        if (localData.any((localElement) =>
            localElement.airport!['iataCode'] == remoteElement.iataCode)) {
          continue;
        }

        final AirPortHiveDataModel airPortHiveDataModel =
            AirPortHiveDataModel(airport: remoteElement.toJson());
        airportBox.add(airPortHiveDataModel);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getAirCraft() async {
    try {
      final Box<AirCraftHiveDataModel> airCraftBox =
          await _localDB.getAirCraftBox();
      final List<AirCraftHiveDataModel> localData = airCraftBox.values.toList();
      final List<Map<String, dynamic>> airCraftList = <Map<String, dynamic>>[];
      for (var element in localData) {
        airCraftList.add(element.aircraft!);
      }
      return airCraftList;
    } catch (e) {
      return [];
    }
  }

  Future<void> saveAirCraft(
      List<Map<String, dynamic>> remoteAirCraftList) async {
    try {
      final Box<AirCraftHiveDataModel> airCraftBox =
          await _localDB.getAirCraftBox();
      final List<AirCraftHiveDataModel> localData = airCraftBox.values.toList();
      for (var remoteElement in remoteAirCraftList) {
        if (localData.any((localElement) =>
            localElement.aircraft!['iataCode'] == remoteElement['iataCode'])) {
          continue;
        }

        final AirCraftHiveDataModel airCraftHiveDataModel =
            AirCraftHiveDataModel(aircraft: remoteElement);
        airCraftBox.add(airCraftHiveDataModel);
      }
    } catch (e) {
      rethrow;
    }
  }
}
