import 'package:excellistravel/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../services/network_checker.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton(
      {super.key,
      this.onPressed,
      required this.title,
      required this.isLoading,
      this.style,
      this.bgColor});
  final Function? onPressed;
  final String title;
  final bool isLoading;
  final Color? bgColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(bgColor ?? AppColors.black),
            foregroundColor: WidgetStateProperty.all(AppColors.white),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
            )),
        onPressed: isLoading || onPressed == null
            ? null
            : () async {
                final bool hasInternet =
                    await NetworkChecker().hasInternetConnection();
                if (!hasInternet) {
                  return;
                }
                onPressed!();
              },
        child: isLoading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  backgroundColor: AppColors.white,
                  valueColor: bgColor == null
                      ? const AlwaysStoppedAnimation<Color>(AppColors.black)
                      : const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              )
            : AppText(
                text: title,
                size: 18,
                weight: FontWeight.w500,
              ),
      );
}
