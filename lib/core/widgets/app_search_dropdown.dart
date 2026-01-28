import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

import '../constants/app_styles.dart';

class AppSearchDropdown<T extends Object> extends StatelessWidget {
  const AppSearchDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.labelText,
    this.value,
  });
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final String? hintText;
  final String? labelText;
  final T? value;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey.withValues(alpha: 0.3)),
        ),
        child: SearchChoices<T>.single(
          isExpanded: true,
          padding: EdgeInsets.zero,
          fieldDecoration:
              BoxDecoration(border: Border.all(style: BorderStyle.none)),
          displayClearIcon: false,
          menuBackgroundColor: AppColors.white,
          autofocus: false,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          items: items,
          value: value,
          onChanged: onChanged,
          hint: hintText,
          searchHint: hintText,
        ),
      );
}
