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
  final bool? isMultiline;
  final TextStyle? style;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
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
    this.focusNode,
    this.isMultiline,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable ?? true,
      maxLines: isMultiline == true ? null : 1,
      onChanged: onChange,
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      style: style,
      inputFormatters: [
        if (maxCharacters > 0) LengthLimitingTextInputFormatter(maxCharacters),
      ],
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
        hintText: hint,
      ),
    );
  }
}
