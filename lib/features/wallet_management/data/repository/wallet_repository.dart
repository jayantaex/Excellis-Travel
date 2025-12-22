import '../../../../core/network/api_response.dart';
import '../../api/wallet_api.dart';
import '../models/transaction_model.dart';
import '../models/wallet_charge_model.dart';
import '../models/wallet_model.dart';
import '../models/wallet_order_model.dart';
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
  Future<ApiResponse<TransactionDataModel>> fetchTransactions({
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

  /// Recharge money to wallet (recharge)

  Future<ApiResponse<WalletOrderModel>> createRechargeOrder({
    required Map<String, dynamic> body,
  }) async =>
      await walletApi.createWalletOrder(
        body: body,
      );
  Future<ApiResponse<bool>> verifyWalletOrder({
    required Map<String, dynamic> body,
  }) async =>
      await walletApi.verifyWalletOrder(body: body);
  Future<ApiResponse<bool>> rechargeWallet({
    required Map<String, dynamic> body,
  }) async =>
      await walletApi.reChargeMoney(body: body);

//charge money
  Future<ApiResponse<WalletChargeModel>> chargeMoney(
          {required Map<String, dynamic> body}) async =>
      await walletApi.chargeMoney(body: body);
}
//verify money
