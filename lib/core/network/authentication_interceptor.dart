import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../utils/storage_service.dart';
import 'api_client.dart';
import 'api_urls.dart';

class AuthenticationInterceptor extends Interceptor {
  final Dio _dio;

  AuthenticationInterceptor(this._dio) {
    log('Authentication Interceptor initialized', name: 'Auth-Interceptor');
  }

  bool _isRefreshing = false;
  final List<Function(String)> _tokenQueue = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String? refreshToken = await StorageService.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        await StorageService.clearTokens();
        return handler.next(err);
      }

      // Wait if another refresh is ongoing
      if (_isRefreshing) {
        final completer = Completer<Response>();
        _tokenQueue.add((String newToken) async {
          final response = await _retry(err.requestOptions, newToken);
          completer.complete(response);
        });
        return handler.resolve(await completer.future);
      }

      _isRefreshing = true;
      final newAccessToken = await _refreshAccessToken(refreshToken);
      _isRefreshing = false;

      if (newAccessToken != null) {
        await StorageService.saveTokens(newAccessToken, refreshToken);

        // Retry queued requests
        for (var callback in _tokenQueue) {
          callback(newAccessToken);
        }
        _tokenQueue.clear();

        // Retry the original failed request
        final response = await _retry(err.requestOptions, newAccessToken);
        return handler.resolve(response);
      } else {
        await StorageService.clearTokens();
        return handler.next(err);
      }
    }

    super.onError(err, handler);
  }

  Future<String?> _refreshAccessToken(String refreshToken) async {
    final apiClient = ApiClient();

    try {
      final response = await apiClient.postRequest(
        endPoint: EndPoints.refreshToken,
        reqModel: {
          'refreshToken': refreshToken,
        },
        fromJson: (data) => data['accessToken'] as String,
      );

      if (response.errorMessage != null) {
        log('${response.errorMessage}', name: 'Auth-Interceptor Error');
        return null;
      }

      return response.data;
    } catch (e) {
      log('$e', name: 'Auth-Interceptor Error');
      return null;
    }
  }

  Future<Response> _retry(
      RequestOptions requestOptions, String newToken) async {
    final updatedHeaders = Map<String, dynamic>.from(requestOptions.headers);
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
