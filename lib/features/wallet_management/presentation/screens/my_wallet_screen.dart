import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../core/services/razorpay.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../payment/payment_module.dart';
import '../../bloc/wallet_bloc.dart';
import '../../wallet_module.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final RazorpayService _razorpayService = RazorpayService();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Payment successful: ${response.paymentId}');
    AppHelpers.debounce(
      () {
        context.pushNamed(PaymentModule.paymentSucessName,
            pathParameters: {'paymentId': '${response.paymentId}'});
      },
      delay: const Duration(milliseconds: 200),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Payment error: ${response.code} - ${response.message}');
    AppHelpers.debounce(
      () {
        context.pushNamed(PaymentModule.paymentFailedName,
            pathParameters: {'errorMsg': '${response.message}'});
      },
      delay: const Duration(milliseconds: 200),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External wallet selected: ${response.walletName}');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WalletBloc>().add(const LoadWallet(userId: '1'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
      ),
      body: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {
          log('Wallet states :::: $state');
        },
        builder: (context, state) {
          return state is WalletLoaded
              ? Center(child: Text(AppHelpers.formatCurrency(state.balance)))
              : state is WalletLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : const Center(child: Text('Unexpected state'));
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: AppPrimaryButton(
          title: "Recharge",
          isLoading: false,
          onPressed: () {
            _razorpayService.initatePayment(
                amount: 12.0,
                description: 'testing razorpay',
                mobile: '9064187130',
                email: 'razorpay@gmail.com',
                onSuccess: _handlePaymentSuccess,
                onError: _handlePaymentError);
          },
        ),
      ),
    );
  }
}
