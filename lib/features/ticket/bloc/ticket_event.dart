part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class FetchTickets extends TicketEvent {
  const FetchTickets();
}

class FetchMoreTickets extends TicketEvent {
  const FetchMoreTickets({
    required this.page,
    required this.limit,
  });
  final int page;
  final int limit;
}

class RefreshTickets extends TicketEvent {}

class GetTicketDetails extends TicketEvent {
  const GetTicketDetails({required this.ticketId});
  final String ticketId;
}
