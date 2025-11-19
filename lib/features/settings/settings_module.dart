import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import '../auth/apis/auth_api.dart';
import '../auth/bloc/auth_bloc.dart';
import '../auth/data/repository/auth_repository.dart';
import 'presentation/screens/setting_screen.dart';

class SettingsModule {
  static String routePath = '/settings';
  static String routeName = 'settings';
  static Widget builder() {
    final AuthRepository authRepositor =
        AuthRepository(authApi: AuthApi(apiClient: ApiClient()));
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AuthBloc(authRepository: authRepositor)),
    ], child: const SettingScreen());
  }
}
