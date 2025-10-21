import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';


class WalletPaymentFailedScreen extends StatelessWidget {
  final String errMsg;
  const WalletPaymentFailedScreen({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppHelpers.percenWidth(context: context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.background,
                child: Icon(Icons.close),
              ),
              const SizedBox(height: 25),
              const Text(
                'Payment failed!',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                errMsg,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: AppPrimaryButton(
          title: 'Retry Payment',
          isLoading: false,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
