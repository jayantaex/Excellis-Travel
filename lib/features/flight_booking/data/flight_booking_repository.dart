import '../../../core/network/api_response.dart';
import '../models/air_port_model.dart';
import '../src/flight_booking_remote_data_src.dart';

class FlightBookingRepository {
  final FlightBookingRemoteDataSrc remoteSc;

  FlightBookingRepository({required this.remoteSc});
  //search airports

  Future<ApiResponse<List<AirportModel>>> getAirport({
    required String countryCode,
    required String subType,
    required String keyword,
  }) async {
    return await remoteSc.getAirport(
        countryCode: countryCode, subType: subType, keyword: keyword);
  }
}
