import '../../../core/network/api_response.dart';
import '../apis/auth_api.dart';

class AuthRepository {
  final AuthApi authApi;
  AuthRepository({required this.authApi});

  Future<ApiResponse<String>> login(String username, String password) async {
    return authApi.login(username, password);
  }

  Future<ApiResponse<void>> register(String username, String password) async {
    return authApi.register(username, password);
  }
}
