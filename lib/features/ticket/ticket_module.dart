import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/network/api_client.dart';
import 'models/ticket_model.dart';
import 'presentation/screens/ticket_details_screen.dart';
import 'api/ticket_api.dart';
import 'bloc/ticket_bloc.dart';
import 'data/tickets_repository.dart';
import 'presentation/screens/ticket_screen.dart';

class TicketModule {
  //tickets screen
  static String tickets = 'ticket';
  static String ticketsRoute = '/ticket';
  static Widget ticketBuilder() {
    final apiClient = ApiClient();
    final ticketApi = TicketApi(apiClient: apiClient);
    final ticketRepository = TicketsRepository(ticketApi: ticketApi);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TicketBloc(repository: ticketRepository)),
      ],
      child: const TicketScreen(),
    );
  }

//ticket details screen
  static String ticketDetails = 'ticket_details';
  static String ticketDetailsRoute = '/ticket_details';
  static Widget ticketDetailsBuilder(GoRouterState state) {
    final TicketDataModel data = state.extra as TicketDataModel;
    final apiClient = ApiClient();
    final ticketApi = TicketApi(apiClient: apiClient);
    final ticketRepository = TicketsRepository(ticketApi: ticketApi);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TicketBloc(repository: ticketRepository)),
      ],
      child: TicketDetailsScreen(
        ticketData: data,
      ),
    );
  }
}
