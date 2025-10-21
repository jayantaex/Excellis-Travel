part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();
  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

final class WalletLoading extends WalletState {}

final class WalletLoaded extends WalletState {
  final double balance;
  const WalletLoaded({required this.balance});
}

final class WalletError extends WalletState {
  final String message;
  const WalletError({required this.message});
}

final class TransactionsLoading extends WalletState {}

final class TransactionsLoaded extends WalletState {
  final List<String> transactions; // Replace String with your transaction model
  const TransactionsLoaded({required this.transactions});
}

final class TransactionsError extends WalletState {
  final String message;
  const TransactionsError({required this.message});
}

final class PaymentSuccess extends WalletState {
  final String txnId;
  const PaymentSuccess({required this.txnId});
}

final class PaymentFailure extends WalletState {
  final String message;
  const PaymentFailure({required this.message});
}
