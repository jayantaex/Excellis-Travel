part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class GetWishListEvent extends WishlistEvent {}

class AddToWishListEvent extends WishlistEvent {
  final String ticketId;
  const AddToWishListEvent({required this.ticketId});
}

class RemoveFromWishListEvent extends WishlistEvent {
  final String ticketId;
  const RemoveFromWishListEvent({required this.ticketId});
}
