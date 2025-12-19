import 'dart:developer';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../data/models/transaction_model.dart';
import '../data/models/wallet_charge_model.dart';
import '../data/models/wallet_model.dart';
import '../data/models/withdrawal_request_model.dart';

class WalletApi {
  WalletApi(this.apiClient);
  final ApiClient apiClient;

  /// Fetch wallet details
  Future<ApiResponse<WalletBalanceModel>> fetchWallet() async {
    try {
      return await apiClient.getRequest(
        endPoint: EndPoints.wallet,
        fromJson: (json) => WalletBalanceModel.fromJson(json['data']),
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  /// Fetch transactions
  Future<ApiResponse<TransactionDataModel>> fetchTransactions({
    required int page,
    required int limit,
  }) async {
    try {
      return await apiClient.getRequest(
        endPoint: EndPoints.walletTransactions,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        fromJson: (json) => TransactionDataModel.fromJson(json['data']),
      );
    } catch (e) {
      log(e.toString());
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  /// Submit withdrawal request
  Future<ApiResponse<void>> submitWithdrawalRequest({
    required WithdrawalRequestModel request,
  }) async {
    try {
      return await apiClient.postRequest(
        endPoint: EndPoints.walletWithdraw,
        reqModel: request.toJson(),
        fromJson: (json) {},
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  /// Add money to wallet
  Future<ApiResponse<void>> addMoney({
    required double amount,
    required String paymentMethod,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      return await apiClient.postRequest(
        endPoint: EndPoints.walletRecharge,
        reqModel: {
          'amount': amount,
          'payment_method': paymentMethod,
          ...?additionalData,
        },
        fromJson: (json) {},
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  /// Get transaction details
  Future<ApiResponse<TransactionDataModel>> getTransactionDetails({
    required String transactionId,
  }) async {
    try {
      return await apiClient.getRequest(
        endPoint: '${EndPoints.walletTransactions}/$transactionId',
        fromJson: (json) => TransactionDataModel.fromJson(json['data']),
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

//charge money
  Future<ApiResponse<WalletChargeModel>> chargeMoney(
      {required Map<String, dynamic> body}) async {
    try {
      return await apiClient.postRequest(
        reqModel: body,
        endPoint: EndPoints.walletCharge,
        fromJson: (json) => WalletChargeModel.fromJson(json),
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
