import '../constants/app_constants.dart';

class MainUrl {
  final String env = "development";

  String getUrl() {
    if (env == "production") {
      return AppConstants.baseUrl;
    } else {
      return 'http://localhost:4000';
    }
  }
}

class EndPoints {
  static var baseUrl = MainUrl().getUrl();
  static const userLogin = '/auth/login';
  static const register = "/users/add";
  static const profile = "/user/me";
  static const updateProfile = "/users";
  //todo
  static const todos = "/todos";
  static const addTodo = "/todos/add";

  // Authentication
  static const login = '/auth/login';
  static const registration = "/auth/registration";
  static const refreshToken = "/auth/refreshToken";
  //Profile
  static const userProfile = "/user";
}
