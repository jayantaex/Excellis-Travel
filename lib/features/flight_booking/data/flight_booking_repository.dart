import '../api/flight_booking_api.dart';
import '../models/air_port_model.dart';

class FlightBookingRepository {
  final FlightBookingApi api;

  FlightBookingRepository({required this.api});
  //search airports

  Future<List<AirportModel>> getAirport({
    required String keyword,
  }) async {
    return await api.getAirport(keyword: keyword);
  }
}
