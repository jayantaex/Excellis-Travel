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
    this.transactions,
    this.allTransactions = const [],
    this.pagination,
  });
  final WalletBalanceModel? wallet;
  final bool isLoadingMore;
  final String currentFilter;
  final TransactionDataModel? transactions;
  final List<Datam> allTransactions;
  final Pagination? pagination;

  WalletLoaded copyWith({
    WalletBalanceModel? wallet,
    bool? isLoadingMore,
    String? currentFilter,
    TransactionDataModel? transactions,
    List<Datam>? allTransactions,
    Pagination? pagination,
    bool clearTransactions = false,
  }) =>
      WalletLoaded(
        wallet: wallet ?? this.wallet,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        currentFilter: currentFilter ?? this.currentFilter,
        transactions: transactions ?? this.transactions,
        allTransactions: clearTransactions
            ? (allTransactions ?? [])
            : (allTransactions ?? this.allTransactions),
        pagination: pagination ?? this.pagination,
      );

  @override
  List<Object?> get props => [
        wallet,
        isLoadingMore,
        currentFilter,
        allTransactions,
        pagination,
      ];
}

/// Error state
class WalletError extends WalletState {
  const WalletError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

//deposit
class InitDiposit extends WalletState {
  const InitDiposit({
    required this.description,
    required this.amount,
    required this.mobile,
    required this.email,
    required this.onRetryRoute,
  });
  final String description;
  final int amount;
  final String mobile;
  final String email;
  final String onRetryRoute;
}

class DepositSuccess extends WalletState {
  const DepositSuccess({
    this.message = 'Deposit request submitted successfully',
  });
  final String message;

  @override
  List<Object?> get props => [message];
}

class DepositError extends WalletState {
  const DepositError({required this.message});
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
