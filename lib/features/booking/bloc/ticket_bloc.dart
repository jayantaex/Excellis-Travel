import 'dart:developer';

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
    on<UpdateMarkup>(_handleUpdateMarkup);
    on<DeleteAllMarkup>(_handleDeleteAllMarkup);
    on<GetMarkup>(_handleGetMarkup);
  }
  final TicketsRepository repository;

  Future<void> _handleFetchTickets(
      FetchTickets event, Emitter<TicketState> emit) async {
    try {
      final currentState = state;

      // Emit loading state
      if (currentState is TicketLoaded) {
        // Show loading indicator for pagination
        emit(
          TicketLoaded(
            tickets: currentState.tickets,
            isLoadingMore: true,
            timestamp: currentState.timestamp,
          ),
        );
      } else {
        // Show full loading for initial load
        emit(TicketLoading());
      }

      // Make API call
      final ApiResponse<BookingListModel> res = await repository.fetchTickets(
        page: event.page,
        limit: event.limit,
        bookingId: event.bookingId,
        status: event.status,
        startDate: event.startDate,
        endDate: event.endDate,
        dateType: event.dateType,
      );

      if (res.data != null) {
        BookingListModel tickets;

        // Check if this is a filter reset (page 1 with filters)
        if (event.page == 1 &&
            (event.startDate.isNotEmpty ||
                event.endDate.isNotEmpty ||
                event.bookingId.isNotEmpty ||
                event.status.isNotEmpty)) {
          // Start fresh with filtered data
          tickets = res.data!;
        } else if (currentState is TicketLoaded && event.page > 1) {
          // Append new bookings to existing ones for pagination
          final existingBookings = currentState.tickets.bookings ?? [];
          final newBookings = res.data!.bookings ?? [];
          // Create a new BookingListModel with merged bookings
          tickets = BookingListModel(
            bookings: [...existingBookings, ...newBookings],
            pagination: res.data!.pagination,
          );
        } else {
          // Initial load or page 1 without filters
          tickets = res.data!;
        }
        emit(
          TicketLoaded(
            tickets: tickets,
            isLoadingMore: false,
            timestamp: DateTime.now(),
          ),
        );
      } else {
        if (currentState is TicketLoaded) {
          // Keep existing data if pagination fails
          emit(
            TicketLoaded(
              tickets: currentState.tickets,
              isLoadingMore: false,
              timestamp: currentState.timestamp,
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

  Future<void> _handleUpdateMarkup(
      UpdateMarkup event, Emitter<TicketState> emit) async {
    try {
      emit(TicketLoading());
      final ApiResponse<bool> res = await repository.updateMarkup(
        bookingId: event.bookingId,
        markup: event.markup,
      );
      if (res.data != null) {
        await repository.saveMarkup(event.bookingId, event.markup);
        emit(const MarkupUpdated());
      } else {
        emit(TicketError(err: res.errorMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }

  Future<void> _handleDeleteAllMarkup(
      DeleteAllMarkup event, Emitter<TicketState> emit) async {
    try {
      emit(TicketLoading());
      await repository.deleteAll();
      emit(const MarkupDeleted());
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }

  Future<void> _handleGetMarkup(
      GetMarkup event, Emitter<TicketState> emit) async {
    try {
      emit(TicketLoading());
      final double? markup = await repository.getMarkup(event.bookingId);
      if (markup != null) {
        emit(MarkupRetrieved(markup: markup));
      } else {
        emit(const MarkupRetrieved(markup: null));
      }
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }
}
