import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellistravel/core/network/api_response.dart';
import 'package:excellistravel/features/ticket/data/tickets_repository.dart';

import '../data/ticket_model.dart';

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
      List<TicketDataModel> tickets = [];
      ApiResponse res =
          await repository.fetchTickets(accessToken: event.accessToken);
      log("${res.errorMessage}", name: "TICKET-BLOC");
      if (res.errorMessage == null || res.errorMessage == '') {
        tickets = res.data ?? [];
        emit(TicketLoaded(tickets: tickets));
        return;
      }
      emit(TicketError(err: res.errorMessage ?? 'Something went wrong'));
    } catch (e) {
      emit(TicketError(err: e.toString()));
    }
  }
}
