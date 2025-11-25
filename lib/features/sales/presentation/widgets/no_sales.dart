import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class NoSales extends StatelessWidget {
  const NoSales({super.key});

  @override
  Widget build(BuildContext context) => const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('₹0.00',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white)),
          SizedBox(height: 8),
          Text(
            'You have no sales yet.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ],
      );
}
