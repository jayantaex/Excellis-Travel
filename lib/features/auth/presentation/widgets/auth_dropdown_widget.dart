import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class UserTypeSelection extends StatefulWidget {
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  const UserTypeSelection({super.key, this.onChanged, this.items});

  @override
  State<UserTypeSelection> createState() => _UserTypeSelectionState();
}

class _UserTypeSelectionState extends State<UserTypeSelection> {
  String _defaultValue = 'retailer';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.textHint.withOpacity(0.15),
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(90),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(8),
        dropdownColor: AppColors.white,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        style: const TextStyle(
            fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
        isExpanded: true,
        value: _defaultValue,
        items: widget.items,
        onChanged: (String? value) {
          setState(() {
            _defaultValue = value!;
          });
          widget.onChanged!(value);
        },
      ),
    );
  }
}
