import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/api_urls.dart';
import '../models/ticket_model.dart';

class TicketRemoteDataSrc {
  TicketRemoteDataSrc({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<BookingListModel>> getAllBookedTickets({
    required int page,
    required int limit,
    required String bookingId,
    required String status,
    required String startDate,
    required String endDate,
    required String dateType,
  }) async {
    try {
      final Map<String, dynamic> queryParameters = <String, dynamic>{};
      if (bookingId.isNotEmpty) {
        queryParameters['searchCriteria'] = 'Reference No';
        queryParameters['searchText'] = bookingId;
      }
      if (page > 0) {
        queryParameters['page'] = page;
      }
      if (limit > 0) {
        queryParameters['limit'] = limit;
      }
      if (dateType.isNotEmpty) {
        queryParameters['dateType'] = dateType;
      }
      if (status.isNotEmpty) {
        queryParameters['status'] = status;
      }
      if (startDate.isNotEmpty) {
        queryParameters['fromDate'] = '${startDate}T00:00:00.000Z';
      }
      if (endDate.isNotEmpty) {
        queryParameters['toDate'] = '${endDate}T23:59:59.999Z';
      }

      final ApiResponse<BookingListModel> resp = await apiClient.getRequest(
          queryParameters: queryParameters,
          endPoint: EndPoints.ticket,
          fromJson: (Map<String, dynamic> json) =>
              BookingListModel.fromJson(json['data']));
      return resp;
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }

  Future<ApiResponse<bool>> updateMarkup(
      {required String bookingId, required double markup}) async {
    try {
      final ApiResponse<bool> resp = await apiClient.postRequest(
          endPoint: EndPoints.updateMarkup,
          reqModel: {'bookingReference': bookingId, 'markup': markup},
          fromJson: (Map<String, dynamic> json) => json['success']);
      return resp;
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
