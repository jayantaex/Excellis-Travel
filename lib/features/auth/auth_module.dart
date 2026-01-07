import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/api/location_api.dart';
import '../../core/common/bloc/cities/city_bloc.dart';
import '../../core/common/bloc/states/states_bloc.dart';
import '../../core/common/data/location_repository.dart';
import '../../core/network/api_client.dart';
import 'bloc/auth_bloc.dart';
import 'data/repository/auth_repository.dart';
import 'data/data_source/auth_remote_data_src.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/registration_screen.dart';

class AuthModule {
  //login
  static String loginPath = '/login';
  static String loginName = 'login';
  static Widget loginBuilder() {
    final ApiClient apiClient = ApiClient();
    final AuthRemoteDataSrc authRemoteDataSrc =
        AuthRemoteDataSrc(apiClient: apiClient);
    final AuthRepository authRepository =
        AuthRepository(authRemoteDataSrc: authRemoteDataSrc);
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
    final AuthRemoteDataSrc authRemoteDataSrc =
        AuthRemoteDataSrc(apiClient: apiClient);
    final AuthRepository authRepository =
        AuthRepository(authRemoteDataSrc: authRemoteDataSrc);
    final LocationApi statesApi = LocationApi(apiClient: apiClient);
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
