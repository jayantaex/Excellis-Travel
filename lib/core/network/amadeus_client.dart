import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import '../constants/app_constants.dart';
import '../utils/storage_service.dart';
import 'api_response.dart';
import 'api_urls.dart';

class AmadeusClient {
  factory AmadeusClient() => _instance;
  AmadeusClient._internal() {
    _dio.options.baseUrl = EndPoints.amaduesBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          final String token = await StorageService.getAmadeusToken() ?? '';
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
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
    if (!kReleaseMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    }
  }
  //single instance
  static final AmadeusClient _instance = AmadeusClient._internal();
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
      final errorMessage = e.response?.data['errors'][0]['detail'];
      return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
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

  Future<void> _refreshAccessToken() async {
    final Dio dio = Dio();
    dio.options.baseUrl = EndPoints.amaduesBaseUrl;
    try {
      const String clientId = AppConstants.amadeusClientId;
      const String clientSecret = AppConstants.amadeusSecret;
      final Map<String, String> data = <String, String>{
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': 'client_credentials'
      };
      final Response response = await dio.post(EndPoints.amaduesAccessToken,
          data: data,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ));

      if (response.statusCode == 200) {
        final String accessToken = response.data['access_token'];
        await StorageService.saveAmadeusToken(accessToken);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final Map<String, dynamic> updatedHeaders = Map<String, dynamic>.from(requestOptions.headers);

    String newToken = await StorageService.getAmadeusToken() ?? '';
    if (newToken.isEmpty) {
      await _refreshAccessToken();
      newToken = await StorageService.getAmadeusToken() ?? '';
    }
    updatedHeaders['Authorization'] = 'Bearer $newToken';

    final Options options = Options(
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
