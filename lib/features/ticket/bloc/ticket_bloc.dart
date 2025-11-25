import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/tickets_repository.dart';
import '../data/models/ticket_model.dart';
part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc({required this.repository}) : super(TicketInitial()) {
    on<FetchTickets>(_handleFetchTickets);
  }
  final TicketsRepository repository;

  Future<void> _handleFetchTickets(
      FetchTickets event, Emitter<TicketState> emit) async {
    try {
      final currentState = state;
      BookingListModel tickets = BookingListModel();
      if (currentState is TicketLoaded) {
        tickets = currentState.tickets;
        emit(
          TicketLoaded(
            tickets: tickets,
            isLoadingMore: true,
          ),
        );
        return;
      } else {
        emit(TicketLoading());
      }
      final ApiResponse<BookingListModel> res = await repository.fetchTickets(
        page: event.page,
        limit: event.limit,
        bookingId: event.bookingId,
        status: event.status,
        startDate: event.startDate,
        endDate: event.endDate,
      );
      if (res.data != null) {
        if (event.page == 1 &&
            (event.startDate.isNotEmpty ||
                event.endDate.isNotEmpty ||
                event.bookingId.isNotEmpty)) {
          tickets = BookingListModel();
        }
        tickets = res.data ?? BookingListModel();
        if (state is TicketLoaded) {
          tickets.bookings!
              .addAll([...tickets.bookings!, ...res.data!.bookings!]);
        }

        emit(
          TicketLoaded(
            tickets: tickets,
            isLoadingMore: false,
          ),
        );
      } else {
        if (currentState is TicketLoaded) {
          emit(
            TicketLoaded(
              tickets: currentState.tickets,
              isLoadingMore: false,
            ),
          );
        } else {
          emit(TicketError(err: res.errorMessage ?? 'Something went wrong'));
        }
      }
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }
}
