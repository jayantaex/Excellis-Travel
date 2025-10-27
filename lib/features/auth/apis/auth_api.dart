import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/auth_resp_model.dart';

class AuthApi {
  final ApiClient apiClient;
  AuthApi({required this.apiClient});

  Future<ApiResponse<AuthRespModel>> login(
      {required String username,
      required String password,
      required String fcmToken,
      required String userType}) async {
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "fcmToken": fcmToken,
      "userType": userType
    };
    return await apiClient.postRequest(
      endPoint: EndPoints.login,
      reqModel: data,
      fromJson: (jsonData) {
        return AuthRespModel.fromJson(jsonData);
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
