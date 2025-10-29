import 'package:excellistravel/core/network/mock_res.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../data/ticket_mock_data.dart';
import '../../../core/models/ticket_model.dart';

class TicketApi {
  final ApiClient apiClient;

  TicketApi({required this.apiClient});

  Future<ApiResponse<List<TicketDataModel>>> getAllBookedTickets(
      {required String accessToken}) async {
    try {
      List<TicketDataModel> list = [];
      for (var element in ticketData) {
        list.add(TicketDataModel.fromJson(element));
      }
      return mockSuccess(data: list);
    } catch (e) {
      return mockError(errorMessage: e.toString());
    }
  }
}
