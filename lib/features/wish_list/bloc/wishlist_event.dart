part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class GetWishListEvent extends WishlistEvent {}

class AddToWishListEvent extends WishlistEvent {
  const AddToWishListEvent({required this.ticketId});
  final String ticketId;
}

class RemoveFromWishListEvent extends WishlistEvent {
  const RemoveFromWishListEvent({required this.ticketId});
  final String ticketId;
}
