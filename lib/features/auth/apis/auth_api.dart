

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';

class AuthApi {
  final ApiClient apiClient;
  AuthApi({required this.apiClient});

  Future<ApiResponse<String>> login(String username, String password) async {
    return apiClient.postRequest(
      endPoint: '/login',
      fromJson: (p0) {
        return p0 as String;
      },
    );
  }

  Future<ApiResponse<void>> register(String username, String password) async {
    return apiClient.postRequest(
      endPoint: '/register',
      fromJson: (p0) {
        return null;
      },
    );
  }
}
