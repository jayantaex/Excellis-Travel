import 'package:excellistravel/core/common/bloc/cities/city_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/api/location_api.dart';
import '../../core/common/bloc/states/states_bloc.dart';
import '../../core/common/data/location_repository.dart';
import '../../core/network/api_client.dart';
import 'apis/profile_management_api.dart';
import 'bloc/profile_bloc.dart';
import 'data/profile_management_repository.dart';
import 'presentation/screens/city_search.dart';
import 'presentation/screens/edit_profile_screen.dart';
import 'presentation/screens/my_profile_screen.dart';

class ProfileManagementModule {
  static final ApiClient _apiClient = ApiClient();
  static final ProfileManagementRepository _profileRepository =
      ProfileManagementRepository(
    profileManagementApi: ProfileManagementApi(
      apiClient: _apiClient,
    ),
  );

  static final LocationRepository _sateRepository =
      LocationRepository(statesApi: LocationApi(apiClient: _apiClient));
  //my profile
  static String myProfileName = 'my_profile';
  static String myProfilePath = '/my_profile';
  static Widget myProfileBuilder() {
    return BlocProvider(
      create: (_) => ProfileBloc(profileRepository: _profileRepository),
      child: MyProfileScreen(),
    );
  }

//edit profile
  static String editProfilePath = '/edit_profile';
  static String editProfileName = 'edit_profile';

  static Widget editProfileBuilder() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProfileBloc(
            profileRepository: _profileRepository,
          ),
        ),
        BlocProvider(
          create: (_) => StatesBloc(repository: _sateRepository),
        ),
        BlocProvider(
          create: (_) => CityBloc(repository: _sateRepository),
        )
      ],
      child: const EditProfileScreen(),
    );
  }

  static String citySearchName = 'city_search';
  static String citySeacrRoute = '/city-search';
  static Widget citySearchBuilder(contex, state) {
    String stateCode = state.extra['stateCode'];
    String stateName = state.extra['stateName'];
    int stateId = state.extra['stateId'];

    return CitySearch(
      stateCode: stateCode,
      stateName: stateName,
      stateId: stateId,
    );
  }
}
