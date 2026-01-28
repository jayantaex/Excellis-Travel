import 'package:flutter/foundation.dart';

class AppConstants {
  static const String env = 'development';
  static const String baseUrl = 'https://api.excellistravel.com';
  static const String amaduesUrl = 'https://test.api.amadeus.com';
  static String imageKitUrl = 'https://ik.imagekit.io';
  static const String privacyPolicy =
      'https://excellistravel.com/privacypolicy';
  static const String termsAndConditions = 'https://excellistravel.com/terms';

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String isFirstTimeKey = 'is_first_time';
  static const String amadeusKey = 'amadeus_key';
  //hive keys
  static const String flightBox = 'flight_data';
  static String airPortBox = 'air_port_data';

  // App Info
  static const String appName = 'Flutter Starter';
  static const String appVersion = '10.11.0';

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
  static const String amadeusClientId = 'lGkPjtl8HfERmzZvY2CqVS2StiFCyT7f';
  static const String amadeusSecret = 'uiLxN0c50A8hmg3z';

  // Local asset Url
  static const String assetImageUrl = 'assets/images/';
  static const String assetIconUrl = 'assets/icons/';
  static const String imageNotFound = 'assets/images/image_not_found.png';

  static const String airCraftBox = 'air_craft_data';

  static const String passengerBox = 'passenger_data';
}
