import '../../../../core/network/api_response.dart';
import '../../api/sales_api.dart';
import '../models/sates_data_model.dart';

class SalesRepository {
  SalesRepository(this.salesApi);
  final SalesApi salesApi;

  Future<ApiResponse<SalesDataModel>> fetchSales({
    required int page,
    required int limit,
  }) async =>
      await salesApi.fetchSales(page: page, limit: limit);
}
