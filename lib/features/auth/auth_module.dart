import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/api/location_api.dart';
import '../../core/common/bloc/cities/city_bloc.dart';
import '../../core/common/bloc/states/states_bloc.dart';
import '../../core/common/data/location_repository.dart';
import '../../core/network/api_client.dart';
import 'apis/auth_api.dart';
import 'bloc/auth_bloc.dart';
import 'data/auth_repository.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/registration_screen.dart';

class AuthModule {
  //login
  static String loginPath = '/login';
  static String loginName = 'login';
  static Widget loginBuilder() {
    final ApiClient apiClient = ApiClient();
    final AuthApi api = AuthApi(apiClient: apiClient);
    final AuthRepository authRepository = AuthRepository(authApi: api);
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(authRepository: authRepository),
      child: Builder(builder: (BuildContext context) => const LoginScreen()),
    );
  }

//registration
  static String registerPath = '/register';
  static String registerName = 'register';
  static Widget registerBuilder() {
    final ApiClient apiClient = ApiClient();
    final AuthApi api = AuthApi(apiClient: apiClient);
    final LocationApi statesApi = LocationApi(apiClient: apiClient);
    final AuthRepository authRepository = AuthRepository(authApi: api);
    final LocationRepository stateRepository =
        LocationRepository(statesApi: statesApi);
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(authRepository: authRepository),
      ),
      BlocProvider<StatesBloc>(
        create: (_) => StatesBloc(repository: stateRepository),
      ),
      BlocProvider<CityBloc>(
        create: (_) => CityBloc(repository: stateRepository),
      )
    ], child: const RegistrationScreen());
  }
}
