part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishListLoading extends WishlistState {}

final class WishListLoaded extends WishlistState {
  final String wishList;
  const WishListLoaded(this.wishList);
}

final class WishListAdded extends WishlistState {
  final String wishList;
  const WishListAdded(this.wishList);
}

final class WishListRemoved extends WishlistState {
  final String wishList;
  const WishListRemoved(this.wishList);
}

final class WishListError extends WishlistState {
  final String errorMessage;
  const WishListError(this.errorMessage);
}
