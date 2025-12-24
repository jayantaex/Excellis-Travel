part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class FetchTickets extends TicketEvent {
  const FetchTickets({
    required this.page,
    required this.limit,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.bookingId,
    required this.dateType,
  });
  final int page;
  final int limit;
  final String startDate;
  final String endDate;
  final String status;
  final String bookingId;
  final String dateType;
}

class RefreshTickets extends TicketEvent {}

class GetTicketDetails extends TicketEvent {
  const GetTicketDetails({required this.ticketId});
  final String ticketId;
}

class UpdateMarkup extends TicketEvent {
  const UpdateMarkup({required this.bookingId, required this.markup});
  final String bookingId;
  final double markup;
}

class DeleteAllMarkup extends TicketEvent {}

class GetMarkup extends TicketEvent {
  const GetMarkup({required this.bookingId});
  final String bookingId;
}

class SaveMarkup extends TicketEvent {
  const SaveMarkup({required this.bookingId, required this.markup});
  final String bookingId;
  final double markup;
}
