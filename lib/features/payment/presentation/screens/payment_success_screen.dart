import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key, required this.paymentId});
  final String paymentId;

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
                  context.goNamed(BottomNavModule.name);
                },
              ),
            ),
          ),
        ),
      );
}
