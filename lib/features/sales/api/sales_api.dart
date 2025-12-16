import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../data/models/markup_data_model.dart';
import '../data/models/sates_data_model.dart';
import '../presentation/screens/child_data_model.dart';

class SalesApi {
  SalesApi(this.apiClient);
  final ApiClient apiClient;

  Future<ApiResponse<SalesDataModel>> fetchSales({
    required int page,
    required int limit,
    required String startDate,
    required String endDate,
    String? keyword,
  }) async {
    try {
      return await apiClient.getRequest(
          endPoint: EndPoints.sales,
          queryParameters: {
            'page': page,
            'limit': limit,
            'fromDate': startDate.isEmpty ? null : startDate,
            'toDate': endDate.isEmpty ? null : endDate,
            'searchText': keyword?.isEmpty ?? true ? null : keyword,
          },
          fromJson: (json) => SalesDataModel.fromJson(json['data']));
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<SalesDataModel>> filteredSalesByUser({
    required int page,
    required int limit,
    required String startDate,
    required String endDate,
    required int agentId,
    String? keyword,
    required String userType,
  }) async {
    try {
      return await apiClient.getRequest(
          endPoint: '${EndPoints.salesByUsers}/$agentId',
          queryParameters: {
            'page': page,
            'limit': 10000,
            'fromDate': startDate.isEmpty ? null : startDate,
            'toDate': endDate.isEmpty ? null : endDate,
            'searchText': keyword?.isEmpty ?? true ? null : keyword,
            'userRole': userType,
          },
          fromJson: (json) => SalesDataModel.fromJson(json['data']));
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<MarkupDataModel>> fetchMyMarkup({
    required int page,
    required int limit,
  }) async {
    try {
      return await apiClient.getRequest(
          endPoint: EndPoints.markup,
          queryParameters: {
            'page': page,
            'limit': limit,
          },
          fromJson: (json) => MarkupDataModel.fromJson(json['data']));
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<void>> addMarkUp(
      {required Map<String, dynamic> body}) async {
    try {
      return await apiClient.postRequest(
          endPoint: EndPoints.markup, reqModel: body, fromJson: (json) {});
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<void>> editMarkUp(
      {required Map<String, dynamic> body, required int id}) async {
    try {
      return await apiClient.putRequest(
          endPoint: '${EndPoints.markup}/$id',
          reqModel: body,
          fromJson: (json) {});
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<void>> deleteMarkUp({required int id}) async {
    try {
      return await apiClient.deleteRequest(
          endPoint: '${EndPoints.markup}/$id', fromJson: (jsonData) {});
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<List<ChildDataModel>>> fetchAgents({
    required int agentId,
  }) async =>
      await apiClient.getRequest<List<ChildDataModel>>(
          endPoint: '${EndPoints.agents}/$agentId',
          fromJson: (json) => (json['data'] as List<dynamic>)
              .map((e) => ChildDataModel.fromJson(e))
              .toList());
  Future<ApiResponse<List<ChildDataModel>>> fetchSubSalesExecutives() async =>
      await apiClient.getRequest<List<ChildDataModel>>(
          endPoint: EndPoints.subSalesExecutives,
          fromJson: (json) => (json['data'] as List<dynamic>)
              .map((e) => ChildDataModel.fromJson(e))
              .toList());
}
