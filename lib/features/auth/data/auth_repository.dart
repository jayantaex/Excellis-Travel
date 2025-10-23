import '../../../core/network/api_response.dart';
import '../apis/auth_api.dart';

class AuthRepository {
  final AuthApi authApi;
  AuthRepository({required this.authApi});

  Future<ApiResponse<String>> login(
      {required String username,
      required String password,
      required String fcmToken,
      required String userType}) async {
    return await authApi.login(
        username: username,
        password: password,
        fcmToken: fcmToken,
        userType: userType);
  }

  Future<ApiResponse<void>> register(String username, String password) async {
    return authApi.register(username, password);
  }
}
