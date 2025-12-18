import 'dart:async';

import 'package:excellistravel/core/network/api_response.dart';

Future<ApiResponse<T>> mockApiResponse<T>(
    {required bool isError, T? data}) async {
  Future.delayed(const Duration(seconds: 2), () async {
    if (isError) {
      return ApiResponse<T>(
        errorMessage: 'Error from mock api request',
        statusCode: 400,
      );
    }
  });
  return ApiResponse<T>(
    statusCode: 200,
    data: data,
  );
}
