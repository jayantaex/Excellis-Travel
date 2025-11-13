import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/storage_service.dart';
import 'api_response.dart';
import 'api_urls.dart';
import 'authentication_interceptor.dart';

class ApiClient {
  factory ApiClient() => _instance;
  ApiClient._internal() {
    _dio.options.baseUrl = EndPoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
      final String? token = await StorageService.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    }, onError: (DioException e, ErrorInterceptorHandler handler) {
      if (e.response?.statusCode == 401) {}
      return handler.next(e);
    }));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));
    _dio.interceptors.add(AuthenticationInterceptor(_dio));
  }
  //single instance
  static final ApiClient _instance = ApiClient._internal();
  final Dio _dio = Dio();

  // API request method GET
  Future<ApiResponse<T>> getRequest<T>(
      {required String endPoint,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
          await _dio.get(endPoint, queryParameters: queryParameters);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      final String errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method GET for List
  Future<ApiResponse<List<T>>> getRequestList<T>(
      {required String endPoint,
      required List<T> Function(List<dynamic>) fromJosnList,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
          await _dio.get(endPoint, queryParameters: queryParameters);
      final List<T> data = fromJosnList(response.data);
      return ApiResponse<List<T>>(
          data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      final String errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<List<T>>(
          statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method POST
  Future<ApiResponse<T>> postRequest<T>(
      {required String endPoint,
      Map<String, dynamic>? reqModel,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final Response response = await _dio.post(endPoint, data: reqModel);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      return ApiResponse<T>(
          statusCode: statusCode, errorMessage: _handleDioError(e, statusCode));
    }
  }

  // API request method POST for List
  Future<ApiResponse<List<T>>> postRequestList<T>(
      {required String endPoint,
      Map<String, dynamic>? reqModel,
      required List<T> Function(List<dynamic>) fromJsonList}) async {
    try {
      final Response response = await _dio.post(endPoint, data: reqModel);
      final List<T> data = fromJsonList(response.data);
      return ApiResponse<List<T>>(
          data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      final String errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<List<T>>(
          statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method PUT
  Future<ApiResponse<T>> putRequest<T>(
      {required String endPoint,
      Map<String, dynamic>? reqModel,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final Response response = await _dio.put(endPoint, data: reqModel);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      final String errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method DELETE
  Future<ApiResponse<T>> deleteRequest<T>(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final Response response =
          await _dio.delete(endPoint, queryParameters: queryParameters);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final int statusCode = e.response?.statusCode ?? 0;
      final String errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method for uploading images
  Future<ApiResponse<T>> uploadImage<T>({
    required String endPoint,
    File? imageFile, // Make this nullable
    Map<String, dynamic>? reqModel,
    required T Function(Map<String, dynamic>) fromJson,
    required String imageFieldName,
  }) async {
    try {
      // Prepare the form data
      final Map<String, dynamic> formDataMap = <String, dynamic>{
        ...?reqModel
      }; // Spread reqModel if it's not null

      // If imageFile is provided, add it to the form data
      if (imageFile != null) {
        final String fileName = imageFile.path.split('/').last;
        formDataMap[imageFieldName] =
            await MultipartFile.fromFile(imageFile.path, filename: fileName);
      }

      final FormData formData = FormData.fromMap(formDataMap);

      // Make the POST request
      final Response response = await _dio.post(endPoint, data: formData);

      // Parse the response
      final responseData = fromJson(response.data);

      return ApiResponse<T>(
        data: responseData,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      // Handle Dio errors
      final int statusCode = e.response?.statusCode ?? 0;
      final String errorMessage = _handleDioError(e, statusCode);

      return ApiResponse<T>(
        statusCode: statusCode,
        errorMessage: errorMessage,
      );
    }
  }

  // Handle Dio errors and return a user-friendly message
  String _handleDioError(DioException error, int statusCode) {
    String errorMessage;
    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(statusCode);
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'please check your connection';
        break;
      case DioExceptionType.unknown:
        errorMessage =
            'Connection to API server failed due to internet connection';
        break;
      default:
        errorMessage = 'Unexpected error occurred';
        break;
    }
    return errorMessage;
  }

  // Handle different status codes and return appropriate messages
  String _handleStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad Request 22';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 500:
        return 'Internal Server Error';
      case 503:
        return 'Service Unavailable';
      default:
        return 'Recive invalid status code $statusCode';
    }
  }
}
