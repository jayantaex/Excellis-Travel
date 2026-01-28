import 'dart:developer';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/api_urls.dart';
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

class WalletRemoteDataSrc {
  WalletRemoteDataSrc({required this.apiClient});
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

//fetch credit balance
  Future<ApiResponse<CreditBalanceModel>> fetchCreditBalance() async {
    try {
      return await apiClient.getRequest(
        endPoint: EndPoints.getCreditBalance,
        fromJson: (json) => CreditBalanceModel.fromJson(json),
      );
    } catch (e) {
      log(e.toString());
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<CurstomCrTransactionModel>>
      fetchCreditBalanceTransactions({
    required int page,
    required int limit,
  }) async {
    try {
      Map<String, dynamic> bookinData = <String, dynamic>{};
      Map<String, dynamic> transactionData = <String, dynamic>{};
      final Map<String, dynamic> allData = <String, dynamic>{
        'summary': <String, dynamic>{
          'totalCredits': 0,
          'totalPending': 0,
          'totalRepaid': 0,
        },
        'data': [],
      };
      await apiClient.getRequest(
        endPoint: EndPoints.getCreditBalanceTransactions,
        queryParameters: {
          'page': 1,
          'limit': 9999999999,
        },
        fromJson: (json) {
          transactionData = json;
        },
      );
      await apiClient.getRequest(
        endPoint: EndPoints.getBokkingViaCreditBalance,
        queryParameters: {
          'page': 1,
          'limit': 999999999,
        },
        fromJson: (json) {
          bookinData = json;
        },
      );
      allData['summary'] = transactionData['data']['summary'];
      transactionData['data']['data'].forEach((element) {
        final Map<String, dynamic> data = {
          'title': 'Credit Balance ',
          'desc': element['description'],
          'type': 'credit-transaction',
          'amount': element['amount'],
          'txnId': 'CT${element['id']}',
          'dateTime': element['created_at'],
          'repaymentDate': element['repayment_date'],
          'recipient': element['recipient'],
          'rePaymentStatus': element['repayment_status'],
          'autoDeductionAttempted': element['auto_deduction_attempted'],
          'autoDeductionDate': element['auto_deduction_date'],
          'reminderSent': element['repayment_reminder_sent'],
        };

        allData['data'].add(data);
      });
      bookinData['data']['bookings'].forEach((element) {
        final Map<String, dynamic> data = {
          'title': 'Flight Booking',
          'desc':
              'Flight booking from ${element['flight_data']['itineraries'][0]['segments'].first['departure']['iataCode']} to ${element['flight_data']['itineraries'][0]['segments'].last['arrival']['iataCode']}',
          'type': 'flight-booking',
          'amount': element['total_amount'],
          'txnId': 'BK${element['id']}',
          'dateTime': element['created_at'],
          'paymentReference': element['payment']['payment_reference'],
          'bookingStatus': element['booking_status'],
        };

        allData['data'].add(data);
      });
      //filter it according to createdAt
      allData['data'].sort((a, b) => DateTime.parse(b['dateTime'])
          .compareTo(DateTime.parse(a['dateTime'])));
      return ApiResponse(
          statusCode: 200, data: CurstomCrTransactionModel.fromJson(allData));
    } catch (e) {
      log(e.toString());
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

// credit wallet charge money
  Future<ApiResponse<bool>> chargeCreditWalletMoney(
      {required Map<String, dynamic> body}) async {
    try {
      return await apiClient.postRequest(
        reqModel: body,
        endPoint: EndPoints.chargeCreditWallet,
        fromJson: (json) => json['success'],
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<List<OverDueDataModel>>> fetchOverdueRepayments() async {
    try {
      final List<OverDueDataModel> overdueRepayments = [];
      return await apiClient.getRequest(
        endPoint: EndPoints.getOverdueRepayments,
        fromJson: (json) {
          json['data'].forEach((element) {
            overdueRepayments.add(OverDueDataModel.fromJson(element));
          });
          return overdueRepayments;
        },
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<List<PendingRepaymentDataModel>>>
      fetchPendingRepayments() async {
    try {
      final List<PendingRepaymentDataModel> pendingRepayments = [];
      return await apiClient.getRequest(
        endPoint: EndPoints.getPendingRepayments,
        fromJson: (json) {
          json['data'].forEach((element) {
            pendingRepayments.add(PendingRepaymentDataModel.fromJson(element));
          });
          return pendingRepayments;
        },
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<RePayRespModel>> confirmPayment({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await apiClient.postRequest(
        endPoint: EndPoints.confirmPayment,
        reqModel: body,
        fromJson: (json) => RePayRespModel.fromJson(json),
      );
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
