import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_styles.dart';

class AppPrimaryInput extends StatelessWidget {
  const AppPrimaryInput({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.showCursor,
    required this.maxCharacters,
    this.suffixIcon,
    this.isPassword,
    this.prefixIcon,
    this.enable,
    this.style,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.isMultiline,
    this.validator,
    this.focus,
  });
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxCharacters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enable;
  final bool? isMultiline;
  final bool? isPassword;
  final bool? showCursor;
  final TextStyle? style;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool? focus;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      autofocus: focus ?? false,
      cursorColor: AppColors.primary,
      obscureText: isPassword == true ? true : false,
      enabled: enable ?? true,
      maxLines: isMultiline == true ? null : 1,
      onChanged: onChange,
      onTap: onTap,
      controller: controller,
      keyboardType: onTap != null ? TextInputType.none : keyboardType,
      focusNode: focusNode,
      style: style ??
          TextStyle(
            color: isDarkMode ? AppColors.white : AppColors.textPrimary,
          ),
      validator: validator,
      inputFormatters: <TextInputFormatter>[
        if (maxCharacters > 0) LengthLimitingTextInputFormatter(maxCharacters),
      ],
      cursorWidth: onTap == null ? 2 : 0,
      showCursor: showCursor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: AppColors.error.withValues(alpha: 0.7),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.error),
        ),
        errorStyle: const TextStyle(
          color: AppColors.error,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        errorMaxLines: 2,
        labelText: label,
        labelStyle: TextStyle(
          color: isDarkMode ? AppColors.textHint : AppColors.textSecondary,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: isDarkMode
              ? AppColors.textHint.withOpacity(0.5)
              : AppColors.textHint,
        ),
      ),
    );
  }
}
