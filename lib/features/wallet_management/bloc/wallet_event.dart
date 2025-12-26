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
}

class FetchWalletTransactionsEvent extends WalletEvent {
  const FetchWalletTransactionsEvent({
    required this.page,
    this.limit = 20,
    this.filterType,
    this.isLoadingMore = false,
    this.previousTransactions,
  });
  final int page;
  final int limit;
  final String? filterType;
  final bool isLoadingMore;
  final List<Datam>? previousTransactions;
}

class FilterTransactionsEvent extends WalletEvent {
  const FilterTransactionsEvent({required this.filterType});
  final String filterType;

  @override
  List<Object?> get props => [filterType];
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

//re-charge

class CreateRechargeOrderEvent extends WalletEvent {
  const CreateRechargeOrderEvent({required this.body});
  final Map<String, dynamic> body;
}

class VerifyWalletOrderEvent extends WalletEvent {
  const VerifyWalletOrderEvent({required this.body});
  final Map<String, dynamic> body;
}

class RechargeWalletEvent extends WalletEvent {
  const RechargeWalletEvent({required this.body});
  final Map<String, dynamic> body;
}

/// Event to submit withdrawal request
class SubmitWithdrawalEvent extends WalletEvent {
  const SubmitWithdrawalEvent({required this.body});
  final Map<String, dynamic> body;

  @override
  List<Object?> get props => [body];
}
