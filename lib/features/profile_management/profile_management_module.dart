import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import 'apis/profile_management_api.dart';
import 'bloc/profile_bloc.dart';
import 'data/profile_management_repository.dart';
import 'presentation/screens/edit_profile_screen.dart';
import 'presentation/screens/my_profile_screen.dart';

class ProfileManagementModule {
  static final ProfileManagementRepository _repository =
      ProfileManagementRepository(
    profileManagementApi: ProfileManagementApi(
      apiClient: ApiClient(),
    ),
  );
  //my profile
  static String myProfileName = 'my_profile';
  static String myProfilePath = '/my_profile';
  static Widget myProfileBuilder() {
    return BlocProvider(
      create: (_) => ProfileBloc(profileRepository: _repository),
      child: MyProfileScreen(),
    );
  }

//edit profile
  static String editProfilePath = '/edit_profile';
  static String editProfileName = 'edit_profile';

  static Widget editProfileBuilder() {
    return BlocProvider(
      create: (_) => ProfileBloc(
        profileRepository: _repository,
      ),
      child: const EditProfileScreen(),
    );
  }
}
