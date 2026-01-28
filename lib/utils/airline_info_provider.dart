import 'dart:developer';

import '../core/network/amadeus_client.dart';
import '../core/network/api_response.dart';
import '../core/services/local_db.dart';
import '../features/flight_booking/data/repository/flight_booking_repository.dart';
import '../features/flight_booking/data/data_source/flight_booking_local_src.dart';
import '../features/flight_booking/data/data_source/flight_booking_remote_src.dart';

class AirlineInfoProvider {
  AirlineInfoProvider() {
    repository = FlightBookingRepository(
      remoteSrc: FlightBookingRemoteSrc(AmadeusClient()),
      localSrc: FlightBookingLocalSrc(localDB: LocalDB()),
    );
  }
  late FlightBookingRepository repository;
  Future<String> getAirlineName({required String airlineCode}) async {
    try {
      log('airlineCode: $airlineCode');
      if (airlineCode.isEmpty) {
        return '';
      }

      final ApiResponse<String> resp =
          await repository.getAirlineName(airlineCode: airlineCode);
      return resp.data ?? '';
    } catch (e) {
      return '';
    }
  }
}
