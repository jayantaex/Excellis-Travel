import 'dart:developer';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../data/models/transaction_model.dart';
import '../data/models/wallet_charge_model.dart';
import '../data/models/wallet_model.dart';
import '../data/models/wallet_order_model.dart';
import '../data/models/withdrawl_request_data_model.dart';

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

//create order

  Future<ApiResponse<WalletOrderModel>> createWalletOrder(
          {required Map<String, dynamic> body}) async =>
      apiClient.postRequest(
        endPoint: EndPoints.createWalletOrder,
        reqModel: body,
        fromJson: (jsonData) => WalletOrderModel.fromJson(jsonData['data']),
      );

//verify order
  Future<ApiResponse<bool>> verifyWalletOrder(
          {required Map<String, dynamic> body}) async =>
      apiClient.postRequest(
          endPoint: EndPoints.verifyWalletOrder,
          reqModel: body,
          fromJson: (data) => data['success']);

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

  //re-charge money
  Future<ApiResponse<bool>> reChargeMoney(
      {required Map<String, dynamic> body}) async {
    try {
      return await apiClient.postRequest(
        reqModel: body,
        endPoint: EndPoints.walletRecharge,
        fromJson: (json) => json['success'],
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

//submit withdrawal request
  Future<ApiResponse<bool>> submitWithdrawalRequest(
      {required Map<String, dynamic> body}) async {
    try {
      return await apiClient.postRequest(
        reqModel: body,
        endPoint: EndPoints.requestWithdrawal,
        fromJson: (json) => json['success'],
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

//fetch withdrawal requests
  Future<ApiResponse<WithdrawlRequestDataModel>> fetchWithdrawalRequests({
    required int page,
    required int limit,
    required String? status,
  }) async {
    try {
      final Map<String, dynamic> queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      if (status != null) {
        queryParameters['status'] = status;
      }
      return await apiClient.getRequest(
        endPoint: EndPoints.withdrawalRequests,
        queryParameters: queryParameters,
        fromJson: (json) => WithdrawlRequestDataModel.fromJson(json),
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<bool>> cancelWithdrawalRequest({
    required int requestId,
  }) async {
    try {
      return await apiClient.postRequest(
        endPoint: '${EndPoints.cancelWithdrawalRequest}$requestId/cancel',
        fromJson: (json) => json['success'],
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
