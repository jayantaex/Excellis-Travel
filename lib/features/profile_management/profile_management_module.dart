import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/common/api/location_api.dart';
import '../../core/common/bloc/cities/city_bloc.dart';
import '../../core/common/bloc/states/states_bloc.dart';
import '../../core/common/data/location_repository.dart';
import '../../core/network/api_client.dart';
import 'data/data_source/profile_management_remote_src.dart';
import 'bloc/profile_bloc.dart';
import 'data/repository/profile_management_repository.dart';
import 'presentation/screens/edit_profile_screen.dart';
import 'presentation/screens/my_profile_screen.dart';

class ProfileManagementModule {
  static final ApiClient _apiClient = ApiClient();
  static final ProfileManagementRepository _profileRepository =
      ProfileManagementRepository(
    profileManagementRemoteSrc: ProfileManagementRemoteSrc(
      apiClient: _apiClient,
    ),
  );

  //my profile
  static String myProfileName = 'my_profile';
  static String myProfilePath = '/my_profile';
  static Widget myProfileBuilder(BuildContext context) => BlocProvider.value(
        value: BlocProvider.of<ProfileBloc>(context),
        child: const MyProfileScreen(),
      );

//edit profile
  static String editProfilePath = '/edit_profile';
  static String editProfileName = 'edit_profile';

  static Widget editProfileBuilder(BuildContext context, GoRouterState state) =>
      MultiBlocProvider(
        providers: [
          if (state.extra is ProfileBloc)
            BlocProvider<ProfileBloc>.value(
              value: state.extra as ProfileBloc,
            )
          else
            BlocProvider<ProfileBloc>(
              create: (_) => ProfileBloc(
                profileRepository: _profileRepository,
              ),
            ),
          BlocProvider<StatesBloc>(
            create: (_) => StatesBloc(
                repository: LocationRepository(
                    statesApi: LocationApi(apiClient: _apiClient))),
          ),
          BlocProvider<CityBloc>(
            create: (_) => CityBloc(
                repository: LocationRepository(
                    statesApi: LocationApi(apiClient: _apiClient))),
          )
        ],
        child: const EditProfileScreen(),
      );
}
