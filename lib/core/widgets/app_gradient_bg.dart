import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../utils/app_helpers.dart';

class AppGradientBg extends StatelessWidget {
  final Widget child;
  const AppGradientBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHelpers.getScreenHeight(context),
      width: AppHelpers.getScreenWidth(context),
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
      ),
      child: child,
    );
  }
}
