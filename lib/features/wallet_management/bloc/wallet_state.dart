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
