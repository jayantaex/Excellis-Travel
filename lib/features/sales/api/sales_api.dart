import 'package:excellistravel/core/network/api_response.dart';
import 'package:excellistravel/core/network/api_urls.dart';

import '../../../core/network/api_client.dart';
import '../data/models/sates_data_model.dart';

class SalesApi {
  SalesApi(this.apiClient);
  final ApiClient apiClient;

  Future<ApiResponse<SalesDataModel>> fetchSales({
    required int page,
    required int limit,
    required String startDate,
    required String endDate,
  }) async {
    try {
      return await apiClient.getRequest(
          endPoint: EndPoints.sales,
          queryParameters: {
            'page': page,
            'limit': limit,
            'fromDate': startDate.isEmpty ? null : startDate,
            'toDate': endDate.isEmpty ? null : endDate,
          },
          fromJson: (json) => SalesDataModel.fromJson(json['data']));
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
