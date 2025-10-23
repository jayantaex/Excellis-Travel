import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';

class WishlistApi {
  final ApiClient apiClient;
  WishlistApi({required this.apiClient});

  Future<ApiResponse<String>> getWishlist() async {
    return await apiClient.getRequest(
      endPoint: EndPoints.wishList,
      fromJson: (p0) {
        return p0 as String;
      },
    );
  }

  Future<ApiResponse<String>> addToWishList() async {
    return await apiClient.postRequest(
      endPoint: EndPoints.wishList,
      fromJson: (p0) {
        return p0 as String;
      },
    );
  }
}
