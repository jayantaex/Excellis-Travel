import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../utils/app_helpers.dart';

class TransWhiteBgWidget extends StatelessWidget {
  const TransWhiteBgWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        height: AppHelpers.getScreenHeight(context),
        width: AppHelpers.getScreenWidth(context),
        decoration: AppHelpers.isDarkMode(context)
            ? const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[AppColors.black, AppColors.black]),
              )
            : const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[AppColors.transparent, AppColors.white]),
              ),
        child: child,
      );
}
