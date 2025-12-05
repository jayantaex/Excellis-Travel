part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class WalletInitial extends WalletState {}

/// Loading state
class WalletLoading extends WalletState {}

/// Loaded state with wallet data
class WalletLoaded extends WalletState {
  // 'all', 'credit', 'debit'

  const WalletLoaded({
    required this.wallet,
    this.isLoadingMore = false,
    this.currentFilter = 'all',
  });
  final WalletBalanceModel? wallet;
  final bool isLoadingMore;
  final String currentFilter;

  WalletLoaded copyWith({
    WalletBalanceModel? wallet,
    bool? isLoadingMore,
    String? currentFilter,
  }) =>
      WalletLoaded(
        wallet: wallet ?? this.wallet,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        currentFilter: currentFilter ?? this.currentFilter,
      );

  @override
  List<Object?> get props => [wallet, isLoadingMore, currentFilter];
}

/// Error state
class WalletError extends WalletState {
  const WalletError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

/// Withdrawal states
class WithdrawalSubmitting extends WalletState {}

class WithdrawalSubmitted extends WalletState {
  const WithdrawalSubmitted({
    this.message = 'Withdrawal request submitted successfully',
  });
  final String message;

  @override
  List<Object?> get props => [message];
}

class WithdrawalError extends WalletState {
  const WithdrawalError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

/// Add money states
class AddMoneyProcessing extends WalletState {}

class AddMoneySuccess extends WalletState {
  const AddMoneySuccess({
    this.message = 'Money added successfully',
  });
  final String message;

  @override
  List<Object?> get props => [message];
}

class AddMoneyError extends WalletState {
  const AddMoneyError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

/// Transaction details states
class TransactionDetailsLoading extends WalletState {}

class TransactionDetailsLoaded extends WalletState {
  const TransactionDetailsLoaded({required this.transaction});
  final TransactionDataModel transaction;

  @override
  List<Object?> get props => [transaction];
}

class TransactionDetailsError extends WalletState {
  const TransactionDetailsError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
