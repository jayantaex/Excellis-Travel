
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class AppDropDown extends StatelessWidget {
  final String title;
  final String value;
  final String label;
  final String? prefixIconName;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;

  const AppDropDown(
      {super.key,
      required this.title,
      required this.value,
      required this.label,
      this.prefixIconName,
      required this.items,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: AppColors.white,
      style: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      value: value,
      icon: const SizedBox(),
      borderRadius: BorderRadius.circular(12),
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIconName != null
            ? Padding(
                padding: const EdgeInsets.all(11.0),
                child: AppHelpers.svgAsset(
                  assetName: prefixIconName!,
                  isIcon: true,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
        ),
        labelText: label,
      ),
    );
  }
}
