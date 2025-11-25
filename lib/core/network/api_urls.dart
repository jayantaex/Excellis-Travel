import '../constants/app_constants.dart';

class MainUrl {
  final String env = 'development';

  String getUrl() {
    if (env == 'production') {
      return AppConstants.baseUrl;
    } else {
      return 'https://api.excellistravel.com';
    }
  }

  String getAmaduesUrl() {
    if (env == 'production') {
      return AppConstants.amaduesUrl;
    } else {
      return 'https://test.api.amadeus.com';
    }
  }
}

class EndPoints {
  static String baseUrl = MainUrl().getUrl();
  static String amaduesBaseUrl = MainUrl().getAmaduesUrl();
  // Authentication
  static const String login = '/auth/login';
  static const String registration = '/auth/register';
  static const String refreshToken = '/auth/refresh-token';
  static const String resetPassword = '/auth/change-password';
  static const String sendRecoverLink = '/auth/request-password-reset';

  //location - state
  static const String state = '/location/states?limit=1000';
  static const String cities = '/location/cities?limit=1000000';
  //wish -list
  static const String wishList = '/wish-list';
  //Profile
  static const String profile = '/auth/profile';
  static const String updateProfileImage = '/auth/profile/upload-image';
  //payment verify
  static const String createPayment = '/bookings/create-payment';
  static const String verifyPayment = '/bookings/verify-payment';
  //markup pricing
  static const String markupPricing = '/markups/calculate-markup';
  static const String myMarkup = '/markups/user';

  //ticket
  static const String ticket = '/bookings/filtered-auto';
  static const String downloadFile = '/bookings';

  //amadues
  static const String amaduesAccessToken = '/v1/security/oauth2/token';
  static const String airportSearchByKeyword = '/v1/reference-data/locations';
  static const String flightSearch = '/v2/shopping/flight-offers';
  static const String flightOfferPrice = '/v1/shopping/flight-offers/pricing';

  static const String sales = '/commissions/transactions-auto';
  //markup
  static const String markup = '/markups';
}
