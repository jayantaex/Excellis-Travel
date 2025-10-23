
import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';

class AuthApi {
  final ApiClient apiClient;
  AuthApi({required this.apiClient});

  Future<ApiResponse<String>> login(
      {required String username,
      required String password,
      required String fcmToken,
      required String userType}) async {
    return await apiClient.postRequest(
      endPoint: EndPoints.login,
      fromJson: (p0) {
        return p0 as String;
      },
    );
  }

  Future<ApiResponse<void>> register(String username, String password) async {
    return apiClient.postRequest(
      endPoint: EndPoints.registration,
      fromJson: (p0) {
        return;
      },
    );
  }
}
