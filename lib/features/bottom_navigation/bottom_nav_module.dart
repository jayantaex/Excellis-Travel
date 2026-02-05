import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import '../booking/data/data_source/ticker_local_data_src.dart';
import '../profile_management/data/source/profile_management_remote_src.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/repository/profile_management_repository.dart';
import '../sales/api/sales_api.dart';
import '../sales/bloc/sales_bloc.dart';
import '../sales/data/repository/sales_repository.dart';
import '../booking/bloc/ticket_bloc.dart';
import '../booking/data/data_source/ticket_remote_data_src.dart';
import '../booking/data/tickets_repository.dart';
import 'presentation/screens/bottom_navigation.dart';

class BottomNavModule {
  static const String path = '/bottom_nav';
  static const String name = 'bottom_nav_screen';
  static final TicketsRepository ticketRepository = TicketsRepository(
      ticketRemoteDataSrc: TicketRemoteDataSrc(apiClient: ApiClient()),
      ticketLocalDataSrc: TicketLocalDataSrc());
  static Widget builder() {
    final ApiClient apiClient = ApiClient();
    final ProfileManagementRemoteSrc profileApi =
        ProfileManagementRemoteSrc(apiClient: apiClient);
    final ProfileManagementRepository profileRepo =
        ProfileManagementRepository(profileManagementRemoteSrc: profileApi);

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
