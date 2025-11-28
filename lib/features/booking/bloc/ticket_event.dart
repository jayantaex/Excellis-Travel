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
  });
  final int page;
  final int limit;
  final String startDate;
  final String endDate;
  final String status;
  final String bookingId;
}

class RefreshTickets extends TicketEvent {}

class GetTicketDetails extends TicketEvent {
  const GetTicketDetails({required this.ticketId});
  final String ticketId;
}
