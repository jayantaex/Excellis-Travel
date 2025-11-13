import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/ticket_model.dart';

class TicketApi {
  TicketApi({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<List<TicketDataModel>>> getAllBookedTickets(
      {required int page, required int limit}) async {
    try {
      final List<TicketDataModel> data = <TicketDataModel>[];
      final ApiResponse<List<TicketDataModel>> resp =
          await apiClient.getRequest(
              queryParameters: <String, dynamic>{'page': page, 'limit': limit},
              endPoint: EndPoints.ticket,
              fromJson: (Map<String, dynamic> json) {
                json['data']['bookings']
                    .forEach((Map<String, dynamic> element) {
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
