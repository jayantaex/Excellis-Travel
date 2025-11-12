import '../../../core/network/api_response.dart';
import '../api/ticket_api.dart';
import '../models/ticket_model.dart';

class TicketsRepository {
  final TicketApi ticketApi;

  TicketsRepository({required this.ticketApi});
  Future<ApiResponse<List<TicketDataModel>>> fetchTickets(
      {required int page, required int limit}) async {
    return await ticketApi.getAllBookedTickets(page: page, limit: limit);
  }
}
