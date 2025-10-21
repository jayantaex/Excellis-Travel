import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/network/api_client.dart';
import 'apis/auth_api.dart';
import 'bloc/auth_bloc.dart';
import 'data/auth_repository.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/registration_screen.dart';

class AuthModule {
  static String loginPath = '/login';
  static String registerPath = '/register';
  static String loginName = 'auth';
  static String registerName = 'register';

  static Widget loginBuilder() {
    final AuthRepository authRepository = AuthRepository(
      authApi: AuthApi(
        apiClient: ApiClient(),
      ),
    );
    return BlocProvider(
        create: (_) => AuthBloc(authRepository: authRepository),
        child: const LoginScreen());
  }

  static Widget registerBuilder() {
    final AuthRepository authRepository = AuthRepository(
      authApi: AuthApi(
        apiClient: ApiClient(),
      ),
    );
    return BlocProvider(
        create: (_) => AuthBloc(authRepository: authRepository),
        child: const RegistrationScreen());
  }
}
