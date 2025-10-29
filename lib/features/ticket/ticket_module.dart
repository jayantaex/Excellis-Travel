import 'package:excellistravel/features/profile_management/bloc/profile_bloc.dart';
import 'package:excellistravel/features/ticket/data/tickets_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import '../profile_management/apis/profile_management_api.dart';
import '../profile_management/data/profile_management_repository.dart';
import 'api/ticket_api.dart';
import 'bloc/ticket_bloc.dart';
import 'presentation/screens/ticket_screen.dart';

class TicketModule {
  static String routeName = 'ticket';
  static String routePath = '/ticket';
  static Widget builder() {
    final apiClient = ApiClient();
    final profileApi = ProfileManagementApi(apiClient: apiClient);
    final profileRepo =
        ProfileManagementRepository(profileManagementApi: profileApi);

    final ticketApi = TicketApi(apiClient: apiClient);
    final ticketRepository = TicketsRepository(ticketApi: ticketApi);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProfileBloc(profileRepository: profileRepo),
        ),
        BlocProvider(create: (_) => TicketBloc(repository: ticketRepository)),
      ],
      child: TicketScreen(),
    );
  }
}
