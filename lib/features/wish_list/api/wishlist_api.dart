import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/api_urls.dart';

class WishlistApi {
  WishlistApi({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<String>> getWishlist() async => await apiClient.getRequest(
        endPoint: EndPoints.wishList,
        fromJson: (Map<String, dynamic> p0) => p0 as String,
      );

  Future<ApiResponse<String>> addToWishList() async =>
      await apiClient.postRequest(
        endPoint: EndPoints.wishList,
        fromJson: (Map<String, dynamic> p0) => p0 as String,
      );

  Future<ApiResponse<String>> removeFromWishList() async =>
      await apiClient.deleteRequest(
        endPoint: EndPoints.wishList,
        fromJson: (Map<String, dynamic> p0) => p0 as String,
      );
}
