part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object?> get props => [];
}

class FetchWalletEvent extends WalletEvent {
  // 'credit', 'debit', or null for all

  const FetchWalletEvent({
    this.page = 1,
    this.limit = 20,
    this.filterType,
  });
  final int page;
  final int limit;
  final String? filterType;

  @override
  List<Object?> get props => [page, limit, filterType];
}

class FetchWalletTransactionsEvent extends WalletEvent {
  const FetchWalletTransactionsEvent({
    required this.page,
    this.limit = 20,
    this.filterType,
  });
  final int page;
  final int limit;
  final String? filterType;

  @override
  List<Object?> get props => [page, limit, filterType];
}

class FilterTransactionsEvent extends WalletEvent {
  const FilterTransactionsEvent({required this.filterType});
  final String filterType;

  @override
  List<Object?> get props => [filterType];
}

/// Event to submit withdrawal request
class SubmitWithdrawalEvent extends WalletEvent {
  const SubmitWithdrawalEvent({required this.request});
  final WithdrawalRequestModel request;

  @override
  List<Object?> get props => [request];
}

class DepositEvent extends WalletEvent {
  const DepositEvent(
      {required this.amount,
      required this.description,
      required this.mobile,
      required this.email,
      required this.onRetryRoute});
  final int amount;
  final String description;
  final String mobile;
  final String email;
  final String onRetryRoute;
}

class ChargeMoneyEvent extends WalletEvent {
  const ChargeMoneyEvent({
    required this.amount,
    required this.description,
    required this.paymentId,
  });
  final double amount;
  final String description;
  final int paymentId;
}
