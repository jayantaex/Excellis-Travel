import 'package:excellistravel/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton(
      {super.key,
      this.onPressed,
      required this.title,
      required this.isLoading,
      this.enabled,
      this.style,
      this.bgColor});
  final Function? onPressed;
  final String title;
  final bool isLoading;
  final bool? enabled;
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
