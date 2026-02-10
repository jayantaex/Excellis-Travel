import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import 'bloc/wallet_bloc.dart';
import 'data/repository/wallet_repository.dart';
import 'data/src/wallet_remote_data_src.dart';
import 'screens/credit_wallet_screen.dart';
import 'screens/re_payment_dashboard_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/withdrawal_request_screen.dart';

class WalletModule {
  static const walletPath = '/my-wallet';
  static const wallet = 'my_wallet';
  static Widget builder() => BlocProvider(
        create: (context) => WalletBloc(
          WalletRepository(
            WalletRemoteDataSrc(
              apiClient: ApiClient(),
            ),
          ),
        ),
        child: const WalletScreen(),
      );

  static const creditWalletPath = '/credit-wallet';
  static const creditWallet = 'credit-wallet';
  static Widget creditWalletBuilder() => BlocProvider(
        create: (context) => WalletBloc(
          WalletRepository(
            WalletRemoteDataSrc(
              apiClient: ApiClient(),
            ),
          ),
        ),
        child: const CreditWalletScreen(),
      );
  static const withdrawalRequestPath = '/withdrawal-request';
  static const withdrawalRequest = 'withdrawal_request';
  static Widget withdrawalRequestBuilder() => BlocProvider(
        create: (context) => WalletBloc(
          WalletRepository(
            WalletRemoteDataSrc(
              apiClient: ApiClient(),
            ),
          ),
        ),
        child: const WithdrawalRequestScreen(),
      );

  static const rePaymentDashboardPath = '/re-payment-dashboard';
  static const rePaymentDashboard = 're-payment-dashboard';
  static Widget rePaymentDashboardBuilder() => BlocProvider(
        create: (context) => WalletBloc(
          WalletRepository(
            WalletRemoteDataSrc(
              apiClient: ApiClient(),
            ),
          ),
        ),
        child: const RePaymentDashboardScreen(),
      );
}
