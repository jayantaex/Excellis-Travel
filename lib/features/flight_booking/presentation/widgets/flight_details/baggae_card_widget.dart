import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';

class BaggaeCardWidget extends StatelessWidget {
  const BaggaeCardWidget(
      {super.key,
      required this.title,
      required this.iconName,
      required this.allowance});
  final String title;
  final String iconName;
  final String allowance;

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: CircleAvatar(
          radius: 16,
          backgroundColor: isDark
              ? AppColors.white.withValues(alpha: 0.1)
              : AppColors.grey.withValues(alpha: 0.1),
          child: AppHelpers.svgAsset(
              assetName: iconName,
              isIcon: true,
              height: 16,
              width: 16,
              color: isDark ? AppColors.white : null)),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.white : AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        allowance,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.white.withOpacity(0.7)
              : AppColors.textSecondary,
        ),
      ),
    );
  }
}
