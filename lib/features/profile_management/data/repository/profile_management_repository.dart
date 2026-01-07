import 'dart:io';

import '../../../../core/common/models/profile_data_model.dart';
import '../../../../core/network/api_response.dart';
import '../data_source/profile_management_remote_src.dart';

class ProfileManagementRepository {
  ProfileManagementRepository({required this.profileManagementRemoteSrc});
  final ProfileManagementRemoteSrc profileManagementRemoteSrc;

  Future<ApiResponse<ProfileModel>> getUserProfile() async =>
      await profileManagementRemoteSrc.fetchUserProfile();

  Future<ApiResponse<ProfileModel>> updateProfile(
      {required Map<String, dynamic> body}) async {
    final res = await profileManagementRemoteSrc.updateProfile(body: body);
    return res;
  }

  Future<ApiResponse<bool>> updateProfileImage({File? imageFile}) async {
    final res =
        await profileManagementRemoteSrc.updateProfileImage(imageFile: imageFile);
    return res;
  }
}
