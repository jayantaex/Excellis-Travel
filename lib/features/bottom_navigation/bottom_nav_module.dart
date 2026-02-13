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

  // Shared instances — created once, reused on every navigation
  static final ApiClient _apiClient = ApiClient();
  static final TicketsRepository ticketRepository = TicketsRepository(
      ticketRemoteDataSrc: TicketRemoteDataSrc(apiClient: _apiClient),
      ticketLocalDataSrc: TicketLocalDataSrc());
  static final ProfileManagementRemoteSrc _profileApi =
      ProfileManagementRemoteSrc(apiClient: _apiClient);
  static final ProfileManagementRepository _profileRepo =
      ProfileManagementRepository(profileManagementRemoteSrc: _profileApi);
  static final SalesApi _salesApi = SalesApi(_apiClient);
  static final SalesRepository _salesRepository = SalesRepository(_salesApi);

  static Widget builder() => MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc(profileRepository: _profileRepo),
          ),
          BlocProvider<TicketBloc>(
              create: (_) => TicketBloc(repository: ticketRepository)),
          BlocProvider<SalesBloc>(create: (_) => SalesBloc(_salesRepository)),
        ],
        child: const BottomNavigationScreen(),
      );
}
