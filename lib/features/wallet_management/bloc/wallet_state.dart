part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class WalletInitial extends WalletState {}

/// Loading state
class WalletLoading extends WalletState {
  const WalletLoading({
    this.wallet,
    this.currentFilter = 'all',
    this.transactions,
    this.isLoadingMore = false,
  });
  final WalletBalanceModel? wallet;
  final String currentFilter;
  final TransactionDataModel? transactions;
  final bool isLoadingMore;
}

/// Loaded state with wallet data
class WalletLoaded extends WalletState {
  // 'all', 'credit', 'debit'

  const WalletLoaded({
    required this.wallet,
    this.currentFilter = 'all',
    this.transactions,
    this.isLoadingMore = false,
  });
  final WalletBalanceModel? wallet;
  final String currentFilter;
  final TransactionDataModel? transactions;
  final bool isLoadingMore;
}

/// Error state
class WalletError extends WalletState {
  const WalletError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

//Recharge

class CreateWalletOrderSuccess extends WalletState {
  const CreateWalletOrderSuccess({
    required this.order,
  });
  final WalletOrderModel order;
}

class CreateWalletOrderError extends WalletState {
  const CreateWalletOrderError({required this.message});
  final String message;
}

class WalletOrderVerified extends WalletState {
  const WalletOrderVerified({
    required this.signature,
    required this.orderId,
    required this.paymentId,
    required this.amount,
    required this.currency,
  });
  final String signature;
  final String orderId;
  final String paymentId;
  final int amount;
  final String currency;
}

class WalletOrderVerifiedError extends WalletState {
  const WalletOrderVerifiedError({required this.message});
  final String message;
}

class RechargeWalletSuccess extends WalletState {}

class RechargeWalletError extends WalletState {
  const RechargeWalletError({required this.message});
  final String message;
}

// Charge money states
class ChargeMoneySubmitting extends WalletState {}

class ChargeMoneySubmitted extends WalletState {
  const ChargeMoneySubmitted({
    this.message = 'Charge money request submitted successfully',
    required this.paymentId,
  });
  final String message;
  final int paymentId;

  @override
  List<Object?> get props => [message];
}

class ChargeMoneyError extends WalletState {
  const ChargeMoneyError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class SubmitWithdrawalSuccess extends WalletState {
  const SubmitWithdrawalSuccess();
}

class SubmitWithdrawalError extends WalletState {
  const SubmitWithdrawalError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class FetchWithdrawalRequestsSuccess extends WalletState {
  const FetchWithdrawalRequestsSuccess({required this.data});
  final WithdrawlRequestDataModel? data;
}

class FetchWithdrawalRequestsError extends WalletState {
  const FetchWithdrawalRequestsError({required this.message});
  final String message;
}

class FetchWithdrawalRequestsLoading extends WalletState {
  const FetchWithdrawalRequestsLoading({this.isLoadingMore = false, this.data});
  final bool isLoadingMore;
  final WithdrawlRequestDataModel? data;
}

class CancelWithdrawalRequestSuccess extends WalletState {
  const CancelWithdrawalRequestSuccess();
}

class CancelWithdrawalRequestError extends WalletState {
  const CancelWithdrawalRequestError({required this.message, this.data});
  final String message;
  final WithdrawlRequestDataModel? data;
}
