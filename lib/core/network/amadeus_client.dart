import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:excellistravel/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/storage_service.dart';
import 'api_response.dart';
import 'api_urls.dart';

class AmadeusClient {
  //single instance
  static final AmadeusClient _instance = AmadeusClient._internal();
  factory AmadeusClient() => _instance;
  final Dio _dio = Dio();
  AmadeusClient._internal() {
    _dio.options.baseUrl = EndPoints.amaduesBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await StorageService.getAmadeusToken() ?? '';
          log(token, name: "AMADEUS ACCESS TOKEN");
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            try {
              await _refreshAccessToken();
              return handler.resolve(await _retry(e.requestOptions));
            } on DioException catch (e) {
              return handler.reject(e);
            }
            // final res = await _retry(e.requestOptions);
            // return handler.resolve(res);
          }
          return handler.next(e);
        },
      ),
    );

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));
  }

  // API request method GET
  Future<ApiResponse<T>> getRequest<T>(
      {required String endPoint,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endPoint, queryParameters: queryParameters);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method GET for List
  Future<ApiResponse<List<T>>> getRequestList<T>(
      {required String endPoint,
      required List<T> Function(List<dynamic>) fromJosnList,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endPoint, queryParameters: queryParameters);
      final data = fromJosnList(response.data);
      return ApiResponse<List<T>>(
          data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
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
      final response = await _dio.post(endPoint, data: reqModel);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = e.response?.data['message'];
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method POST for List
  Future<ApiResponse<List<T>>> postRequestList<T>(
      {required String endPoint,
      Map<String, dynamic>? reqModel,
      required List<T> Function(List<dynamic>) fromJsonList}) async {
    try {
      final response = await _dio.post(endPoint, data: reqModel);
      final data = fromJsonList(response.data);
      return ApiResponse<List<T>>(
          data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
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
      final response = await _dio.put(endPoint, data: reqModel);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // API request method DELETE
  Future<ApiResponse<T>> deleteRequest<T>(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final response =
          await _dio.delete(endPoint, queryParameters: queryParameters);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      final errorMessage = _handleDioError(e, statusCode);
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
    }
  }

  // Handle Dio errors and return a user-friendly message
  String _handleDioError(DioException error, int statusCode) {
    String errorMessage;
    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(statusCode);
        break;
      case DioExceptionType.connectionError:
        errorMessage = "please check your connection";
        break;
      case DioExceptionType.unknown:
        errorMessage =
            "Connection to API server failed due to internet connection";
        break;
      default:
        errorMessage = "Unexpected error occurred";
        break;
    }
    return errorMessage;
  }

  // Handle different status codes and return appropriate messages
  String _handleStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request 22";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 500:
        return "Internal Server Error";
      case 503:
        return "Service Unavailable";
      default:
        return "Recive invalid status code $statusCode";
    }
  }

  Future<void> _refreshAccessToken() async {
    final Dio _dio = Dio();
    _dio.options.baseUrl = EndPoints.amaduesBaseUrl;
    try {
      String clientId = AppConstants.amadeusClientId;
      String clientSecret = AppConstants.amadeusSecret;
      final data = {
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': 'client_credentials'
      };
      Response response = await _dio.post(EndPoints.amaduesAccessToken,
          data: data,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ));

      if (response.statusCode == 200) {
        String accessToken = response.data['access_token'];
        await StorageService.saveAmadeusToken(accessToken);
      }
    } catch (e) {
      log("Error whicle getting amadeus access token \n Error -> $e",
          name: 'Amadeus Error');
      rethrow;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final updatedHeaders = Map<String, dynamic>.from(requestOptions.headers);

    String newToken = await StorageService.getAmadeusToken() ?? '';
    if (newToken.isEmpty) {
      log('Access token is empty', name: 'Amadeus Error');
    }
    updatedHeaders['Authorization'] = 'Bearer $newToken';

    final options = Options(
      method: requestOptions.method,
      headers: updatedHeaders,
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
