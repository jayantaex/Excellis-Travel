import '../../../../core/network/api_response.dart';
import '../../api/sales_api.dart';
import '../../presentation/screens/child_data_model.dart';
import '../models/markup_data_model.dart';
import '../models/sates_data_model.dart';

class SalesRepository {
  SalesRepository(this.salesApi);
  final SalesApi salesApi;

  Future<ApiResponse<SalesDataModel>> fetchSales({
    required int page,
    required int limit,
    required String startDate,
    required String endDate,
    String? keyword,
    String? userType,
    int? agentId,
  }) async {
    if (agentId != null) {
      return await salesApi.filteredSalesByUser(
        page: page,
        limit: limit,
        startDate: startDate,
        endDate: endDate,
        keyword: keyword,
        agentId: agentId,
        userType: userType ?? 'agent',
      );
    }
    return await salesApi.fetchSales(
        page: page,
        limit: limit,
        startDate: startDate,
        endDate: endDate,
        keyword: keyword);
  }

  Future<ApiResponse<MarkupDataModel>> fetchMarkUp({
    required int page,
    required int limit,
  }) async =>
      await salesApi.fetchMyMarkup(page: page, limit: limit);

  Future<ApiResponse<void>> addMarkUp({
    required Map<String, dynamic> body,
  }) async =>
      await salesApi.addMarkUp(body: body);

  Future<ApiResponse<void>> editMarkUp({
    required Map<String, dynamic> body,
    required int id,
  }) async =>
      await salesApi.editMarkUp(body: body, id: id);

  Future<ApiResponse<void>> deleteMarkUp({
    required int id,
  }) async =>
      await salesApi.deleteMarkUp(id: id);

  Future<ApiResponse<List<ChildDataModel>>> fetchAgents({
    required int agentId,
  }) async =>
      await salesApi.fetchAgents(agentId: agentId);

  Future<ApiResponse<List<ChildDataModel>>> fetchSubSalesExecutives() async =>
      await salesApi.fetchSubSalesExecutives();
}
