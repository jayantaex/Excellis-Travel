import '../../network/api_client.dart';
import '../../network/api_response.dart';
import '../../network/api_urls.dart';
import '../models/city_model.dart';
import '../models/state_model.dart';

class LocationApi {
  final ApiClient apiClient;

  LocationApi({required this.apiClient});

  Future<ApiResponse<List<StateModel>>> getStates() async {
    List<StateModel> states = [];
    final response = await apiClient.getRequest(
        endPoint: EndPoints.state,
        fromJson: (data) {
          data['data'].forEach((element) {
            states.add(StateModel.fromJson(element));
          });
          return states;
        });
    return response;
  }

  Future<ApiResponse<List<CityModel>>> getCities({
    required int stateId,
    required String stateCode,
  }) async {
    List<CityModel> cities = [];
    final response = await apiClient.getRequest(
        endPoint: EndPoints.cities,
        queryParameters: {'stateId': stateId, 'stateCode': stateCode},
        fromJson: (data) {
          data['data'].forEach((element) {
            cities.add(CityModel.fromJson(element));
          });
          return cities;
        });
    return response;
  }
}
