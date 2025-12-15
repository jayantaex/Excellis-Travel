import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class MultiDropDownWidget<T extends Object> extends StatelessWidget {
  const MultiDropDownWidget(
      {super.key,
      required this.items,
      required this.controller,
      required this.hintText,
      required this.dialougeTitle,
      this.onSelectionChange,
      this.validator});
  final List<DropdownItem<T>> items;
  final MultiSelectController<T>? controller;
  final String hintText;
  final String dialougeTitle;
  final Function(List<T>)? onSelectionChange;
  final String? Function(List<DropdownItem<T>>?)? validator;

  @override
  Widget build(BuildContext context) => MultiDropdown<T>(
        items: items,
        controller: controller,
        searchEnabled: true,
        chipDecoration: ChipDecoration(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          runSpacing: 2,
          spacing: 10,
        ),
        fieldDecoration: FieldDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w400),
          showClearIcon: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.3),
            ),
          ),
          suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.primary),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
        ),
        dropdownDecoration: DropdownDecoration(
          marginTop: 2,
          maxHeight: 500,
          header: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              dialougeTitle,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        dropdownItemDecoration: DropdownItemDecoration(
          selectedIcon: const Icon(Icons.check_box, color: AppColors.primary),
          disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
        ),
        validator: validator,
        onSelectionChange: onSelectionChange,
      );
}
