part of 'ticket_bloc.dart';

sealed class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

final class TicketInitial extends TicketState {}

final class TicketLoading extends TicketState {}

final class TicketLoaded extends TicketState {
  final List<TicketDataModel> tickets;

  const TicketLoaded({required this.tickets});
}

final class TicketError extends TicketState {
  final String err;

  const TicketError({required this.err});
}
