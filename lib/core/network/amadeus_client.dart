import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import '../constants/app_constants.dart';
import '../../utils/storage_service.dart';
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
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
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
          }
          return handler.next(e);
        },
      ),
    );
    if (!kReleaseMode) {
      // Add Pretty Dio Logger for console logs
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }
  //single instance
  static final AmadeusClient _instance = AmadeusClient._internal();
  final Dio _dio = Dio();

  // API request method GET
  Future<ApiResponse<T>> getRequest<T>(
      {required String endPoint,
      Options? options,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.get(endPoint,
          queryParameters: queryParameters, options: options);
      final data = fromJson(response.data);
      return ApiResponse<T>(data: data, statusCode: response.statusCode ?? 0);
    } on DioException catch (e) {
      return ApiResponse<T>(
          statusCode: e.response?.statusCode ?? 0,
          errorMessage: _handleDioError(error: e));
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
      return ApiResponse<T>(
          statusCode: e.response?.statusCode ?? 0,
          errorMessage: _handleDioError(error: e));
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
      return ApiResponse<T>(
          statusCode: e.response?.statusCode ?? 0,
          errorMessage: _handleDioError(error: e));
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
      return ApiResponse<T>(
          statusCode: e.response?.statusCode ?? 0,
          errorMessage: _handleDioError(error: e));
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
    final Map<String, dynamic> updatedHeaders =
        Map<String, dynamic>.from(requestOptions.headers);

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

  String _handleDioError({required DioException error}) {
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
        errorMessage = _getErrorMessage(error);
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

  String _getErrorMessage(DioException error) {
    if (error.response?.statusCode == 502) {
      return 'App under maintenance';
    }
    return error.response?.data['errors']?.first['detail'] ??
        'Something went wrong';
  }
}
