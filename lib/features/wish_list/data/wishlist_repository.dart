import '../../../core/network/api_response.dart';
import '../api/wishlist_api.dart';

class WishlistRepository {
  WishlistRepository(this.wishlistApi);
  final WishlistApi wishlistApi;

  Future<ApiResponse<String>> getWishlist() => wishlistApi.getWishlist();

  Future<ApiResponse<String>> addToWishList() => wishlistApi.addToWishList();

  Future<ApiResponse<String>> removeFromWishList() =>
      wishlistApi.removeFromWishList();
}
