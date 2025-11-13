import '../../network/api_client.dart';
import '../../network/api_response.dart';
import '../../network/api_urls.dart';
import '../models/city_model.dart';
import '../models/state_model.dart';

class LocationApi {
  LocationApi({required this.apiClient});
  final ApiClient apiClient;
  Future<ApiResponse<List<StateModel>>> getStates() async {
    final List<StateModel> states = <StateModel>[];
    final ApiResponse<List<StateModel>> response = await apiClient.getRequest(
        endPoint: EndPoints.state,
        fromJson: (Map<String, dynamic> data) {
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
    final List<CityModel> cities = <CityModel>[];
    final ApiResponse<List<CityModel>> response = await apiClient.getRequest(
        endPoint: EndPoints.cities,
        queryParameters: <String, dynamic>{
          'stateId': stateId,
          'stateCode': stateCode
        },
        fromJson: (Map<String, dynamic> data) {
          data['data'].forEach((element) {
            cities.add(CityModel.fromJson(element));
          });
          return cities;
        });
    return response;
  }
}
