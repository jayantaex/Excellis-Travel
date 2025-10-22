import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import 'apis/auth_api.dart';
import 'bloc/auth_bloc.dart';
import 'data/auth_repository.dart';
import 'presentation/screens/login_screen.dart';

class AuthModule {
  static String loginPath = '/login';
  static String loginName = 'auth';

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
}
