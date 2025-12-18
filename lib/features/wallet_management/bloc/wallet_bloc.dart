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
    on<FetchWalletTransactionsEvent>(_handleFetchWalletTransactions);
    on<FilterTransactionsEvent>(_handleFilterTransactions);
    on<DepositEvent>(_handleDeposit);
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
    final ApiResponse<TransactionDataModel> transactionsResponse =
        await walletRepository.fetchTransactions(
      page: event.page,
      limit: event.limit,
    );

    if (response.data != null) {
      final transactions = transactionsResponse.data?.datam ?? [];
      emit(WalletLoaded(
        wallet: response.data!,
        currentFilter: event.filterType ?? 'all',
        transactions: transactionsResponse.data,
        allTransactions: transactions,
        pagination: transactionsResponse.data?.pagination,
      ));
    } else {
      emit(WalletError(
        message: response.errorMessage ?? 'Failed to load wallet data',
      ));
    }
  }

  /// Handle fetch wallet transactions event (for pagination)
  Future<void> _handleFetchWalletTransactions(
    FetchWalletTransactionsEvent event,
    Emitter<WalletState> emit,
  ) async {
    final currentState = state;

    // If loading first page, show loading state
    if (event.page == 1) {
      if (currentState is WalletLoaded) {
        emit(currentState.copyWith(
          isLoadingMore: true,
          clearTransactions: true,
        ));
      } else {
        emit(WalletLoading());
      }
    } else {
      // If loading more pages, show loading more indicator
      if (currentState is WalletLoaded) {
        emit(currentState.copyWith(isLoadingMore: true));
      }
    }

    final ApiResponse<TransactionDataModel> transactionsResponse =
        await walletRepository.fetchTransactions(
      page: event.page,
      limit: event.limit,
    );

    if (transactionsResponse.data != null) {
      final newTransactions = transactionsResponse.data!.datam ?? [];
      final updatedState = state;

      if (updatedState is WalletLoaded) {
        // If page 1, replace transactions; otherwise append
        final allTransactions = event.page == 1
            ? newTransactions
            : [...updatedState.allTransactions, ...newTransactions];

        emit(updatedState.copyWith(
          transactions: transactionsResponse.data,
          allTransactions: allTransactions,
          pagination: transactionsResponse.data?.pagination,
          isLoadingMore: false,
        ));
      } else {
        // If state is not WalletLoaded, fetch wallet first
        final ApiResponse<WalletBalanceModel> walletResponse =
            await walletRepository.fetchWallet();

        if (walletResponse.data != null) {
          emit(WalletLoaded(
            wallet: walletResponse.data!,
            currentFilter: event.filterType ?? 'all',
            transactions: transactionsResponse.data,
            allTransactions: newTransactions,
            pagination: transactionsResponse.data?.pagination,
          ));
        } else {
          emit(WalletError(
            message:
                walletResponse.errorMessage ?? 'Failed to load wallet data',
          ));
        }
      }
    } else {
      if (currentState is WalletLoaded) {
        emit(currentState.copyWith(isLoadingMore: false));
      } else {
        emit(WalletError(
          message: transactionsResponse.errorMessage ??
              'Failed to load transactions',
        ));
      }
    }
  }

  /// Handle filter transactions event
  Future<void> _handleFilterTransactions(
    FilterTransactionsEvent event,
    Emitter<WalletState> emit,
  ) async {
    final currentState = state;
    if (currentState is WalletLoaded) {
      // Just update the filter - filtering is done client-side
      emit(currentState.copyWith(
        currentFilter: event.filterType.toLowerCase(),
      ));
    }
  }

  Future<void> _handleDeposit(
    DepositEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(InitDiposit(
      description: event.description,
      amount: event.amount,
      mobile: event.mobile,
      email: event.email,
      onRetryRoute: event.onRetryRoute,
    ));
  }
}
