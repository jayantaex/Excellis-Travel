// import 'package:excellistravel/core/network/api_response.dart';
// import 'package:excellistravel/core/network/api_urls.dart';

// import '../../../core/network/api_client.dart';
// import '../data/models/transaction_model.dart';

// class TransactionApi {
//   TransactionApi(this.apiClient);
//   final ApiClient apiClient;

//   Future<ApiResponse<TransactionListModel>> getAllTransactions({
//     required int page,
//     required int limit,
//     String? startDate,
//     String? endDate,
//     String? keyword,
//     String? status,
//     String? transactionType,
//   }) async {
//     try {
//       return await apiClient.getRequest(
//           endPoint: EndPoints.transactions,
//           queryParameters: {
//             'page': page,
//             'limit': limit,
//             'fromDate': startDate?.isEmpty ?? true ? null : startDate,
//             'toDate': endDate?.isEmpty ?? true ? null : endDate,
//             'searchText': keyword?.isEmpty ?? true ? null : keyword,
//             'status': status?.isEmpty ?? true ? null : status,
//             'transactionType': transactionType?.isEmpty ?? true
//                 ? null
//                 : transactionType,
//           },
//           fromJson: (json) => TransactionListModel.fromJson(json['data']));
//     } catch (e) {
//       return ApiResponse(statusCode: 400, errorMessage: e.toString());
//     }
//   }
// }

