import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class AuthDropdownWidget extends StatefulWidget {
  const AuthDropdownWidget({super.key, this.onChanged, this.items});
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;

  @override
  State<AuthDropdownWidget> createState() => _AuthDropdownWidgetState();
}

class _AuthDropdownWidgetState extends State<AuthDropdownWidget> {
  String? _defaultValue;
  @override
  void initState() {
    _defaultValue = widget.items?.first.value ?? '';
    log(_defaultValue.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.textHint.withOpacity(0.15),
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(90),
        ),
        child: DropdownButton<String>(
          value: _defaultValue,
          borderRadius: BorderRadius.circular(8),
          dropdownColor: AppColors.white,
          underline: const SizedBox(),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          style: const TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400),
          isExpanded: true,
          items: widget.items,
          onChanged: (String? value) {
            widget.onChanged!(value);
            setState(() {
              _defaultValue = value!;
            });
          },
        ),
      );
}
