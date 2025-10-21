

import '../../../core/network/api_response.dart';
import '../api/todo_api.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final TodoApi api;
  TodoRepository({required this.api});
  Future<ApiResponse<TodoDataModel>> fetchTodos(
      {required int limit, int skip = 0}) {
    return api.fetchTodos(limit: limit, skip: skip);
  }

  Future<ApiResponse> addTodo(Map<String, dynamic> data) {
    return api.addTodo(data);
  }

  Future<ApiResponse> deleteTodo(int id) {
    return api.deleteTodo(id);
  }
}
