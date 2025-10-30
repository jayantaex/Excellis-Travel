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
}

class EndPoints {
  static var baseUrl = MainUrl().getUrl();
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
  //airport
  static const airportSearch = "/v1/reference-data/locations";
}
