import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class MultiDropDownWidget<T extends Object> extends StatelessWidget {
  const MultiDropDownWidget(
      {super.key, required this.items, required this.controller});
  final List<T> items;
  final MultiSelectController<T>? controller;

  @override
  Widget build(BuildContext context) => MultiDropdown<T>(
        items: items
            .map((e) => DropdownItem<T>(value: e, label: e.toString()))
            .toList(),
        controller: controller,
        searchEnabled: true,
        chipDecoration: const ChipDecoration(
          backgroundColor: Colors.yellow,
          runSpacing: 2,
          spacing: 10,
        ),
        fieldDecoration: FieldDecoration(
          hintText: 'Countries',
          hintStyle: const TextStyle(color: Colors.black87),
          showClearIcon: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
        ),
        dropdownDecoration: const DropdownDecoration(
          marginTop: 2,
          maxHeight: 500,
          header: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Select countries from the list',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        dropdownItemDecoration: DropdownItemDecoration(
          selectedIcon: const Icon(Icons.check_box, color: Colors.green),
          disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a country';
          }
          return null;
        },
        onSelectionChange: (selectedItems) {
          debugPrint('OnSelectionChange: $selectedItems');
        },
      );
}
