// This file contains the ApiResponse class used for handling API responses in the application.
class ApiResponse<T> {

  ApiResponse({this.data, required this.statusCode, this.errorMessage});
  final T? data;
  final int statusCode;
  final String? errorMessage;
}
