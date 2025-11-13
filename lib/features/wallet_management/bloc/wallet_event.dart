part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => <Object>[];
}

final class LoadWallet extends WalletEvent {
  const LoadWallet({required this.userId});
  final String userId;
}

final class LoadTransactions extends WalletEvent {
  const LoadTransactions({required this.userId});
  final String userId;
}

final class SuccessPaymentEvent extends WalletEvent {
  const SuccessPaymentEvent({required this.txnId});
  final String txnId;
}

final class PaymentFailureEvent extends WalletEvent {
  const PaymentFailureEvent({required this.txnId});
  final String txnId;
}
