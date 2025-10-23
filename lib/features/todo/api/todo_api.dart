import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/todo_model.dart';

class TodoApi {
  final ApiClient _client;
  TodoApi(this._client);

  Future<ApiResponse<TodoDataModel>> fetchTodos(
      {required int limit, int skip = 0}) {
    return _client.getRequest(
      endPoint: EndPoints.todos,
      queryParameters: {'limit': limit, 'skip': skip},
      fromJson: (json) => TodoDataModel.fromJson(json),
    );
  }

  Future<ApiResponse> addTodo(Map<String, dynamic> data) {
    return _client.postRequest(
      endPoint: EndPoints.addTodo,
      reqModel: data,
      fromJson: (json) => json,
    );
  }

  // Future<ApiResponse> deleteTodo(int id) {
  //   return _client.deleteRequest(
  //     endPoint: '${EndPoints.todos}/$id',
  //     queryParameters: null,
  //   );
  // }
}
