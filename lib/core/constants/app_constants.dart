import 'package:flutter/foundation.dart';

class AppConstants {
  // API
  static const String baseUrl = 'https://dummyjson.com';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String isFirstTimeKey = 'is_first_time';

  // App Info
  static const String appName = 'Flutter Starter';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // payment gateway credentials [razorpay]
  static const String razorpayKey = kDebugMode ? 'rzp_test_1DP5mmOlF5G5ag' : '';
  static const String razorpaySecret = kDebugMode ? '12345678' : '';
  static const String razorpayUserName = 'Excellis Travel';

  //assetUrl
  static const String assetImageUrl = 'assets/images/';
  static const String assetIcontUrl = 'assets/icons/';
  static const String imageNotFound = 'assets/images/image_not_found.png';

  //Legality
  static const String privacyPolicy = 'https://github.com/';
  static const String termsAndConditions = 'https://github.com/';
}
