import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/models/transaction_model.dart';
import '../data/models/wallet_charge_model.dart' hide Datam;
import '../data/models/wallet_model.dart';
import '../data/models/wallet_order_model.dart';
import '../data/repository/wallet_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(this.walletRepository) : super(WalletInitial()) {
    on<WalletEvent>((event, emit) {});
    on<FetchWalletEvent>(_handleFetchWallet);
    on<FetchWalletTransactionsEvent>(_handleFetchWalletTransactions);
    on<FilterTransactionsEvent>(_handleFilterTransactions);
    on<CreateRechargeOrderEvent>(_handleCreateRechargeOrder);
    on<ChargeMoneyEvent>(_handleChargeMoney);
    on<VerifyWalletOrderEvent>(_handleVerifyWalletOrder);
    on<RechargeWalletEvent>(_handleRechargeWallet);
    on<SubmitWithdrawalEvent>(_handleSubmitWithdrawal);
  }

  final WalletRepository walletRepository;

  /// Handle fetch wallet event
  Future<void> _handleFetchWallet(
    FetchWalletEvent event,
    Emitter<WalletState> emit,
  ) async {
    if (state is! WalletLoaded) {
      emit(const WalletLoading());
    }

    final ApiResponse<WalletBalanceModel> response =
        await walletRepository.fetchWallet();
    final ApiResponse<TransactionDataModel> transactionsResponse =
        await walletRepository.fetchTransactions(
      page: event.page,
      limit: event.limit,
    );

    if (response.data != null) {
      emit(WalletLoaded(
        wallet: response.data!,
        currentFilter: event.filterType ?? 'all',
        transactions: transactionsResponse.data,
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
    // Capture current state and transactions before emitting loading
    final currentState = state;
    List<Datam> previousTransactions = [];

    if (currentState is WalletLoaded &&
        currentState.transactions?.datam != null) {
      previousTransactions = List.from(currentState.transactions!.datam!);
    }

    // Emit WalletLoaded with isLoadingMore=true to show bottom loader
    emit(WalletLoaded(
      wallet: currentState is WalletLoaded ? currentState.wallet : null,
      currentFilter:
          currentState is WalletLoaded ? currentState.currentFilter : 'all',
      transactions:
          currentState is WalletLoaded ? currentState.transactions : null,
      isLoadingMore: true,
    ));

    final ApiResponse<TransactionDataModel> transactionsResponse =
        await walletRepository.fetchTransactions(
      page: event.page,
      limit: event.limit,
    );

    if (transactionsResponse.data != null) {
      TransactionDataModel newTransactions = transactionsResponse.data!;

      // Append data if page > 1 and we have previous data
      if (event.page > 1 && previousTransactions.isNotEmpty) {
        final newData = newTransactions.datam ?? [];
        // Create a new list combining previous and new data
        newTransactions.datam = [...previousTransactions, ...newData];
      }

      emit(WalletLoaded(
        wallet: currentState is WalletLoaded ? currentState.wallet : null,
        currentFilter:
            currentState is WalletLoaded ? currentState.currentFilter : 'all',
        transactions: newTransactions,
        isLoadingMore: false,
      ));
    } else {
      emit(WalletError(
        message:
            transactionsResponse.errorMessage ?? 'Failed to load transactions',
      ));
    }
  }

  /// Handle filter transactions event
  Future<void> _handleFilterTransactions(
    FilterTransactionsEvent event,
    Emitter<WalletState> emit,
  ) async {
    final currentState = state;
    // Removed intermediate WalletLoading emission to prevent flicker

    emit(WalletLoaded(
      wallet: currentState is WalletLoaded ? currentState.wallet : null,
      currentFilter: event.filterType,
      transactions:
          currentState is WalletLoaded ? currentState.transactions : null,
    ));
  }

  Future<void> _handleCreateRechargeOrder(
    CreateRechargeOrderEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoading());
    final ApiResponse<WalletOrderModel> response =
        await walletRepository.createRechargeOrder(body: event.body);
    if (response.data != null) {
      emit(CreateWalletOrderSuccess(order: response.data!));
    } else {
      emit(
        CreateWalletOrderError(
          message: response.errorMessage ?? 'Failed to create recharge order',
        ),
      );
    }
  }

  Future<void> _handleChargeMoney(
    ChargeMoneyEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoading());
    final Map<String, dynamic> body = {
      'amount': (event.amount / 100).toDouble(),
      'description': event.description,
    };
    emit(ChargeMoneySubmitting());
    final ApiResponse<WalletChargeModel> response =
        await walletRepository.chargeMoney(body: body);
    if (response.data != null) {
      emit(ChargeMoneySubmitted(paymentId: event.paymentId));
    } else {
      emit(
        ChargeMoneyError(
          message: response.errorMessage ?? 'Failed to charge money',
        ),
      );
    }
  }

  Future<void> _handleVerifyWalletOrder(
    VerifyWalletOrderEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoading());
    final ApiResponse<bool> response =
        await walletRepository.verifyWalletOrder(body: event.body);
    if (response.data != null) {
      emit(WalletOrderVerified(
        signature: event.body['razorpay_signature'],
        orderId: event.body['razorpay_order_id'],
        paymentId: event.body['razorpay_payment_id'],
        amount: event.body['amount'],
        currency: event.body['currency'],
      ));
    } else {
      emit(
        WalletOrderVerifiedError(
          message: response.errorMessage ?? 'Failed to verify wallet order',
        ),
      );
    }
  }

  Future<void> _handleRechargeWallet(
    RechargeWalletEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoading());
    final ApiResponse<bool> response =
        await walletRepository.rechargeWallet(body: event.body);
    if (response.data ?? false) {
      emit(RechargeWalletSuccess());
    } else {
      emit(
        RechargeWalletError(
          message: response.errorMessage ?? 'Failed to recharge wallet',
        ),
      );
    }
  }

  Future<void> _handleSubmitWithdrawal(
      SubmitWithdrawalEvent event, Emitter<WalletState> emit) async {
    emit(const WalletLoading());
    final ApiResponse<bool> response =
        await walletRepository.submitWithdrawalRequest(body: event.body);
    if (response.data ?? false) {
      emit(const SubmitWithdrawalSuccess());
    } else {
      emit(
        SubmitWithdrawalError(
          message: response.errorMessage ?? 'Failed to submit withdrawal',
        ),
      );
    }
  }
}
