import 'package:excellistravel/core/network/mock_res.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../data/ticket_mock_data.dart';
import '../models/ticket_model.dart';

class TicketApi {
  final ApiClient apiClient;

  TicketApi({required this.apiClient});

  Future<ApiResponse<List<TicketDataModel>>> getAllBookedTickets(
      {required int page, required int limit}) async {
    try {
      List<TicketDataModel> data = [];
      ApiResponse<List<TicketDataModel>> resp = await apiClient.getRequest(
          queryParameters: {'page': page, 'limit': limit},
          endPoint: EndPoints.ticket,
          fromJson: (json) {
            json['data']['bookings'].forEach((element) {
              data.add(TicketDataModel.fromJson(element));
            });
            return data;
          });

      return resp;
    } catch (e) {
      return ApiResponse(statusCode: 400, errorMessage: e.toString());
    }
  }
}
