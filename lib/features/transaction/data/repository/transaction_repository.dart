import '../../../../core/network/api_response.dart';
import '../../api/transaction_api.dart';
import '../models/transaction_model.dart';

class TransactionRepository {
  TransactionRepository(this.transactionApi);
  final TransactionApi transactionApi;

  Future<ApiResponse<TransactionListModel>> getAllTransactions({
    required int page,
    required int limit,
    String? startDate,
    String? endDate,
    String? keyword,
    String? status,
    String? transactionType,
  }) async =>
      await transactionApi.getAllTransactions(
        page: page,
        limit: limit,
        startDate: startDate,
        endDate: endDate,
        keyword: keyword,
        status: status,
        transactionType: transactionType,
      );
}

