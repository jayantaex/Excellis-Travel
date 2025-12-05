import '../../../../core/network/api_response.dart';
import '../../api/wallet_api.dart';
import '../models/transaction_model.dart';
import '../models/wallet_model.dart';
import '../models/withdrawal_request_model.dart';

class WalletRepository {
  WalletRepository(this.walletApi);
  final WalletApi walletApi;

  /// Fetch wallet details including balance and transactions
  Future<ApiResponse<WalletBalanceModel>> fetchWallet({
    String? filterType, // 'credit', 'debit', or null for all
  }) async =>
      await walletApi.fetchWallet();

  /// Fetch transactions with pagination
  Future<ApiResponse<List<TransactionDataModel>>> fetchTransactions({
    required int page,
    required int limit,
  }) async =>
      await walletApi.fetchTransactions(
        page: page,
        limit: limit,
      );

  /// Submit withdrawal request
  Future<ApiResponse<void>> submitWithdrawalRequest({
    required WithdrawalRequestModel request,
  }) async =>
      await walletApi.submitWithdrawalRequest(request: request);

  /// Add money to wallet (recharge)
  Future<ApiResponse<void>> addMoney({
    required double amount,
    required String paymentMethod,
    Map<String, dynamic>? additionalData,
  }) async =>
      await walletApi.addMoney(
        amount: amount,
        paymentMethod: paymentMethod,
        additionalData: additionalData,
      );

  /// Get transaction details by ID
  Future<ApiResponse<TransactionDataModel>> getTransactionDetails({
    required String transactionId,
  }) async =>
      await walletApi.getTransactionDetails(transactionId: transactionId);
}
