
import '../../network/api_response.dart';
import '../api/location_api.dart';
import '../models/city_model.dart';
import '../models/state_model.dart';

class LocationRepository {
  final LocationApi statesApi;
  LocationRepository({required this.statesApi});

  Future<ApiResponse<List<StateModel>>> getStates() => statesApi.getStates();
  Future<ApiResponse<List<CityModel>>> getCities({
    required int stateId,
    required String stateCode,
  }) =>
      statesApi.getCities(
        stateId: stateId,
        stateCode: stateCode,
      );
}
