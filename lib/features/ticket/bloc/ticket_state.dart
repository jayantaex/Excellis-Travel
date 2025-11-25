part of 'ticket_bloc.dart';

sealed class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

final class TicketInitial extends TicketState {}

final class TicketLoading extends TicketState {}

final class TicketLoaded extends TicketState {
  const TicketLoaded({
    required this.tickets,
    required this.isLoadingMore,
    required this.timestamp,
  });
  final BookingListModel tickets;
  final bool isLoadingMore;
  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp, isLoadingMore];
}

final class TicketError extends TicketState {
  const TicketError({required this.err});
  final String err;

  @override
  List<Object> get props => [err];
}
