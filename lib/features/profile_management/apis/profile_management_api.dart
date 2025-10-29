import 'dart:developer';

import 'package:excellistravel/core/network/api_urls.dart';

import '../../../core/models/profile_data_model.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';

class ProfileManagementApi {
  final ApiClient apiClient;
  ProfileManagementApi({required this.apiClient});

  Future<Future<ApiResponse<ProfileModel>>> fetchUserProfile(
      String token) async {
    return apiClient.getRequest(
      endPoint: EndPoints.profile,
      fromJson: (jsonData) {
        log('json data $jsonData');
        return ProfileModel.fromJson(jsonData['data']);
      },
    );
  }
}
