import '../../../core/network/amadeus_client.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/air_port_model.dart';
import '../models/create_order_res.dart';
import '../models/flight_offer_price_model.dart';
import '../models/flights_data_model.dart';
import '../models/payment_verify_res_model.dart';

class FlightBookingApi {
  final AmadeusClient amadeusClient;
  ApiClient? apiClient;
  FlightBookingApi(this.amadeusClient, {this.apiClient});

  Future<List<AirportModel>> getAirport(
      {required String keyword, required String country}) async {
    try {
      List<AirportModel> airportList = [];
      await amadeusClient.getRequest(
          endPoint: EndPoints.airportSearchByKeyword,
          queryParameters: {
            'subType': 'AIRPORT',
            'keyword': keyword.trim(),
            'countryCode': country,
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
      ApiResponse<FlightsDataModel> response = await amadeusClient.postRequest(
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
          await amadeusClient.postRequest(
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

  Future<ApiResponse<OrderModel>> createPayment(
      {required Map<String, dynamic> body}) async {
    try {
      ApiResponse<OrderModel> resp = await apiClient!.postRequest(
          reqModel: body,
          endPoint: EndPoints.createPayment,
          fromJson: (jsonData) {
            return OrderModel.fromJson(jsonData['data']['order']);
          });
      return resp;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }

  Future<ApiResponse<PaymentVerifiedModel>> verifyPayment(
      {required Map<String, dynamic> body}) async {
    try {
      ApiResponse<PaymentVerifiedModel> response = await apiClient!.postRequest(
          reqModel: body,
          endPoint: EndPoints.verifyPayment,
          fromJson: (jsonData) {
            return PaymentVerifiedModel.fromJson(jsonData['data']);
          });

      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), data: null, statusCode: 400);
    }
  }

  Future<ApiResponse<double>> getMarkUpPrice(
      {required double basePrice}) async {
    try {
      Map<String, dynamic> body = {"baseAmount": basePrice};
      ApiResponse<double> resp = await apiClient!.postRequest(
          reqModel: body,
          endPoint: EndPoints.markupPricing,
          fromJson: (jsonData) {
            return double.parse(jsonData['data']['finalAmount'].toString());
          });
      return resp;
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }
}
