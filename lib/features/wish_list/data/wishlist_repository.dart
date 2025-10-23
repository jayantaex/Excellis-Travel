import '../../../core/network/api_response.dart';
import '../api/wishlist_api.dart';

class WishlistRepository {
  final WishlistApi wishlistApi;

  WishlistRepository(this.wishlistApi);

  Future<ApiResponse<String>> getWishlist() {
    return wishlistApi.getWishlist();
  }

  Future<ApiResponse<String>> addToWishList() {
    return wishlistApi.addToWishList();
  }

  Future<ApiResponse<String>> removeFromWishList() {
    return wishlistApi.removeFromWishList();
  }
}
