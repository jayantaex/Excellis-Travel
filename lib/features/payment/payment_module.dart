import 'package:excellistravel/features/payment/bloc/payment_bloc.dart';
import 'package:excellistravel/features/payment/data/payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/network/api_client.dart';
import 'data/src/payment_remote_src.dart';
import 'presentation/screens/payment_failed_screen.dart';
import 'presentation/screens/payment_processing_screen.dart';
import 'presentation/screens/payment_success_screen.dart';

class PaymentModule {
  static String paymentProcessingName = 'payment_processing';
  static String paymentProcessingPath = '/payment_processing';
  static Widget paymentProcessingBuilder(
      BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    return BlocProvider(
      create: (context) => PaymentBloc(
        repository: PaymentRepository(
            remoteSrc: PaymentRemoteSrc(
          apiClient: ApiClient(),
        )),
      ),
      child: PaymentProcessingScreen(
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
          BuildContext context, GoRouterState state) =>
      const PaymentSuccessfulScreen();

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
