import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/api_response.dart';
import '../data/models/transaction_model.dart';
import '../data/models/wallet_charge_model.dart' hide Datam;
import '../data/models/wallet_model.dart';
import '../data/models/wallet_order_model.dart';
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
    on<CreateRechargeOrderEvent>(_handleCreateRechargeOrder);
    on<ChargeMoneyEvent>(_handleChargeMoney);
    on<VerifyWalletOrderEvent>(_handleVerifyWalletOrder);
    on<RechargeWalletEvent>(_handleRechargeWallet);
  }

  final WalletRepository walletRepository;

  /// Handle fetch wallet event
  Future<void> _handleFetchWallet(
    FetchWalletEvent event,
    Emitter<WalletState> emit,
  ) async {
    if (state is! WalletLoaded) {
      emit(WalletLoading());
    }

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
        // If page 1, replace transactions; otherwise append unique ones
        List<Datam> allTransactions;
        if (event.page == 1) {
          allTransactions = newTransactions;
        } else {
          final existingIds =
              updatedState.allTransactions.map((e) => e.id).toSet();
          final uniqueNewTransactions = newTransactions
              .where((e) => !existingIds.contains(e.id))
              .toList();
          allTransactions = [
            ...updatedState.allTransactions,
            ...uniqueNewTransactions
          ];
        }

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

  Future<void> _handleCreateRechargeOrder(
    CreateRechargeOrderEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(WalletLoading());
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
    emit(WalletLoading());
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
    emit(WalletLoading());
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
    emit(WalletLoading());
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
}
