import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';

class AuthInputWidget extends StatefulWidget {
  const AuthInputWidget(
      {super.key,
      this.label,
      this.hint,
      required this.isPassword,
      this.controller,
      this.keyboardType,
      required this.maxCharacters,
      this.validator});
  final String? label;
  final String? hint;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxCharacters;
  final String? Function(String?)? validator;

  @override
  State<AuthInputWidget> createState() => _AuthInputWidgetState();
}

class _AuthInputWidgetState extends State<AuthInputWidget> {
  bool _isPasswordVisible = false;
  @override
  void initState() {
    _isPasswordVisible = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _isPasswordVisible,
        style: TextStyle(
            fontSize: 16,
            color: AppHelpers.isDarkMode(context)
                ? AppColors.white
                : AppColors.black,
            fontWeight: FontWeight.w400),
        inputFormatters: <TextInputFormatter>[
          if (widget.maxCharacters > 0)
            LengthLimitingTextInputFormatter(widget.maxCharacters),
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey.withValues(alpha: 0.15),
          suffixIcon: widget.isPassword
              ? _isPasswordVisible
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: SvgPicture.asset(
                          'assets/icons/password_visisbility.svg',
                          colorFilter: ColorFilter.mode(
                              AppHelpers.isDarkMode(context)
                                  ? AppColors.white
                                  : AppColors.black,
                              BlendMode.srcIn)))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/password_visisbility.svg',
                        colorFilter: ColorFilter.mode(
                          AppHelpers.isDarkMode(context)
                              ? AppColors.white
                              : AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
              : null,
          labelText: widget.label,
          hintText: widget.hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(color: AppColors.grey),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(color: AppColors.error),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(color: AppColors.error),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(color: AppColors.grey),
          ),
        ),
      );
}
