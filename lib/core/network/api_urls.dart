import '../constants/app_constants.dart';

class MainUrl {
  final String env = "development";

  String getUrl() {
    if (env == "production") {
      return AppConstants.baseUrl;
    } else {
      return 'https://api.excellistravel.com';
    }
  }

  String getAmaduesUrl() {
    if (env == "production") {
      return AppConstants.amaduesUrl;
    } else {
      return 'https://test.api.amadeus.com';
    }
  }
}

class EndPoints {
  static var baseUrl = MainUrl().getUrl();
  static var amaduesBaseUrl = MainUrl().getAmaduesUrl();
  // Authentication
  static const login = '/auth/login';
  static const registration = "/auth/register";
  static const refreshToken = "/auth/refresh-token";

  //location - state
  static const state = "/location/states?limit=1000";
  static const cities = "/location/cities?limit=1000000";
  //wish -list
  static const wishList = "/wish-list";
  //Profile
  static const profile = "/auth/profile";

  //amadues
  static const amaduesAccessToken = "/v1/security/oauth2/token";
  static const airportSearchByKeyword = "/v1/reference-data/locations";
}
//https://test.api.amadeus.com/v1/reference-data/locations?subType=CITY,AIRPORT&keyword=MUC&countryCode=DE