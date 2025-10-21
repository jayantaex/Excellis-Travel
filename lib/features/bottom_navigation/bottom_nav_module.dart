import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import '../profile/api/profile_api.dart';
import '../profile/bloc/profile_bloc.dart';
import '../profile/data/profile_repository.dart';
import '../todo/api/todo_api.dart';
import '../todo/bloc/bloc/todo_bloc.dart';
import '../todo/data/todo_repository.dart';
import 'presentation/screens/bottom_navigation.dart';

class BottomNavModule {
  static const String path = '/bottom_nav';
  static const String name = 'bottom_nav_screen';
  static Widget builder() {
    final apiClient = ApiClient();
    final profileApi = ProfileApi(apiClient);
    final profileRepo = ProfileRepository(profileApi);
    final todoApi = TodoApi(apiClient);
    final todoRepo = TodoRepository(api: todoApi);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProfileBloc(profileRepo),
        ),
        BlocProvider(
          create: (_) => TodoBloc(todoRepo),
        ),
      ],
      child: const BottomNavigationScreen(),
    );
  }
}
