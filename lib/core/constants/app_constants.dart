import 'package:flutter/foundation.dart';

class AppConstants {
  static const String env = 'development';
  // API
  static const String baseUrl = 'https://api.excellistravel.com';
  static const String amaduesUrl = 'https://api.amadeus.com';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String isFirstTimeKey = 'is_first_time';
  static const String amadeusKey = 'amadeus_key';
  static const String flightBox = 'flight_data';

  // App Info
  static const String appName = 'Flutter Starter';
  static const String appVersion = '0.0.0';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // payment gateway credentials [razorpay]
  static const String razorpayKey =
      kDebugMode ? 'rzp_test_BMpADBZwVaESnu' : 'rzp_test_BMpADBZwVaESnu';
  static const String razorpaySecret =
      kDebugMode ? 'pRy84OpHvEyA7m862Dr7b3F7' : 'pRy84OpHvEyA7m862Dr7b3F7';
  static const String razorpayUserName = 'Excellis Travel';

  //amadues api credentials
  static const String amadeusClientId = 'an0lZ3ODCbziRyhA4D3x2KnPbJ301mHp';
  static const String amadeusSecret = 'u6WaWZ0rR0Gt8tFx';

  //assetUrl
  static const String assetImageUrl = 'assets/images/';
  static const String assetIcontUrl = 'assets/icons/';
  static const String imageNotFound = 'assets/images/image_not_found.png';

  //Legality
  static const String privacyPolicy = 'https://github.com/';
  static const String termsAndConditions = 'https://github.com/';
}
