import 'dart:developer';

import 'package:excellistravel/core/network/api_urls.dart';

import '../../../core/models/profile_data_model.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';

class ProfileManagementApi {
  final ApiClient apiClient;
  ProfileManagementApi({required this.apiClient});

  Future<ApiResponse<ProfileModel>> fetchUserProfile(String token) async {
    return apiClient.getRequest(
      endPoint: EndPoints.profile,
      fromJson: (jsonData) {
        log('json data $jsonData');
        return ProfileModel.fromJson(jsonData['data']);
      },
    );
  }

  Future<ApiResponse<void>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
  }) async {
    Map<String, dynamic> body = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "address": address
    };
    return apiClient.putRequest(
      endPoint: EndPoints.profile,
      fromJson: (jsonData) {},
    );
  }
}
