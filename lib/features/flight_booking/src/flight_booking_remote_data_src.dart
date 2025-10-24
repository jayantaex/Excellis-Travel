import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/air_port_model.dart';

class FlightBookingRemoteDataSrc {
  final ApiClient apiClient;
  FlightBookingRemoteDataSrc({required this.apiClient});

  Future<ApiResponse<List<AirportModel>>> getAirport({
    required String countryCode,
    required String subType,
    required String keyword,
  }) async {
    Map<String, dynamic> _params = {
      'countryCode': countryCode,
      'subType': subType,
      'keyword': keyword
    };
    return await apiClient.getRequest(
        endPoint: EndPoints.airportSearch,
        queryParameters: _params,
        fromJson: (json) {
          return (json as List).map((e) => AirportModel.fromJson(e)).toList();
        });
  }
}
