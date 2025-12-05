import 'package:excellistravel/features/wallet_management/api/wallet_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_client.dart';
import 'bloc/wallet_bloc.dart';
import 'data/repository/wallet_repository.dart';
import 'screens/wallet_screen.dart';

class WalletModule {
  static const walletPath = '/my-wallet';
  static const wallet = 'my-walleet';
  static Widget builder() => BlocProvider(
        create: (context) =>
            WalletBloc(WalletRepository(WalletApi(ApiClient()))),
        child: const WalletScreen(),
      );
}
