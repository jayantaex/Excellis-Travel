import 'package:excellistravel/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class NoSales extends StatelessWidget {
  const NoSales({super.key, this.isForFilter, this.onFilter});
  final bool? isForFilter;
  final void Function()? onFilter;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isForFilter ?? false
              ? const Text('₹0.00',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white))
              : const SizedBox(),
          const SizedBox(height: 8),
          Text(
            isForFilter ?? false
                ? 'No Sales Found with this filter'
                : 'You have no sales yet.',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 12),
          isForFilter ?? false
              ? SizedBox(
                  height: 50,
                  width: 150,
                  child: AppPrimaryButton(
                    onPressed: onFilter,
                    isLoading: false,
                    title: 'View All',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      );
}
