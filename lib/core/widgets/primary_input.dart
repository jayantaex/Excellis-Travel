import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reiselab/core/constants/app_styles.dart';

class AppPrimaryInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxCharacters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enable;
  final TextStyle? style;
  final VoidCallback? onTap;
  final Function(String)? onChange;

  const AppPrimaryInput({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    required this.maxCharacters,
    this.suffixIcon,
    this.prefixIcon,
    this.enable,
    this.style,
    this.onTap,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      onTap: onTap,
      enabled: true,
      controller: controller,
      keyboardType: keyboardType,
      style: style,
      inputFormatters: [
        if (maxCharacters > 0) LengthLimitingTextInputFormatter(maxCharacters),
      ],
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
