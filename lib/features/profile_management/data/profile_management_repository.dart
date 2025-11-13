import '../../../core/common/models/profile_data_model.dart';
import '../../../core/network/api_response.dart';
import '../apis/profile_management_api.dart';

class ProfileManagementRepository {
  ProfileManagementRepository({required this.profileManagementApi});
  final ProfileManagementApi profileManagementApi;

  Future<ApiResponse<ProfileModel>> getUserProfile() async =>
      await profileManagementApi.fetchUserProfile();

  Future<ApiResponse<ProfileModel>> updateProfile(
      {required Map<String, dynamic> body}) async {
    final res = await profileManagementApi.updateProfile(body: body);
    return res;
  }
}
