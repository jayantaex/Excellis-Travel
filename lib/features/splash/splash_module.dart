import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import '../profile_management/data/source/profile_management_remote_src.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/repository/profile_management_repository.dart';
import 'screens/splash_screen.dart';

class SplashModule {
  static String splashRoute = '/';
  static String spashName = 'Splash';
  static Widget builder() {
    final ApiClient apiClient = ApiClient();
    final ProfileManagementRemoteSrc profileApi =
        ProfileManagementRemoteSrc(apiClient: apiClient);
    final ProfileManagementRepository repository =
        ProfileManagementRepository(profileManagementRemoteSrc: profileApi);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) =>
              ProfileBloc(profileRepository: repository),
        ),
      ],
      child: const SplashScreen(),
    );
  }
}
