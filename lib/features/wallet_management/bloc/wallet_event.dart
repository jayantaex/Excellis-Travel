part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

final class LoadWallet extends WalletEvent {
  final String userId;
  const LoadWallet({required this.userId});
}

final class LoadTransactions extends WalletEvent {
  final String userId;
  const LoadTransactions({required this.userId});
}

final class SuccessPaymentEvent extends WalletEvent {
  final String txnId;
  const SuccessPaymentEvent({required this.txnId});
}

final class PaymentFailureEvent extends WalletEvent {
  final String txnId;
  const PaymentFailureEvent({required this.txnId});
}
