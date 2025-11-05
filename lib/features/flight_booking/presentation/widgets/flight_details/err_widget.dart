import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';

class ErrWidget extends StatelessWidget {
  final String message;
  const ErrWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHelpers.getScreenHeight(context) * 0.8,
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$message!".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.grey.withOpacity(0.9)),
          ),
          const SizedBox(height: 12),
          Text(
            "Sorry for the inconvenience\n Please try again later",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.grey.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
}
