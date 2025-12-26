import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import 'api/wallet_api.dart';
import 'bloc/wallet_bloc.dart';
import 'data/repository/wallet_repository.dart';
import 'screens/credit_wallet_screen.dart';
import 'screens/wallet_screen.dart';

class WalletModule {
  static const walletPath = '/my-wallet';
  static const wallet = 'my_wallet';
  static Widget builder() => BlocProvider(
        create: (context) =>
            WalletBloc(WalletRepository(WalletApi(ApiClient()))),
        child: const WalletScreen(),
      );

  static const creditWalletPath = '/credit-wallet';
  static const creditWallet = 'credit-wallet';
  static Widget creditWalletBuilder() => BlocProvider(
        create: (context) =>
            WalletBloc(WalletRepository(WalletApi(ApiClient()))),
        child: const CreditWalletScreen(),
      );
}
