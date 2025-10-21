import '../api/wallet_api.dart';

class WalletRepository {
  final WalletApi walletApi;
  WalletRepository({required this.walletApi});
  Future<double> fetchWalletBalance({required String userId}) async {
    final response = await walletApi.getWallet(userId: userId);
    if (response.data != null) {
      return response.data!.availableBalance ?? 0.0;
    } else {
      throw Exception('Failed to load wallet');
    }
  }
}
