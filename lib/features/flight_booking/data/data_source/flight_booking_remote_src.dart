import 'dart:developer';

import '../../../../core/network/amadeus_client.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/api_urls.dart';
import '../models/air_port_model.dart';
import '../models/create_order_res.dart';
import '../models/flight_offer_price_model.dart';
import '../models/flights_data_model.dart';
import '../models/payment_verify_res_model.dart';
import '../models/seat_map_data_model.dart';
import '../models/traveller_data_model.dart';

class FlightBookingRemoteSrc {
  FlightBookingRemoteSrc(this.amadeusClient, {this.apiClient});
  final AmadeusClient amadeusClient;
  ApiClient? apiClient;

  Future<List<AirportModel>> getAirport(
      {required String keyword, required String country}) async {
    try {
      final List<AirportModel> airportList = <AirportModel>[];
      await amadeusClient.getRequest(
          endPoint: EndPoints.airportSearchByKeyword,
          queryParameters: <String, dynamic>{
            'subType': 'CITY,AIRPORT',
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
              fromJson: (Map<String, dynamic> jsonData) {
                if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
                  return FlightsDataModel.fromJson(jsonData);
                }
                return FlightsDataModel();
              });

      return response;
    } catch (e) {
      log(e.toString());
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
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
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<OrderModel>> createPayment(
      {required Map<String, dynamic> body}) async {
    try {
      final ApiResponse<OrderModel> resp = await apiClient!.postRequest(
          reqModel: body,
          endPoint: EndPoints.createPayment,
          fromJson: (Map<String, dynamic> jsonData) => OrderModel(
                id: jsonData['data']['order']['id'],
                paymentId: jsonData['data']['payment']['id'],
                bookingId: jsonData['data']['payment']['booking_id'],
                amount:
                    (double.parse(jsonData['data']['payment']['amount']) * 100)
                        .toInt(),
              ));
      return ApiResponse(
          data: resp.data,
          errorMessage: resp.errorMessage,
          statusCode: resp.statusCode);
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<PaymentVarifiedDataModel>> verifyPayment(
      {required Map<String, dynamic> body}) async {
    try {
      final ApiResponse<PaymentVarifiedDataModel> response = await apiClient!
          .postRequest(
              reqModel: body,
              endPoint: EndPoints.verifyPayment,
              fromJson: (Map<String, dynamic> jsonData) =>
                  PaymentVarifiedDataModel.fromJson(
                      jsonData['data']['booking']));

      return response;
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
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

  Future<ApiResponse<String>> getAirlineName(
      {required String airlineCode}) async {
    try {
      final ApiResponse<String> resp = await amadeusClient.getRequest(
          endPoint: EndPoints.airlineName,
          queryParameters: <String, dynamic>{
            'airlineCodes': airlineCode,
          },
          fromJson: (Map<String, dynamic> jsonData) =>
              jsonData['data'][0]['businessName']);
      return resp;
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<SeatMapDataModel>> getSeatMapData(
      {required FlightOfferDatam flightOfferData}) async {
    try {
      final ApiResponse<SeatMapDataModel> resp =
          await amadeusClient.postRequest(
              endPoint: EndPoints.seatMap,
              reqModel: {
                'data': [flightOfferData.toJson()]
              },
              fromJson: (Map<String, dynamic> jsonData) =>
                  SeatMapDataModel.fromJson(jsonData));
      log('${resp.data!.seatData}', name: 'Flight Booking Remote Source');
      return resp;
    } catch (e) {
      return ApiResponse(errorMessage: e.toString(), statusCode: 400);
    }
  }

  Future<ApiResponse<bool>> createTraveler(
          {required Map<String, dynamic> body}) async =>
      await apiClient!.postRequest(
          endPoint: EndPoints.travelers,
          reqModel: body,
          fromJson: (Map<String, dynamic> jsonData) => jsonData['success']);

  Future<ApiResponse<List<TravelerDataModel>>> getTravelers() async {
    final List<TravelerDataModel> travelerList = <TravelerDataModel>[];
    final ApiResponse<List<TravelerDataModel>> resp =
        await apiClient!.getRequest(
            endPoint: EndPoints.travelers,
            fromJson: (Map<String, dynamic> jsonData) {
              jsonData['data'].forEach((x) {
                travelerList.add(TravelerDataModel.fromJson(x));
                return travelerList;
              });
              return travelerList;
            });
    return resp;
  }
}
