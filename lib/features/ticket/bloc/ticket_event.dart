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
  final int page;
  final int limit;
  const FetchMoreTickets({
    required this.page,
    required this.limit,
  });
}

class RefreshTickets extends TicketEvent {}

class GetTicketDetails extends TicketEvent {
  final String ticketId;
  const GetTicketDetails({required this.ticketId});
}
