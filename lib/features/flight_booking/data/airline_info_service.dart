import '../../../core/network/amadeus_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/services/local_db.dart';
import 'repository/flight_booking_repository.dart';
import 'src/flight_booking_local_src.dart';
import 'src/flight_booking_remote_src.dart';

class AirlinInfoService {
  AirlinInfoService() {
    repository = FlightBookingRepository(
        remoteSrc: FlightBookingRemoteSrc(AmadeusClient()),
        localSrc: FlightBookingLocalSrc(localDB: LocalDB()));
  }
  late FlightBookingRepository repository;
  Future<String> getAirlineName({required String airlineCode}) async {
    if (airlineCode.isEmpty) {
      return '';
    }
    try {
      final ApiResponse<String> resp =
          await repository.getAirlineName(airlineCode: airlineCode);
      return resp.data ?? '';
    } catch (e) {
      return '';
    }
  }
}
