import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import 'api/wallet_api.dart';
import 'bloc/wallet_bloc.dart';
import 'data/wallet_repository.dart';
import 'presentation/screens/my_wallet_screen.dart';
import 'presentation/screens/transaction_screen.dart';

class WalletModule {
  static String myWalletName = 'my_wallet';
  static String myWalletPath = '/my_wallet';
  static String transactionPath = '/transactions';
  static String transactionName = 'transactions';


  static Widget myWalletBuilder() {
    final WalletRepository respository =
        WalletRepository(walletApi: WalletApi(apiClient: ApiClient()));
    return BlocProvider(
      create: (_) => WalletBloc(respository: respository),
      child: const MyWalletScreen(),
    );
  }

  static Widget transactionBuilder() {
    final WalletRepository respository =
        WalletRepository(walletApi: WalletApi(apiClient: ApiClient()));
    return BlocProvider(
      create: (_) => WalletBloc(respository: respository),
      child: const TransactionScreen(),
    );
  }
}
