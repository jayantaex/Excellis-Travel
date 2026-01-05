import '../../../../core/network/api_response.dart';
import '../../api/wallet_api.dart';
import '../models/credit_balance_model.dart';
import '../models/credit_balance_transaction_model.dart';
import '../models/custom_cr_transaction_model.dart';
import '../models/transaction_model.dart';
import '../models/wallet_charge_model.dart';
import '../models/wallet_model.dart';
import '../models/wallet_order_model.dart';
import '../models/withdrawl_request_data_model.dart';

class WalletRepository {
  WalletRepository(this.walletApi);
  final WalletApi walletApi;

  // Fetch wallet details including balance and transactions
  Future<ApiResponse<WalletBalanceModel>> fetchWallet({
    String? filterType, // 'credit', 'debit', or null for all
  }) async =>
      await walletApi.fetchWallet();

  // Fetch transactions with pagination
  Future<ApiResponse<TransactionDataModel>> fetchTransactions({
    required int page,
    required int limit,
  }) async =>
      await walletApi.fetchTransactions(
        page: page,
        limit: limit,
      );

  // Recharge money to wallet (recharge)

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

  Future<ApiResponse<bool>> submitWithdrawalRequest(
          {required Map<String, dynamic> body}) async =>
      await walletApi.submitWithdrawalRequest(body: body);

  Future<ApiResponse<WithdrawlRequestDataModel>> fetchWithdrawalRequests({
    required int page,
    required int limit,
    required String? status,
  }) async =>
      await walletApi.fetchWithdrawalRequests(
          page: page, limit: limit, status: status);

  Future<ApiResponse<bool>> cancelWithdrawalRequest({
    required int requestId,
  }) async =>
      await walletApi.cancelWithdrawalRequest(requestId: requestId);

//CREDIT WALLET
// Fetch credit balance
  Future<ApiResponse<CreditBalanceModel>> fetchCreditBalance() async =>
      await walletApi.fetchCreditBalance();
// Fetch credit balance transactions
  Future<ApiResponse<CurstomCrTransactionModel>>
      fetchCreditBalanceTransactions({
    required int page,
    required int limit,
  }) async =>
          await walletApi.fetchCreditBalanceTransactions(
              page: page, limit: limit);
}
