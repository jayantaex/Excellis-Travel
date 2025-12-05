part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch wallet data
class FetchWalletEvent extends WalletEvent {
  final int page;
  final int limit;
  final String? filterType; // 'credit', 'debit', or null for all

  const FetchWalletEvent({
    this.page = 1,
    this.limit = 20,
    this.filterType,
  });

  @override
  List<Object?> get props => [page, limit, filterType];
}

/// Event to load more transactions (pagination)
class LoadMoreTransactionsEvent extends WalletEvent {
  final int page;
  final int limit;
  final String? filterType;

  const LoadMoreTransactionsEvent({
    required this.page,
    this.limit = 20,
    this.filterType,
  });

  @override
  List<Object?> get props => [page, limit, filterType];
}

/// Event to filter transactions
class FilterTransactionsEvent extends WalletEvent {
  final String filterType; // 'all', 'credit', 'debit'

  const FilterTransactionsEvent({required this.filterType});

  @override
  List<Object?> get props => [filterType];
}

/// Event to submit withdrawal request
class SubmitWithdrawalEvent extends WalletEvent {
  final WithdrawalRequestModel request;

  const SubmitWithdrawalEvent({required this.request});

  @override
  List<Object?> get props => [request];
}

/// Event to add money to wallet
class AddMoneyEvent extends WalletEvent {
  final double amount;
  final String paymentMethod;
  final Map<String, dynamic>? additionalData;

  const AddMoneyEvent({
    required this.amount,
    required this.paymentMethod,
    this.additionalData,
  });

  @override
  List<Object?> get props => [amount, paymentMethod, additionalData];
}

/// Event to refresh wallet data
class RefreshWalletEvent extends WalletEvent {
  const RefreshWalletEvent();
}

/// Event to get transaction details
class GetTransactionDetailsEvent extends WalletEvent {
  final String transactionId;

  const GetTransactionDetailsEvent({required this.transactionId});

  @override
  List<Object?> get props => [transactionId];
}
