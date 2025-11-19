import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import '../profile_management/apis/profile_management_api.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/repository/profile_management_repository.dart';
import 'screens/splash_screen.dart';

class SplashModule {
  static String splashRoute = '/';
  static String spashName = 'Splash';
  static Widget builder() {
    final ApiClient apiClient = ApiClient();
    final ProfileManagementApi profileApi =
        ProfileManagementApi(apiClient: apiClient);
    final ProfileManagementRepository repository =
        ProfileManagementRepository(profileManagementApi: profileApi);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
            create: (BuildContext context) =>
                ProfileBloc(profileRepository: repository)),
      ],
      child: const SplashScreen(),
    );
  }
}
