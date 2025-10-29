import 'dart:developer';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';
import '../models/auth_resp_model.dart';

class AuthApi {
  final ApiClient apiClient;
  AuthApi({required this.apiClient});

  Future<ApiResponse<AuthResponseModel>> login(
      {required String username,
      required String password,
      required String fcmToken,
      required String userType}) async {
    Map<String, dynamic> data = {
      "email": username,
      "password": password,
      "fcmToken": fcmToken,
      "userType": userType,
      "expiresInMins": 1
    };
    return await apiClient.postRequest(
      endPoint: EndPoints.login,
      reqModel: data,
      fromJson: (jsonData) {
        return AuthResponseModel.fromJson(jsonData);
      },
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
    final Map<String, dynamic> body = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "role": role == 'retailer' ? "sales_executive" : 'sales_executive',
      "phone": phone,
      "address": officeAddress,
      "commissionRate": commissionRate,
      "isDirectBooking": isDirectBooking
    };

    return apiClient.postRequest(
      endPoint: EndPoints.registration,
      reqModel: body,
      fromJson: (jsonData) {
        return AuthResponseModel.fromJson(jsonData);
      },
    );
  }
}
