import '../../../core/network/api_response.dart';
import '../apis/profile_management_api.dart';

class ProfileManagementRepository {
  final ProfileManagementApi profileManagementApi;
  ProfileManagementRepository({required this.profileManagementApi});

  Future<ApiResponse<String>> getUserProfile(String token) async {
    return await profileManagementApi.fetchUserProfile(token);
  }
}
