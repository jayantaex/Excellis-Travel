import 'dart:developer';
import 'package:excellistravel/core/network/api_urls.dart';
import '../../../core/network/amadeus_client.dart';
import '../models/air_port_model.dart';

class FlightBookingApi {
  final AmadeusClient client;

  FlightBookingApi(this.client);

  Future<List<AirportModel>> getAirport({required String keyword}) async {
    try {
      List<AirportModel> airportList = [];
      await client.getRequest(
          endPoint: EndPoints.airportSearchByKeyword,
          queryParameters: {
            'subType': 'AIRPORT',
            'keyword': keyword.trim(),
            'countryCode': 'IN',
          },
          fromJson: (jsonData) {
            jsonData['data'].forEach((element) {
              airportList.add(AirportModel.fromJson(element));
            });
            return airportList;
          });
      return airportList;
    } catch (e) {
      log('$e', name: 'FLIGHT BLOC');
      return [];
    }
  }
}
