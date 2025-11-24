import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key, required this.errMsg});
  final String errMsg;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          width: AppHelpers.percenWidth(context: context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
        bottomNavigationBar: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 70),
            child: SizedBox(
              height: 45,
              width: AppHelpers.getScreenWidth(context),
              child: AppPrimaryButton(
                title: 'Retry Payment',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
                isLoading: false,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      );
}
