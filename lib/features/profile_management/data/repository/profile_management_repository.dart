import 'dart:io';

import '../../../../core/common/models/profile_data_model.dart';
import '../../../../core/network/api_response.dart';
import '../../apis/profile_management_api.dart';

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

  Future<ApiResponse<bool>> updateProfileImage({File? imageFile}) async {
    final res =
        await profileManagementApi.updateProfileImage(imageFile: imageFile);
    return res;
  }
}
