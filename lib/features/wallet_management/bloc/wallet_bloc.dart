import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../data/models/transaction_model.dart';
import '../data/models/wallet_model.dart';
import '../data/models/withdrawal_request_model.dart';
import '../data/repository/wallet_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(this.walletRepository) : super(WalletInitial()) {
    on<WalletEvent>((event, emit) {});
    on<FetchWalletEvent>(_handleFetchWallet);
    on<LoadMoreTransactionsEvent>(_handleLoadMoreTransactions);
    on<FilterTransactionsEvent>(_handleFilterTransactions);
    on<SubmitWithdrawalEvent>(_handleSubmitWithdrawal);
    on<AddMoneyEvent>(_handleAddMoney);
    on<RefreshWalletEvent>(_handleRefreshWallet);
    on<GetTransactionDetailsEvent>(_handleGetTransactionDetails);
  }

  final WalletRepository walletRepository;

  /// Handle fetch wallet event
  Future<void> _handleFetchWallet(
    FetchWalletEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(WalletLoading());

    final ApiResponse<WalletBalanceModel> response =
        await walletRepository.fetchWallet();

    if (response.data != null) {
      emit(WalletLoaded(
        wallet: response.data!,
        currentFilter: event.filterType ?? 'all',
      ));
    } else {
      emit(WalletError(
        message: response.errorMessage ?? 'Failed to load wallet data',
      ));
    }
  }

  /// Handle load more transactions (pagination)
  Future<void> _handleLoadMoreTransactions(
    LoadMoreTransactionsEvent event,
    Emitter<WalletState> emit,
  ) async {}

  /// Handle filter transactions
  Future<void> _handleFilterTransactions(
    FilterTransactionsEvent event,
    Emitter<WalletState> emit,
  ) async {}

  /// Handle submit withdrawal request
  Future<void> _handleSubmitWithdrawal(
    SubmitWithdrawalEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(WithdrawalSubmitting());

    final ApiResponse<void> response =
        await walletRepository.submitWithdrawalRequest(
      request: event.request,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(const WithdrawalSubmitted());

      // Refresh wallet data after successful withdrawal
      add(const RefreshWalletEvent());
    } else {
      emit(WithdrawalError(
        message: response.errorMessage ?? 'Failed to submit withdrawal request',
      ));
    }
  }

  /// Handle add money to wallet
  Future<void> _handleAddMoney(
    AddMoneyEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(AddMoneyProcessing());

    final ApiResponse<void> response = await walletRepository.addMoney(
      amount: event.amount,
      paymentMethod: event.paymentMethod,
      additionalData: event.additionalData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(const AddMoneySuccess());

      // Refresh wallet data after successful recharge
      add(const RefreshWalletEvent());
    } else {
      emit(AddMoneyError(
        message: response.errorMessage ?? 'Failed to add money to wallet',
      ));
    }
  }

  /// Handle refresh wallet
  Future<void> _handleRefreshWallet(
    RefreshWalletEvent event,
    Emitter<WalletState> emit,
  ) async {}

  /// Handle get transaction details
  Future<void> _handleGetTransactionDetails(
    GetTransactionDetailsEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(TransactionDetailsLoading());

    final ApiResponse<TransactionDataModel> response =
        await walletRepository.getTransactionDetails(
      transactionId: event.transactionId,
    );

    if (response.data != null) {
      emit(TransactionDetailsLoaded(transaction: response.data!));
    } else {
      emit(TransactionDetailsError(
        message: response.errorMessage ?? 'Failed to load transaction details',
      ));
    }
  }
}
