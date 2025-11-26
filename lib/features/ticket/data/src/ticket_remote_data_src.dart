import 'dart:developer';

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
  }) async {
    try {
      final ApiResponse<BookingListModel> resp = await apiClient.getRequest(
          queryParameters: <String, dynamic>{
            'page': page,
            'limit': limit,
            'searchText': bookingId,
            'dateType': 'bookingdate',
            'status': status,
            'fromDate': startDate,
            'toDate': endDate,
          },
          endPoint: EndPoints.ticket,
          fromJson: (Map<String, dynamic> json) =>
              BookingListModel.fromJson(json['data']));
      return resp;
    } catch (e) {
      log('$e', name: 'getAllBookedTickets TicketApi');
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
