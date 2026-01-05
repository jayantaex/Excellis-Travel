import '../../../core/network/api_response.dart';
import 'models/ticket_model.dart';
import 'data_source/ticker_local_data_src.dart';
import 'data_source/ticket_remote_data_src.dart';

class TicketsRepository {
  TicketsRepository({
    required this.ticketRemoteDataSrc,
    required this.ticketLocalDataSrc,
  });
  final TicketRemoteDataSrc ticketRemoteDataSrc;
  final TicketLocalDataSrc ticketLocalDataSrc;
  Future<ApiResponse<BookingListModel>> fetchTickets({
    required int page,
    required int limit,
    required String status,
    required String startDate,
    required String endDate,
    required String bookingId,
    required String dateType,
  }) async =>
      await ticketRemoteDataSrc.getAllBookedTickets(
        page: page,
        limit: limit,
        status: status,
        bookingId: bookingId,
        endDate: endDate,
        startDate: startDate,
        dateType: dateType,
      );
  Future<ApiResponse<bool>> updateMarkup(
          {required String bookingId, required double markup}) async =>
      await ticketRemoteDataSrc.updateMarkup(
          bookingId: bookingId, markup: markup);

  Future<void> saveMarkup(String bookingId, double markup) async =>
      ticketLocalDataSrc.saveMarkup(bookingId, markup);

  Future<double?> getMarkup(String bookingId) async =>
      ticketLocalDataSrc.getMarkup(bookingId);

  Future<void> deleteAll() async => ticketLocalDataSrc.deleteAll();
}
