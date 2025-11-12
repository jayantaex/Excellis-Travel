import '../../../core/common/models/profile_data_model.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';

class ProfileManagementApi {
  final ApiClient apiClient;
  ProfileManagementApi({required this.apiClient});

  Future<ApiResponse<ProfileModel>> fetchUserProfile() async {
    return await apiClient.getRequest(
      endPoint: EndPoints.profile,
      fromJson: (jsonData) {
        return ProfileModel.fromJson(jsonData['data']);
      },
    );
  }

  Future<ApiResponse<ProfileModel>> updateProfile(
      {required Map<String, dynamic> body}) async {
    return await apiClient.putRequest(
      endPoint: EndPoints.profile,
      reqModel: body,
      fromJson: (jsonData) {
        return ProfileModel.fromJson(jsonData['data']);
      },
    );
  }
}
