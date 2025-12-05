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
      final ApiResponse<BookingListModel> resp = await apiClient.getRequest(
          queryParameters: <String, dynamic>{
            'searchCriteria': bookingId.isEmpty ? null : 'Reference No',
            'page': page,
            'limit': limit,
            'searchText': bookingId.isEmpty ? null : bookingId,
            'dateType': dateType,
            'status': status.isEmpty ? null : status,
            'fromDate': startDate.isEmpty ? null : startDate,
            'toDate': endDate.isEmpty ? null : endDate,
          },
          endPoint: EndPoints.ticket,
          fromJson: (Map<String, dynamic> json) =>
              BookingListModel.fromJson(json['data']));
      return resp;
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
