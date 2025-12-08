import 'package:excellistravel/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';

class ResetPassSheet extends StatefulWidget {
  const ResetPassSheet({super.key, this.onDone, this.parentContext});
  final void Function(String oldPass, String newPass)? onDone;
  final BuildContext? parentContext;

  @override
  State<ResetPassSheet> createState() => _ResetPassSheetState();
}

class _ResetPassSheetState extends State<ResetPassSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isOldPasswordVisible = true;
  bool _isNewPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  String? _validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter old password';
    }
    if (value.length < 8) {
      return 'Old password must be at least 8 characters';
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    }
    if (value.length < 8) {
      return 'New password must be at least 8 characters';
    }
    if (value == _oldPassController.text) {
      return 'New password must be different from old password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value.length < 8) {
      return 'Confirm password must be at least 8 characters';
    }
    if (value != _newPassController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onDone?.call(_oldPassController.text, _newPassController.text);
    }
  }

  void _toggleOldPasswordVisibility() {
    setState(() {
      _isOldPasswordVisible = !_isOldPasswordVisible;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordVisible = !_isNewPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext selfContext) => Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPrimaryInput(
              suffixIcon: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: _toggleOldPasswordVisibility,
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppHelpers.svgAsset(
                        assetName: 'password_visisbility', isIcon: true),
                  ),
                ),
              ),
              isPassword: _isOldPasswordVisible,
              maxCharacters: 21,
              controller: _oldPassController,
              hint: 'Enter your old password',
              label: 'Old Password',
              validator: _validateOldPassword,
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              suffixIcon: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: _toggleNewPasswordVisibility,
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppHelpers.svgAsset(
                        assetName: 'password_visisbility', isIcon: true),
                  ),
                ),
              ),
              isPassword: _isNewPasswordVisible,
              maxCharacters: 21,
              controller: _newPassController,
              hint: 'Enter your new password',
              label: 'New Password',
              validator: _validateNewPassword,
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              suffixIcon: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: _toggleConfirmPasswordVisibility,
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppHelpers.svgAsset(
                        assetName: 'password_visisbility', isIcon: true),
                  ),
                ),
              ),
              isPassword: _isConfirmPasswordVisible,
              controller: _confirmPassController,
              maxCharacters: 21,
              hint: 'Confirm your new password',
              label: 'Confirm Password',
              validator: _validateConfirmPassword,
            ),
            const SizedBox(height: 24),
            AppPrimaryButton(
              title: 'Reset',
              isLoading: false,
              onPressed: _handleSubmit,
            ),
          ],
        ),
      );
}
