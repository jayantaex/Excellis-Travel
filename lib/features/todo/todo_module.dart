import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import 'api/todo_api.dart';
import 'bloc/bloc/todo_bloc.dart';
import 'data/todo_repository.dart';
import 'presentation/screens/add_todo.dart';

class TodoModule {
  static String todoListRouteName = 'todo_list';
  static String todoListRoutePath = '/todo_list';
  static String addTodoName = 'add_todo';
  static String addTodoPath = '/add_todo/:userId';
  static Widget addTodoBuilder({required int userId}) {
    final api = ApiClient();
    final todoApi = TodoApi(api);
    final repo = TodoRepository(api: todoApi);
    return BlocProvider(
      create: (_) => TodoBloc(repo),
      child: AddTodo(
        userId: userId,
      ),
    );
  }
}
