part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();
  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

final class WalletLoading extends WalletState {}

final class WalletLoaded extends WalletState {
  const WalletLoaded({required this.balance});
  final double balance;
}

final class WalletError extends WalletState {
  const WalletError({required this.message});
  final String message;
}

final class TransactionsLoading extends WalletState {}

final class TransactionsLoaded extends WalletState { // Replace String with your transaction model
  const TransactionsLoaded({required this.transactions});
  final List<String> transactions;
}

final class TransactionsError extends WalletState {
  const TransactionsError({required this.message});
  final String message;
}

final class PaymentSuccess extends WalletState {
  const PaymentSuccess({required this.txnId});
  final String txnId;
}

final class PaymentFailure extends WalletState {
  const PaymentFailure({required this.message});
  final String message;
}
