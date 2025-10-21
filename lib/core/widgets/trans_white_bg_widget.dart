import 'package:flutter/material.dart';
import 'package:reiselab/core/utils/app_helpers.dart';

import '../constants/app_styles.dart';

class TransWhiteBgWidget extends StatelessWidget {
  final Widget child;
  const TransWhiteBgWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHelpers.getScreenHeight(context),
      width: AppHelpers.getScreenWidth(context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.transparent, AppColors.white]),
      ),
      child: child,
    );
  }
}
