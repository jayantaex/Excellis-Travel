import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/models/credit_balance_model.dart';
import '../data/models/custom_cr_transaction_model.dart';
import '../data/models/overdue_data_model.dart';
import '../data/models/repay_resp_model.dart';
import '../data/models/repayment_data_model.dart';
import '../data/models/transaction_model.dart';
import '../data/models/wallet_charge_model.dart' hide Datam;
import '../data/models/wallet_model.dart';
import '../data/models/wallet_order_model.dart';
import '../data/models/withdrawl_request_data_model.dart';
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
    on<FetchWithdrawalRequestsEvent>(_handleFetchWithdrawalRequests);
    on<CancelWithdrawalRequestEvent>(_handleCancelWithdrawalRequest);
    on<FetchCreditBalanceEvent>(_handleFetchCreditBalance);
    on<FetchCreditBalanceTransactionsEvent>(
        _handleFetchCreditBalanceTransactions);
    on<ChargeCreditWalletMoneyEvent>(_handleChargeCreditWalletMoney);
    on<FetchRePaymentEvent>(_handleFetchRePayment);
    on<RePayEvent>(_handleRePay);
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
      final TransactionDataModel newTransactions = transactionsResponse.data!;

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
      'amount': event.amount,
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

  Future<void> _handleFetchWithdrawalRequests(
      FetchWithdrawalRequestsEvent event, Emitter<WalletState> emit) async {
    final currentState = state;
    if (currentState is FetchWithdrawalRequestsSuccess) {
      emit(FetchWithdrawalRequestsLoading(
          isLoadingMore: true, data: currentState.data));
    } else {
      emit(const FetchWithdrawalRequestsLoading());
    }

    final ApiResponse<WithdrawlRequestDataModel> response =
        await walletRepository.fetchWithdrawalRequests(
      page: event.page,
      limit: event.limit,
      status: event.status,
    );
    if (response.data != null) {
      emit(FetchWithdrawalRequestsSuccess(data: response.data!));
    } else {
      emit(FetchWithdrawalRequestsError(
          message:
              response.errorMessage ?? 'Failed to fetch withdrawal requests'));
    }
  }

  Future<void> _handleCancelWithdrawalRequest(
      CancelWithdrawalRequestEvent event, Emitter<WalletState> emit) async {
    emit(const WalletLoading());
    final ApiResponse<bool> response = await walletRepository
        .cancelWithdrawalRequest(requestId: event.requestId);
    if (response.data ?? false) {
      emit(const CancelWithdrawalRequestSuccess());
    } else {
      emit(CancelWithdrawalRequestError(
          message: response.errorMessage ??
              'Withdrawal request cancellation failed'));
    }
  }

  Future<void> _handleFetchCreditBalance(
      FetchCreditBalanceEvent event, Emitter<WalletState> emit) async {
    double? availableBalance = 0;
    final currentState = state;
    if (currentState is WalletLoaded) {
      availableBalance =
          double.parse(currentState.wallet?.balance?.toString() ?? '0');
    }
    emit(const FetchCreditBalanceLoading());

    final ApiResponse<CreditBalanceModel> response =
        await walletRepository.fetchCreditBalance();
    if (response.data != null) {
      emit(FetchCreditBalanceSuccess(
          data: response.data!, availableWalletBalance: availableBalance));
    } else {
      emit(FetchCreditBalanceError(
          message: response.errorMessage ?? 'Failed to fetch credit balance'));
    }
  }

  Future<void> _handleFetchCreditBalanceTransactions(
      FetchCreditBalanceTransactionsEvent event,
      Emitter<WalletState> emit) async {
    double? availableBalance = 0;
    final currentState = state;
    if (currentState is FetchCreditBalanceSuccess) {
      availableBalance =
          double.parse(currentState.data?.data?.balance?.toString() ?? '0');
    }

    emit(const FetchCreditBalanceLoading());

    final ApiResponse<CurstomCrTransactionModel> response =
        await walletRepository.fetchCreditBalanceTransactions(
            page: event.page, limit: event.limit);
    if (response.data != null) {
      emit(FetchCreditBalanceTransactionsSuccess(
          data: response.data!, availableBalance: availableBalance));
    } else {
      emit(FetchCreditBalanceTransactionsError(
          message: response.errorMessage ??
              'Failed to fetch credit balance transactions'));
    }
  }

  Future<void> _handleChargeCreditWalletMoney(
      ChargeCreditWalletMoneyEvent event, Emitter<WalletState> emit) async {
    emit(const WalletLoading());
    final ApiResponse<bool> response =
        await walletRepository.chargeCreditWalletMoney(body: event.body);
    log('Response: ${response.data}');
    if (response.data ?? false) {
      emit(ChargeCreditWalletMoneySuccess(paymentId: event.body['paymentId']));
    } else {
      emit(ChargeCreditWalletMoneyError(
          message:
              response.errorMessage ?? 'Failed to charge credit wallet money'));
    }
  }

  Future<void> _handleFetchRePayment(
      FetchRePaymentEvent event, Emitter<WalletState> emit) async {
    emit(const WalletLoading());
    final ApiResponse<List<OverDueDataModel>> overDueResponse =
        await walletRepository.fetchOverdueRepayments();
    final ApiResponse<List<PendingRepaymentDataModel>> pendingResponse =
        await walletRepository.fetchPendingRepayments();
    if (overDueResponse.data != null && pendingResponse.data != null) {
      emit(FetchRePaymentSuccess(
          overDueData: overDueResponse.data!,
          pendingRepaymentData: pendingResponse.data!));
    }
  }

  Future<void> _handleRePay(RePayEvent event, Emitter<WalletState> emit) async {
    emit(const WalletLoading());
    final ApiResponse<RePayRespModel> response =
        await walletRepository.confirmPayment(body: event.body);
    if (response.data != null) {
      emit(
          RePaySuccess(message: response.data!.message ?? 'Payment confirmed'));
    } else {
      emit(RePayError(
          message: response.errorMessage ?? 'Failed to confirm payment'));
    }
  }
}
