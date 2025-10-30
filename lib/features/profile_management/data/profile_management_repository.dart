
import '../../../core/common/models/profile_data_model.dart';
import '../../../core/network/api_response.dart';
import '../apis/profile_management_api.dart';

class ProfileManagementRepository {
  final ProfileManagementApi profileManagementApi;
  ProfileManagementRepository({required this.profileManagementApi});

  Future<ApiResponse<ProfileModel>> getUserProfile() async {
    return await profileManagementApi.fetchUserProfile();
  }

  Future<ApiResponse<ProfileModel>> updateProfile(
      {required Map<String, dynamic> body}) async {
    final res = await profileManagementApi.updateProfile(body: body);
    return res;
  }
}
