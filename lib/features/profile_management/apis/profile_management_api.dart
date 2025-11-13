import '../../../core/common/models/profile_data_model.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';

class ProfileManagementApi {
  ProfileManagementApi({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<ProfileModel>> fetchUserProfile() async =>
      await apiClient.getRequest(
        endPoint: EndPoints.profile,
        fromJson: (jsonData) => ProfileModel.fromJson(jsonData['data']),
      );

  Future<ApiResponse<ProfileModel>> updateProfile(
          {required Map<String, dynamic> body}) async =>
      await apiClient.putRequest(
        endPoint: EndPoints.profile,
        reqModel: body,
        fromJson: (Map<String, dynamic> jsonData) =>
            ProfileModel.fromJson(jsonData['data']),
      );
}
