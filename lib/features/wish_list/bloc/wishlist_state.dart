part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => <Object>[];
}

final class WishlistInitial extends WishlistState {}

final class WishListLoading extends WishlistState {}

final class WishListLoaded extends WishlistState {
  const WishListLoaded(this.wishList);
  final String wishList;
}

final class WishListAdded extends WishlistState {
  const WishListAdded(this.wishList);
  final String wishList;
}

final class WishListRemoved extends WishlistState {
  const WishListRemoved(this.wishList);
  final String wishList;
}

final class WishListError extends WishlistState {
  const WishListError(this.errorMessage);
  final String errorMessage;
}
