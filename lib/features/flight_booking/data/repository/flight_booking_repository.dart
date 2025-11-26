import '../../../../core/network/api_response.dart';
import '../src/flight_booking_local_src.dart';
import '../src/flight_booking_remote_src.dart';
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
}
