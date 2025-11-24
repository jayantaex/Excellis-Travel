import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../utils/app_helpers.dart';

class AppGradientBg extends StatelessWidget {
  const AppGradientBg({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        height: AppHelpers.getScreenHeight(context),
        width: AppHelpers.getScreenWidth(context),
        decoration: AppHelpers.isDarkMode(context)
            ? const BoxDecoration(color: AppColors.black)
            : const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[AppColors.primary, AppColors.secondary]),
              ),
        child: child,
      );
}
