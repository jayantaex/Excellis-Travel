import '../../../../core/network/api_response.dart';
import '../models/credit_balance_model.dart';
import '../models/custom_cr_transaction_model.dart';
import '../models/overdue_data_model.dart';
import '../models/repay_resp_model.dart';
import '../models/repayment_data_model.dart';
import '../models/transaction_model.dart';
import '../models/wallet_charge_model.dart';
import '../models/wallet_model.dart';
import '../models/wallet_order_model.dart';
import '../models/withdrawl_request_data_model.dart';
import '../src/wallet_remote_data_src.dart';

class WalletRepository {
  WalletRepository(this.walletRemoteDataSrc);
  final WalletRemoteDataSrc walletRemoteDataSrc;

  // Fetch wallet details including balance and transactions
  Future<ApiResponse<WalletBalanceModel>> fetchWallet({
    String? filterType, // 'credit', 'debit', or null for all
  }) async =>
      await walletRemoteDataSrc.fetchWallet();

  // Fetch transactions with pagination
  Future<ApiResponse<TransactionDataModel>> fetchTransactions({
    required int page,
    required int limit,
  }) async =>
      await walletRemoteDataSrc.fetchTransactions(
        page: page,
        limit: limit,
      );

  // Recharge money to wallet (recharge)

  Future<ApiResponse<WalletOrderModel>> createRechargeOrder({
    required Map<String, dynamic> body,
  }) async =>
      await walletRemoteDataSrc.createWalletOrder(
        body: body,
      );

  Future<ApiResponse<bool>> verifyWalletOrder({
    required Map<String, dynamic> body,
  }) async =>
      await walletRemoteDataSrc.verifyWalletOrder(body: body);

  Future<ApiResponse<bool>> rechargeWallet({
    required Map<String, dynamic> body,
  }) async =>
      await walletRemoteDataSrc.reChargeMoney(body: body);

//charge money
  Future<ApiResponse<WalletChargeModel>> chargeMoney(
          {required Map<String, dynamic> body}) async =>
      await walletRemoteDataSrc.chargeMoney(body: body);

  Future<ApiResponse<bool>> submitWithdrawalRequest(
          {required Map<String, dynamic> body}) async =>
      await walletRemoteDataSrc.submitWithdrawalRequest(body: body);

  Future<ApiResponse<WithdrawlRequestDataModel>> fetchWithdrawalRequests({
    required int page,
    required int limit,
    required String? status,
  }) async =>
      await walletRemoteDataSrc.fetchWithdrawalRequests(
          page: page, limit: limit, status: status);

  Future<ApiResponse<bool>> cancelWithdrawalRequest({
    required int requestId,
  }) async =>
      await walletRemoteDataSrc.cancelWithdrawalRequest(requestId: requestId);

//CREDIT WALLET
// Fetch credit balance
  Future<ApiResponse<CreditBalanceModel>> fetchCreditBalance() async =>
      await walletRemoteDataSrc.fetchCreditBalance();
// Fetch credit balance transactions
  Future<ApiResponse<CurstomCrTransactionModel>>
      fetchCreditBalanceTransactions({
    required int page,
    required int limit,
  }) async =>
          await walletRemoteDataSrc.fetchCreditBalanceTransactions(
              page: page, limit: limit);

// credit wallet charge money
  Future<ApiResponse<bool>> chargeCreditWalletMoney({
    required Map<String, dynamic> body,
  }) async =>
      await walletRemoteDataSrc.chargeCreditWalletMoney(body: body);

  Future<ApiResponse<List<OverDueDataModel>>> fetchOverdueRepayments() async {
    try {
      return await walletRemoteDataSrc.fetchOverdueRepayments();
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<List<PendingRepaymentDataModel>>>
      fetchPendingRepayments() async {
    try {
      return await walletRemoteDataSrc.fetchPendingRepayments();
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<RePayRespModel>> confirmPayment({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await walletRemoteDataSrc.confirmPayment(body: body);
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
