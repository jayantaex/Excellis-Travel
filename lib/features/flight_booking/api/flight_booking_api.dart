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
  FlightBookingApi(this.amadeusClient, {this.apiClient});
  final AmadeusClient amadeusClient;
  ApiClient? apiClient;

  Future<List<AirportModel>> getAirport(
      {required String keyword, required String country}) async {
    try {
      final List<AirportModel> airportList = <AirportModel>[];
      await amadeusClient.getRequest(
          endPoint: EndPoints.airportSearchByKeyword,
          queryParameters: <String, dynamic>{
            'subType': 'AIRPORT',
            'keyword': keyword.trim(),
            'countryCode': country,
          },
          fromJson: (Map<String, dynamic> jsonData) {
            jsonData['data'].forEach((element) {
              airportList.add(AirportModel.fromJson(element));
            });
            return airportList;
          });
      return airportList;
    } catch (e) {
      return <AirportModel>[];
    }
  }

  Future<ApiResponse<FlightsDataModel>> searchFlight(
      {required Map<String, dynamic> body}) async {
    try {
      final ApiResponse<FlightsDataModel> response =
          await amadeusClient.postRequest(
        reqModel: body,
        endPoint: EndPoints.flightSearch,
        fromJson: (Map<String, dynamic> jsonData) =>
            FlightsDataModel.fromJson(jsonData),
      );

      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<FlightOfferPriceDataModel>> getFlightOfferPrice(
      {required Map<String, dynamic> body}) async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{
        'data': <String, Object>{
          'type': 'flight-offers-pricing',
          'flightOffers': <Map<String, dynamic>>[body]
        }
      };
      final ApiResponse<FlightOfferPriceDataModel> response =
          await amadeusClient.postRequest(
              reqModel: data,
              endPoint: EndPoints.flightOfferPrice,
              fromJson: (Map<String, dynamic> jsonData) =>
                  FlightOfferPriceDataModel.fromJson(jsonData));
      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<OrderModel>> createPayment(
      {required Map<String, dynamic> body}) async {
    try {
      final ApiResponse<OrderModel> resp = await apiClient!.postRequest(
          reqModel: body,
          endPoint: EndPoints.createPayment,
          fromJson: (Map<String, dynamic> jsonData) =>
              OrderModel.fromJson(jsonData['data']['order']));
      return resp;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<PaymentVerifiedModel>> verifyPayment(
      {required Map<String, dynamic> body}) async {
    try {
      final ApiResponse<PaymentVerifiedModel> response = await apiClient!
          .postRequest(
              reqModel: body,
              endPoint: EndPoints.verifyPayment,
              fromJson: (Map<String, dynamic> jsonData) =>
                  PaymentVerifiedModel.fromJson(jsonData['data']));

      return response;
    } catch (e) {
      return ApiResponse(
          errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<double>> getMarkUpPrice(
      {required double basePrice}) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'baseAmount': basePrice
      };
      final ApiResponse<double> resp = await apiClient!.postRequest(
          reqModel: body,
          endPoint: EndPoints.markupPricing,
          fromJson: (Map<String, dynamic> jsonData) =>
              double.parse(jsonData['data']['finalAmount'].toString()));
      return resp;
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<MyMarkup>> getMyMarkup() async {
    try {
      final ApiResponse<MyMarkup> resp = await apiClient!.getRequest(
          endPoint: EndPoints.myMarkup,
          fromJson: (Map<String, dynamic> jsonData) =>
              MyMarkup.fromJson(jsonData['data'][0]));
      return resp;
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }
}
