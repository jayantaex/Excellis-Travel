import '../../../core/network/api_response.dart';
import '../api/flight_booking_api.dart';
import '../models/air_port_model.dart';
import '../models/flight_offer_price_model.dart';
import '../models/flight_order_model.dart';
import '../models/flights_data_model.dart';

class FlightBookingRepository {
  final FlightBookingApi api;

  FlightBookingRepository({required this.api});
  //search airports

  Future<List<AirportModel>> getAirport({
    required String keyword,
  }) async {
    return await api.getAirport(keyword: keyword);
  }

  Future<ApiResponse<FlightsDataModel>> searchFlight({
    required Map<String, dynamic> body,
  }) async {
    return await api.searchFlight(body: body);
  }

  Future<ApiResponse<FlightOfferPriceDataModel>> getFlightOfferPrice({
    required Map<String, dynamic> body,
  }) async {
    return await api.getFlightOfferPrice(body: body);
  }

  Future<ApiResponse<FlightOrderModel>> createOrder(
      {required Map<String, dynamic> body}) async {
    return await api.createOrder(body: body);
  }
}
