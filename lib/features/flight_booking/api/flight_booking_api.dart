import 'dart:developer';
import 'package:excellistravel/core/network/api_response.dart';
import 'package:excellistravel/core/network/api_urls.dart';
import '../../../core/network/amadeus_client.dart';
import '../models/air_port_model.dart';
import '../models/flights_data_model.dart';

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

  Future<ApiResponse<FlightsDataModel>> searchAirport(
      {required Map<String, dynamic> body}) async {
    try {
      log('body $body', name: 'FLIGHT BLOC');
      return await client.postRequest(
          reqModel: body,
          endPoint: EndPoints.flightSearch,
          fromJson: (jsonData) {
            return FlightsDataModel.fromJson(jsonData);
          });
    } catch (e) {
      log('$e', name: 'FLIGHT SAERCH BLOC [API]');
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }
}
