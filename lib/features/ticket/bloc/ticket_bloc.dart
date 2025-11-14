import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/tickets_repository.dart';
import '../models/ticket_model.dart';
part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc({required this.repository}) : super(TicketInitial()) {
    on<FetchTickets>(_handleFetchTickets);
    on<FetchMoreTickets>(_handleFetchMoreTickets);
  }
  final TicketsRepository repository;

  Future<void> _handleFetchTickets(
      FetchTickets event, Emitter<TicketState> emit) async {
    try {
      emit(TicketLoading());
      final ApiResponse<TicketDataModel> res = await repository.fetchTickets(
        page: 1,
        limit: 10,
      );
      if (res.errorMessage == null || res.errorMessage == '') {
        log('${res.data?.bookings?.length}', name: 'Length');
        emit(TicketLoaded(tickets: res.data ?? TicketDataModel()));
        return;
      }

      emit(TicketError(err: res.errorMessage ?? 'Something went wrong'));
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }

  Future<void> _handleFetchMoreTickets(
      FetchMoreTickets event, Emitter<TicketState> emit) async {
    try {
      emit(MoreTicketLoading());
      final ApiResponse<TicketDataModel> res = await repository.fetchTickets(
        page: event.page,
        limit: event.limit,
      );
      if (res.errorMessage == null || res.errorMessage == '') {
        emit(TicketLoaded(tickets: res.data ?? TicketDataModel()));
        return;
      }

      emit(TicketError(err: res.errorMessage ?? 'Something went wrong'));
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }
}
