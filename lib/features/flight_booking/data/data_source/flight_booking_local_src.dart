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

  // Future<List<PassengerModel>> getSavedPassenger() async {
  //   try {
  //     final Box<PassengerHiveDataModel> passengerBox =
  //         await _localDB.getPassengerBox();
  //     final List<PassengerHiveDataModel> localData =
  //         passengerBox.values.toList();
  //     final List<PassengerModel> savedPassengerList = <PassengerModel>[];
  //     for (var element in localData) {
  //       savedPassengerList.add(PassengerModel.fromJson(element.toJson()));
  //     }
  //     return savedPassengerList;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  // Future<void> savePassenger(PassengerModel passenger) async {
  //   try {
  //     if (passenger.dateOfBirth == null) {
  //       throw Exception('Date of birth is required to save passenger');
  //     }

  //     final Box<PassengerHiveDataModel> passengerBox =
  //         await _localDB.getPassengerBox();

  //     // Generate ID if not present
  //     final String passengerId =
  //         passenger.id ?? DateTime.now().millisecondsSinceEpoch.toString();

  //     // Get all existing passengers
  //     final List<PassengerHiveDataModel> localData =
  //         passengerBox.values.toList();

  //     // Check if passenger with same ID already exists
  //     PassengerHiveDataModel? existingPassenger;
  //     int? existingIndex;

  //     for (int i = 0; i < localData.length; i++) {
  //       if (localData[i].id == passengerId) {
  //         existingPassenger = localData[i];
  //         existingIndex = i;
  //         break;
  //       }
  //     }

  //     // If passenger exists, update it; otherwise check for duplicates
  //     if (existingPassenger != null && existingIndex != null) {
  //       final PassengerHiveDataModel updatedPassenger = PassengerHiveDataModel(
  //         id: passengerId,
  //         firstName: passenger.firstName ?? '',
  //         lastName: passenger.lastName ?? '',
  //         emailAddress: passenger.emailAddress ?? '',
  //         dateOfBirth: passenger.dateOfBirth!,
  //         gender: passenger.gender ?? '',
  //         number: passenger.number ?? '',
  //         type: passenger.type ?? '',
  //       );
  //       await passengerBox.putAt(existingIndex, updatedPassenger);
  //     } else {
  //       // Check if passenger with same name and DOB already exists
  //       final bool duplicateExists = localData.any(
  //         (element) =>
  //             element.firstName.toLowerCase() ==
  //                 (passenger.firstName ?? '').toLowerCase() &&
  //             element.lastName.toLowerCase() ==
  //                 (passenger.lastName ?? '').toLowerCase() &&
  //             element.dateOfBirth.year == passenger.dateOfBirth!.year &&
  //             element.dateOfBirth.month == passenger.dateOfBirth!.month &&
  //             element.dateOfBirth.day == passenger.dateOfBirth!.day,
  //       );

  //       if (!duplicateExists) {
  //         final PassengerHiveDataModel newPassenger = PassengerHiveDataModel(
  //           id: passengerId,
  //           firstName: passenger.firstName ?? '',
  //           lastName: passenger.lastName ?? '',
  //           emailAddress: passenger.emailAddress ?? '',
  //           dateOfBirth: passenger.dateOfBirth!,
  //           gender: passenger.gender ?? '',
  //           number: passenger.number ?? '',
  //           type: passenger.type ?? '',
  //         );
  //         await passengerBox.add(newPassenger);
  //       }
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
