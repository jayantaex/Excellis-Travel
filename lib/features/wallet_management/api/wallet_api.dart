import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../model/wallet_model.dart';

class WalletApi {

  WalletApi({required this.apiClient});
  ApiClient apiClient;

  Future<ApiResponse<WalletModel>> getWallet({required String userId}) async {
    final ApiResponse<WalletModel> response = await apiClient.getRequest(
        endPoint: '/c/f3e1-3b85-4f31-99ac',
        fromJson: (Map<String, dynamic> data) => WalletModel.fromJson(data));
    return response;
  }
}
