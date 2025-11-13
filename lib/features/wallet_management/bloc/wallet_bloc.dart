import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/wallet_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc({required this.respository}) : super(WalletInitial()) {
    on<LoadWallet>(_handleGetWalletEvent);
    on<LoadTransactions>(_handleGetTransactionsEvent);
    on<SuccessPaymentEvent>(_handleGetWalletEvent);
    on<PaymentFailureEvent>(_handlePaymentFailEvent);
  }
  WalletRepository respository;

  FutureOr<void> _handleGetWalletEvent(
      WalletEvent event, Emitter<WalletState> emit) async {
    try {
      emit(WalletLoading());
      final double balance = await respository.fetchWalletBalance(userId: 'userId');
      emit(WalletLoaded(balance: balance));
    } catch (e) {
      emit(WalletError(message: e.toString()));
    }
  }

  FutureOr<void> _handlePaymentFailEvent(
      PaymentFailureEvent event, Emitter<WalletState> emit) async {}

  FutureOr<void> _handleGetTransactionsEvent(
      LoadTransactions event, Emitter<WalletState> emit) async {}
}
