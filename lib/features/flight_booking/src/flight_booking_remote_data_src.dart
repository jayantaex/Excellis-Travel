import 'package:excellistravel/core/network/mock_res.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../data/search_data.dart';
import '../models/air_port_model.dart';

class FlightBookingRemoteDataSrc {
  final ApiClient apiClient;
  FlightBookingRemoteDataSrc({required this.apiClient});

  Future<ApiResponse<List<AirportModel>>> getAirport({
    required String countryCode,
    required String subType,
    required String keyword,
  }) async {
    final SearchData searchData = SearchData();
    Map<String, dynamic> params = {
      'countryCode': countryCode,
      'subType': subType,
      'keyword': keyword
    };
    List<AirportModel> airports = searchData.searchAirports(query: keyword);
    return mockSuccess(data: airports);

    return await apiClient.getRequest(
        endPoint: EndPoints.airportSearch,
        queryParameters: params,
        fromJson: (json) {
          return (searchData as List)
              .map((e) => AirportModel.fromJson(e))
              .toList();
        });
  }
}
