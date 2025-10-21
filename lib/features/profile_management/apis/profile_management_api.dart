import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';

class ProfileManagementApi {
  final ApiClient apiClient;
  ProfileManagementApi({required this.apiClient});

  Future<Future<ApiResponse<String>>> fetchUserProfile(String token) async {
    return apiClient.getRequest(
      endPoint: '/profile',
      fromJson: (p0) {
        return p0 as String;
      },
    );
  }
}
