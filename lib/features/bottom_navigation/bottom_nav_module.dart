import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import '../profile_management/apis/profile_management_api.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/repository/profile_management_repository.dart';
import '../sales/api/sales_api.dart';
import '../sales/bloc/sales_bloc.dart';
import '../sales/data/repository/sales_repository.dart';
import '../ticket/bloc/ticket_bloc.dart';
import '../ticket/data/src/ticket_remote_data_src.dart';
import '../ticket/data/tickets_repository.dart';
import 'presentation/screens/bottom_navigation.dart';

class BottomNavModule {
  static const String path = '/bottom_nav';
  static const String name = 'bottom_nav_screen';
  static final TicketsRepository ticketRepository = TicketsRepository(
      ticketRemoteDataSrc: TicketRemoteDataSrc(apiClient: ApiClient()));
  static Widget builder() {
    final ApiClient apiClient = ApiClient();
    final ProfileManagementApi profileApi =
        ProfileManagementApi(apiClient: apiClient);
    final ProfileManagementRepository profileRepo =
        ProfileManagementRepository(profileManagementApi: profileApi);

    final SalesApi salesApi = SalesApi(apiClient);
    final SalesRepository salesRepository = SalesRepository(salesApi);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(profileRepository: profileRepo),
        ),
        BlocProvider<TicketBloc>(
            create: (_) => TicketBloc(repository: ticketRepository)),
        BlocProvider<SalesBloc>(create: (_) => SalesBloc(salesRepository)),
      ],
      child: const BottomNavigationScreen(),
    );
  }
}
