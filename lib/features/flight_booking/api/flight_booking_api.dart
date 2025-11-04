import 'dart:developer';

import 'package:excellistravel/features/flight_booking/models/flight_offer_price_model.dart';
import '../../../core/network/amadeus_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
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

  Future<ApiResponse<FlightsDataModel>> searchFlight(
      {required Map<String, dynamic> body}) async {
    try {
      ApiResponse<FlightsDataModel> response = await client.postRequest(
        reqModel: body,
        endPoint: EndPoints.flightSearch,
        fromJson: (jsonData) {
          log('$jsonData', name: 'FLIGHT SAERCH BLOC [API]');
          return FlightsDataModel.fromJson(jsonData);
        },
      );

      return response;
    } catch (e) {
      log('$e', name: 'FLIGHT SAERCH BLOC [API]');
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }

  Future<ApiResponse<FlightOfferPriceDataModel>> getFlightOfferPrice(
      {required Map<String, dynamic> body}) async {
    try {
      ApiResponse<FlightOfferPriceDataModel> response =
          await client.postRequest(
              reqModel: body,
              endPoint: EndPoints.flightOfferPrice,
              fromJson: (jsonData) {
                log('$jsonData', name: 'FLIGHT SAERCH BLOC [API]');
                return FlightOfferPriceDataModel.fromJson(jsonData);
              });
      return response;
    } catch (e) {
      log('$e', name: 'FLIGHT SAERCH BLOC [API]');
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }
}
