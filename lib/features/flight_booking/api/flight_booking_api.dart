import '../../../core/network/amadeus_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/air_port_model.dart';
import '../models/flight_offer_price_model.dart';
import '../models/flight_order_model.dart';
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
          return FlightsDataModel.fromJson(jsonData);
        },
      );

      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }

  Future<ApiResponse<FlightOfferPriceDataModel>> getFlightOfferPrice(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> data = {
        "data": {
          "type": "flight-offers-pricing",
          "flightOffers": [body]
        }
      };
      ApiResponse<FlightOfferPriceDataModel> response =
          await client.postRequest(
              reqModel: data,
              endPoint: EndPoints.flightOfferPrice,
              fromJson: (jsonData) {
                return FlightOfferPriceDataModel.fromJson(jsonData);
              });
      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }

  Future<ApiResponse<FlightOrderModel>> createOrder(
      {required Map<String, dynamic> body}) async {
    try {
      ApiResponse<FlightOrderModel> response = await client.postRequest(
          reqModel: body,
          endPoint: EndPoints.createOrder,
          fromJson: (jsonData) {
            return FlightOrderModel.fromJson(jsonData['data']);
          });
      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }
}
