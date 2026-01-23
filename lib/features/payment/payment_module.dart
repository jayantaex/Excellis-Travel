import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/network/api_client.dart';
import '../wallet_management/api/wallet_api.dart';
import '../wallet_management/bloc/wallet_bloc.dart';
import '../wallet_management/data/repository/wallet_repository.dart';
import 'presentation/screens/payment_failed_screen.dart';
import 'presentation/screens/payment_processing_screen.dart';
import 'presentation/screens/payment_success_screen.dart';

class PaymentModule {
  static String paymentProcessingName = 'payment_processing';
  static String paymentProcessingPath = '/payment_processing';
  static Widget paymentProcessingBuilder(
      BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              WalletBloc(WalletRepository(WalletApi(ApiClient()))),
        ),
      ],
      child: PaymentProcessingScreen(
        orderFor: extra?['orderFor'] ?? '',
        amount: extra?['amount'] ?? 0,
        description: extra?['description'] ?? '',
        mobile: extra?['mobile'] ?? '',
        email: extra?['email'] ?? '',
      ),
    );
  }

  static String paymentSuccessName = 'payment_success';
  static String paymentSuccessPath = '/payment_success';
  static Widget paymentSuccessBuilder(
      BuildContext context, GoRouterState state) {
    final Map<String, dynamic> data =
        state.extra as Map<String, dynamic>? ?? {};
    log('payment success data: $data');
    return PaymentSuccessfulScreen(
      btnText: data['btnText'] ?? 'Continue',
      nextRoute: data['nextRoute'],
      data: data['paymentData'],
    );
  }

  static String paymentFailedName = 'payment_failed';
  static String paymentFailedPath = '/payment_failed';
  static Widget paymentFailedBuilder(
      BuildContext context, GoRouterState state) {
    final String message = state.uri.queryParameters['message'] ?? '';
    return PaymentFailedScreen(
      errMsg:
          message.isNotEmpty ? message : 'Payment failed. Please try again.',
    );
  }
}
