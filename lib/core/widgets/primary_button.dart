import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;
  final Color? bgColor;
  final TextStyle? style;
  const AppPrimaryButton(
      {super.key,
      this.onPressed,
      required this.title,
      required this.isLoading,
      this.style,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bgColor ?? AppColors.black),
          foregroundColor: WidgetStateProperty.all(AppColors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          )),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              backgroundColor: AppColors.white,
              valueColor: bgColor == null
                  ? const AlwaysStoppedAnimation<Color>(AppColors.black)
                  : const AlwaysStoppedAnimation<Color>(AppColors.primary),
            )
          : Text(
              title,
              style: style ??
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
    );
  }
}
