import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../data/tickets_repository.dart';
import '../models/ticket_model.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketsRepository repository;
  TicketBloc({required this.repository}) : super(TicketInitial()) {
    on<FetchTickets>(_handleFetchTickets);
  }

  Future<void> _handleFetchTickets(
      FetchTickets event, Emitter<TicketState> emit) async {
    try {
      emit(TicketLoading());
      ApiResponse<List<TicketDataModel>> res = await repository.fetchTickets(
        page: event.page,
        limit: event.limit,
      );
      log("${res.errorMessage}", name: "TICKET-BLOC");
      if (res.errorMessage == null || res.errorMessage == '') {
        emit(TicketLoaded(tickets: res.data ?? []));
        return;
      }
      emit(TicketError(err: res.errorMessage ?? 'Something went wrong'));
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }
}
