import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((WishlistEvent event, Emitter<WishlistState> emit) {
      emit(WishListLoading());
    });

    on<GetWishListEvent>(_handleGetWishListEvent);

    on<AddToWishListEvent>(_handleAddToWishListEvent);

    on<RemoveFromWishListEvent>(_handleRemoveFromWishListEvent);
  }

  Future<void> _handleRemoveFromWishListEvent(
      RemoveFromWishListEvent event, Emitter<WishlistState> emit) async {}

  Future<void> _handleAddToWishListEvent(
      AddToWishListEvent event, Emitter<WishlistState> emit) async {}

  Future<void> _handleGetWishListEvent(
      GetWishListEvent event, Emitter<WishlistState> emit) async {}
}
