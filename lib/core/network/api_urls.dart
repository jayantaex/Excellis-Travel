import '../constants/app_constants.dart';

class MainUrl {
  final String env = "development";

  String getUrl() {
    if (env == "production") {
      return AppConstants.baseUrl;
    } else {
      return 'https://dummyjson.com';
    }
  }
}

class EndPoints {
  static var baseUrl = MainUrl().getUrl();
  static const userLogin = '/auth/login';
  static const register = "/users/add";
  static const profile = "/auth/me";
  static const updateProfile = "/users";
  //todo
  static const todos = "/todos";
  static const addTodo = "/todos/add";

  // Authentication
  static const login = '/auth/login';
  static const registration = "/auth/registration";
  static const refreshToken = "/auth/refresh";
  //wish -list
  static const wishList = "/wish-list";
  //Profile
  static const userProfile = "/user/me";
  //airport
  static const airportSearch = "/v1/reference-data/locations";
  
}
