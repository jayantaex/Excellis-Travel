import '../../../core/network/api_response.dart';
import '../api/flight_booking_api.dart';
import '../models/air_port_model.dart';
import '../models/create_order_res.dart';
import '../models/flight_offer_price_model.dart';
import '../models/flights_data_model.dart';
import '../models/payment_verify_res_model.dart';

class FlightBookingRepository {
  FlightBookingRepository({required this.api});
  final FlightBookingApi api;
  //search airports

  Future<List<AirportModel>> getAirport({
    required String keyword,
    required String country,
  }) async =>
      await api.getAirport(keyword: keyword, country: country);

  Future<ApiResponse<FlightsDataModel>> searchFlight({
    required Map<String, dynamic> body,
  }) async =>
      await api.searchFlight(body: body);

  Future<ApiResponse<FlightOfferPriceDataModel>> getFlightOfferPrice({
    required Map<String, dynamic> body,
  }) async =>
      await api.getFlightOfferPrice(body: body);

  Future<ApiResponse<OrderModel>> createPayment(
          {required Map<String, dynamic> body}) async =>
      await api.createPayment(body: body);

  Future<ApiResponse<PaymentVerifiedModel>> verifyPayment(
          {required Map<String, dynamic> body}) async =>
      await api.verifyPayment(body: body);

  Future<ApiResponse<double>> getMarkUpPrice(
          {required double basePrice}) async =>
      await api.getMarkUpPrice(basePrice: basePrice);

  Future<ApiResponse<MyMarkup>> getMyMarkup() async => await api.getMyMarkup();
}
