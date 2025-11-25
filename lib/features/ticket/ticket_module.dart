import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/network/api_client.dart';
import 'data/models/ticket_model.dart';
import 'data/src/ticket_remote_data_src.dart';
import 'presentation/screens/ticket_details_screen.dart';
import 'bloc/ticket_bloc.dart';
import 'data/tickets_repository.dart';
import 'presentation/screens/ticket_screen.dart';

class TicketModule {
  static final TicketsRepository ticketRepository = TicketsRepository(
      ticketRemoteDataSrc: TicketRemoteDataSrc(apiClient: ApiClient()));
  //tickets screen
  static String tickets = 'ticket';
  static String ticketsRoute = '/ticket';
  static Widget ticketBuilder() => MultiBlocProvider(
        providers: [
          BlocProvider<TicketBloc>(
              create: (_) => TicketBloc(repository: ticketRepository)),
        ],
        child: const TicketScreen(),
      );

//ticket details screen
  static String ticketDetails = 'ticket_details';
  static String ticketDetailsRoute = '/ticket_details';
  static Widget ticketDetailsBuilder(GoRouterState state) {
    final Booking data = state.extra as Booking;
    return MultiBlocProvider(
      providers: [
        BlocProvider<TicketBloc>(
            create: (_) => TicketBloc(repository: ticketRepository)),
      ],
      child: TicketDetailsScreen(
        ticketData: data,
      ),
    );
  }
}
