import 'dart:developer';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/ticket_model.dart';

class TicketApi {
  TicketApi({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<TicketDataModel>> getAllBookedTickets(
      {required int page, required int limit}) async {
    try {
      final ApiResponse<TicketDataModel> resp = await apiClient.getRequest(
          queryParameters: <String, dynamic>{'page': page, 'limit': limit},
          endPoint: EndPoints.ticket,
          fromJson: (Map<String, dynamic> json) =>
              TicketDataModel.fromJson(json['data']));
      return resp;
    } catch (e) {
      log(e.toString());
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
