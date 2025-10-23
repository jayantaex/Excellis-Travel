import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    ApiClient apiClient = ApiClient();
    AuthApi api = AuthApi(apiClient: apiClient);
    final AuthRepository authRepository = AuthRepository(authApi: api);
    return BlocProvider(
      create: (_) => AuthBloc(authRepository: authRepository),
      child: Builder(builder: (context) {
        return const LoginScreen();
      }),
    );
  }

//registration
  static String registerPath = '/register';
  static String registerName = 'register';
  static Widget registerBuilder() {
    ApiClient apiClient = ApiClient();
    AuthApi api = AuthApi(apiClient: apiClient);
    final AuthRepository authRepository = AuthRepository(authApi: api);
    return BlocProvider(
      create: (_) => AuthBloc(authRepository: authRepository),
      child: Builder(builder: (context) {
        return const RegistrationScreen();
      }),
    );
  }
}
