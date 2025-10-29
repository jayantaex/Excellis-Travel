import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';

class WalletPaymentSuccessScreen extends StatelessWidget {
  final String paymentId;
  const WalletPaymentSuccessScreen({super.key, required this.paymentId});

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
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.background,
                child: Icon(Icons.check),
              ),
              const SizedBox(height: 25),
              const Text(
                'Payment success',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'Payment Id: $paymentId ',
                style: const TextStyle(
                    fontSize: 10, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: AppPrimaryButton(
          title: 'continue booking',
          isLoading: false,
          onPressed: () {
            context.goNamed(BottomNavModule.name);
          },
        ),
      ),
    );
  }
}
