import 'dart:developer';

import '../../../../core/network/api_response.dart';
import '../models/seat_map_data_model.dart';
import '../data_source/flight_booking_local_src.dart';
import '../data_source/flight_booking_remote_src.dart';
import '../models/air_port_model.dart';
import '../models/create_order_res.dart';
import '../models/flight_offer_price_model.dart';
import '../models/flights_data_model.dart';
import '../models/payment_verify_res_model.dart';

class FlightBookingRepository {
  FlightBookingRepository({required this.remoteSrc, required this.localSrc});
  final FlightBookingRemoteSrc remoteSrc;
  final FlightBookingLocalSrc localSrc;
  //search airports

  Future<List<AirportModel>> getAirport({
    required String keyword,
    required String country,
  }) async {
    try {
      final localAirportList =
          await localSrc.getAirport(keyword: keyword, country: country);
      if (localAirportList.isNotEmpty) {
        return localAirportList;
      }
      final remoteAirportList =
          await remoteSrc.getAirport(keyword: keyword, country: country);
      //save to local
      await localSrc.saveAirport(remoteAirportList);
      return remoteAirportList;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<FlightsDataModel>> searchFlight({
    required Map<String, dynamic> body,
  }) async =>
      await remoteSrc.searchFlight(body: body);

  Future<ApiResponse<FlightOfferPriceDataModel>> getFlightOfferPrice({
    required Map<String, dynamic> body,
  }) async =>
      await remoteSrc.getFlightOfferPrice(body: body);

  Future<ApiResponse<OrderModel>> createPayment(
          {required Map<String, dynamic> body}) async =>
      await remoteSrc.createPayment(body: body);

  Future<ApiResponse<PaymentVarifiedDataModel>> verifyPayment(
          {required Map<String, dynamic> body}) async =>
      await remoteSrc.verifyPayment(body: body);

  Future<ApiResponse<double>> getMarkUpPrice(
          {required double basePrice}) async =>
      await remoteSrc.getMarkUpPrice(basePrice: basePrice);

  Future<ApiResponse<MyMarkup>> getMyMarkup() async =>
      await remoteSrc.getMyMarkup();

  Future<ApiResponse<String>> getAirlineName(
      {required String airlineCode}) async {
    try {
      final localAirlineList = await localSrc.getAirCraft();

      if (localAirlineList.isNotEmpty) {
        final localAirlineName = getAirlineNameFromLocal(
            localAirlineList: localAirlineList, airlineCode: airlineCode);
        if (localAirlineName.isNotEmpty) {
          return ApiResponse(data: localAirlineName, statusCode: 200);
        }
      }

      final remoteAirlineName =
          await remoteSrc.getAirlineName(airlineCode: airlineCode);
      if (remoteAirlineName.statusCode == 200) {
        await localSrc.saveAirCraft([
          {
            'iataCode': airlineCode,
            'name': remoteAirlineName.data,
          }
        ]);
      }
      return remoteAirlineName;
    } catch (e) {
      log(e.toString());
      return ApiResponse(
          statusCode: 400, errorMessage: 'Failed to get airline name');
    }
  }

  Future<ApiResponse<SeatMapDataModel>> getSeatMapData(
          {required FlightOfferDatam flightOfferData}) async =>
      await remoteSrc.getSeatMapData(flightOfferData: flightOfferData);
}

String getAirlineNameFromLocal(
    {required List localAirlineList, required String airlineCode}) {
  try {
    if (localAirlineList.isNotEmpty) {
      final localAirlineName = localAirlineList
          .where((element) => element['iataCode'] == airlineCode)
          .first;
      return localAirlineName['name'];
    }
    return '';
  } catch (e) {
    return '';
  }
}
