import 'dart:developer';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../data/models/auth_resp_model.dart';

class AuthApi {
  AuthApi({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<AuthResponseModel>> login(
      {required String username,
      required String password,
      required String fcmToken,
      required String userType}) async {
    final Map<String, dynamic> data = <String, dynamic>{
      'email': username,
      'password': password,
      'fcmToken': fcmToken,
      'userType': userType,
      'expiresInMins': 1
    };
    return await apiClient.postRequest(
      endPoint: EndPoints.login,
      reqModel: data,
      fromJson: (Map<String, dynamic> jsonData) =>
          AuthResponseModel.fromJson(jsonData),
    );
  }

  Future<ApiResponse<AuthResponseModel>> register({
    String? companyName,
    required String firstName,
    required String lastName,
    String? panNumber,
    required String email,
    required String phone,
    required String role,
    required String officeAddress,
    required String pinCode,
    required String state,
    required String city,
    required String nearByAirport,
    required String gstNumber,
    required String aadhaarNumber,
    required String password,
    required int commissionRate,
    required bool isDirectBooking,
  }) async {
    log('role $role');
    final Map<String, dynamic> body = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'role': role == 'retailer' ? 'sales_executive' : 'sales_executive',
      'phone': phone,
      'address':
          '${officeAddress.trim()}, ${city.trim().trim()}, ${state.trim()}, ${pinCode.trim()}',
      'commissionRate': commissionRate,
      'isDirectBooking': isDirectBooking
    };

    return apiClient.postRequest(
      endPoint: EndPoints.registration,
      reqModel: body,
      fromJson: (Map<String, dynamic> jsonData) =>
          AuthResponseModel.fromJson(jsonData),
    );
  }

  Future<ApiResponse<bool>> resetPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };

    return apiClient.postRequest(
      endPoint: EndPoints.resetPassword,
      reqModel: body,
      fromJson: (Map<String, dynamic> jsonData) => jsonData['success'] ?? false,
    );
  }

  Future<ApiResponse<bool>> sendRecoverLink({required String email}) async {
    final Map<String, String> body = <String, String>{
      'email': email,
    };

    return apiClient.postRequest(
      endPoint: EndPoints.sendRecoverLink,
      reqModel: body,
      fromJson: (Map<String, dynamic> jsonData) => jsonData['success'] ?? false,
    );
  }
}
