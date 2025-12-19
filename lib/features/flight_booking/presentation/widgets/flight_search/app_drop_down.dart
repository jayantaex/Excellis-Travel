import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown(
      {super.key,
      required this.title,
      required this.value,
      required this.label,
      this.prefixIconName,
      required this.items,
      this.onChanged});
  final String title;
  final String value;
  final String label;
  final String? prefixIconName;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelpers.isDarkMode(context);
    return DropdownButtonFormField(
      dropdownColor: isDarkMode ? AppColors.surfaceDark : AppColors.white,
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isDarkMode ? AppColors.white : AppColors.black),
      icon: const SizedBox(),
      borderRadius: BorderRadius.circular(12),
      initialValue: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIconName != null
            ? Padding(
                padding: const EdgeInsets.all(11.0),
                child: AppHelpers.svgAsset(
                  assetName: prefixIconName!,
                  isIcon: true,
                  color: isDarkMode ? AppColors.white : null,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: isDarkMode
                ? AppColors.white.withOpacity(0.1)
                : AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: isDarkMode
                ? AppColors.white.withOpacity(0.1)
                : AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: isDarkMode
                ? AppColors.white.withOpacity(0.1)
                : AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: isDarkMode ? AppColors.textHint : AppColors.textSecondary,
        ),
      ),
    );
  }
}
