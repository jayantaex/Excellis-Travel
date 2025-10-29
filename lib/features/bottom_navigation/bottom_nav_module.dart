import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import '../profile_management/apis/profile_management_api.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/profile_management_repository.dart';
import '../ticket/api/ticket_api.dart';
import '../ticket/bloc/ticket_bloc.dart';
import '../ticket/data/tickets_repository.dart';

import 'presentation/screens/bottom_navigation.dart';

class BottomNavModule {
  static const String path = '/bottom_nav';
  static const String name = 'bottom_nav_screen';
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
      child: const BottomNavigationScreen(),
    );
  }
}
