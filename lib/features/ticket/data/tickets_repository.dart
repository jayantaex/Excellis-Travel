import '../../../core/network/api_response.dart';
import '../api/ticket_api.dart';
import '../models/ticket_model.dart';

class TicketsRepository {
  TicketsRepository({required this.ticketApi});
  final TicketApi ticketApi;
  Future<ApiResponse<BookingListModel>> fetchTickets(
          {required int page, required int limit}) async =>
      await ticketApi.getAllBookedTickets(page: page, limit: limit);
}
