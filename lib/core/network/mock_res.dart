import 'api_response.dart';

Future<ApiResponse<T>> mockSuccess<T>({required T data}) async {
  await Future.delayed(const Duration(seconds: 1), () {});
  return ApiResponse<T>(data: data, statusCode: 200);
}

Future<ApiResponse<T>> mockError<T>({required String errorMessage}) async =>
    ApiResponse<T>(errorMessage: errorMessage, statusCode: 400);
