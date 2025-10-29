import '../../../core/network/api_response.dart';
import '../apis/auth_api.dart';
import '../models/auth_resp_model.dart';

class AuthRepository {
  final AuthApi authApi;
  AuthRepository({required this.authApi});

  Future<ApiResponse<AuthResponseModel>> login(
      {required String username,
      required String password,
      required String fcmToken,
      required String userType}) async {
    return await authApi.login(
        username: username,
        password: password,
        fcmToken: fcmToken,
        userType: userType);
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
    return await authApi.register(
        companyName: companyName,
        firstName: firstName,
        lastName: lastName,
        panNumber: panNumber,
        email: email,
        phone: phone,
        role: role,
        officeAddress: officeAddress,
        pinCode: pinCode,
        state: state,
        city: city,
        nearByAirport: nearByAirport,
        gstNumber: gstNumber,
        aadhaarNumber: aadhaarNumber,
        password: password,
        commissionRate: commissionRate,
        isDirectBooking: isDirectBooking);
  }
}
