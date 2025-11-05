import 'package:flutter/material.dart';

import 'presentation/screens/payment_failed_screen.dart';
import 'presentation/screens/payment_success_screen.dart';

class PaymentModule {
  static String paymentSucessName = 'payment_success';
  static String paymentSucessPath = '/payment_success/:paymentId';
  static Widget paymentSuccessBuilder(context, state) {
    return PaymentSuccessScreen(
      paymentId: state.pathParameters['paymentId'] ?? '',
    );
  }

  static String paymentFailedName = 'payment_failed';
  static String paymentFailedPath = '/payment_failed/:errorMsg';
  static Widget paymentFailedBuilder(context, state) {
    return PaymentFailedScreen(
      errMsg: state.pathParameters['errorMsg'] ?? '',
    );
  }
}
