import 'dart:developer';

import 'package:dio/dio.dart';

class ErrorLoger {
  ErrorLoger() {
    _dio.options.baseUrl = 'http://192.168.0.168:3000';
  }
  final Dio _dio = Dio();
  Future<void> remoteLog({required Map body}) async {
    try {
      await _dio.post('/error', data: body);
    } catch (e) {
      log(e.toString());
    }
  }
}
