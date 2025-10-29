import '../../../core/network/api_response.dart';
import '../api/ticket_api.dart';
import '../../../core/models/ticket_model.dart';

class TicketsRepository {
  final TicketApi ticketApi;

  TicketsRepository({required this.ticketApi});
  Future<ApiResponse<List<TicketDataModel>>> fetchTickets(
      {required String accessToken}) async {
    return await ticketApi.getAllBookedTickets(accessToken: accessToken);
  }
}
