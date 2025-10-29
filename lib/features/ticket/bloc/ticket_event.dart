part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class FetchTickets extends TicketEvent {
  final String accessToken;
  const FetchTickets({required this.accessToken});
}

class RefreshTickets extends TicketEvent {}

class GetTicketDetails extends TicketEvent {
  final String ticketId;
  const GetTicketDetails({required this.ticketId});
}
