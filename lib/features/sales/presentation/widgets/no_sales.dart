import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../utils/app_helpers.dart';

class NoSales extends StatelessWidget {
  const NoSales({super.key, this.isForFilter, this.onFilter});
  final bool? isForFilter;
  final void Function()? onFilter;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // isForFilter ?? false
          //     ? Text('₹0.00',
          //         style: TextStyle(
          //             fontSize: 32,
          //             fontWeight: FontWeight.bold,
          //             color: AppHelpers.isDarkMode(context)
          //                 ? AppColors.white
          //                 : AppColors.black))
          //     : const SizedBox(),
          // const SizedBox(height: 8),
          Text(
            isForFilter ?? false
                ? 'No sales found with this filter.'
                : 'No sales found.',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.white),
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
                    bgColor: AppHelpers.isDarkMode(context)
                        ? AppColors.primary
                        : AppColors.black,
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
