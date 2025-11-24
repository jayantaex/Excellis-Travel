import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';

Future<void> showResetPassSheet(
    {required BuildContext context,
    required void Function(String oldPass, String newPass) onDone}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (BuildContext context) =>
        ResetPass(parentContext: context, onDone: onDone),
  );
}

class ResetPass extends StatefulWidget {
  const ResetPass({super.key, this.onDone, this.parentContext});
  final void Function(String oldPass, String newPass)? onDone;
  final BuildContext? parentContext;

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  String errMessage = '';

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext selfContext) => Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 8, bottom: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 11),
              const Text(
                'Are you sure you want to reset your password? All your account data will remain intact but other devices will be logged out.',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              AppPrimaryInput(
                isPassword: true,
                maxCharacters: 21,
                controller: _oldPassController,
                hint: 'Enter your old password',
                label: 'Old Password',
              ),
              const SizedBox(height: 16),
              AppPrimaryInput(
                isPassword: true,
                maxCharacters: 21,
                controller: _newPassController,
                hint: 'Enter your new password',
                label: 'New  Password',
              ),
              const SizedBox(height: 16),
              AppPrimaryInput(
                isPassword: true,
                controller: _confirmPassController,
                maxCharacters: 21,
                hint: 'Confirm your new password',
                label: 'Confirm Password',
              ),
              const SizedBox(height: 8),
              Text(
                errMessage,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.error,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 45,
                width: AppHelpers.getScreenWidth(context),
                child: AppPrimaryButton(
                  title: 'Reset',
                  isLoading: false,
                  onPressed: () async {
                    if (_oldPassController.text == _newPassController.text) {
                      errMessage =
                          'Old password and new password cannot be the same';
                      setState(() {});

                      return;
                    }
                    if (_oldPassController.text.isEmpty ||
                        _oldPassController.text.length < 8) {
                      errMessage = 'Please enter a valid old password';
                      setState(() {});

                      return;
                    }

                    if (_newPassController.text.isEmpty ||
                        _newPassController.text.length < 8) {
                      errMessage = 'Please enter a valid new password';
                      setState(() {});

                      return;
                    }

                    if (_confirmPassController.text.isEmpty ||
                        _confirmPassController.text.length < 8) {
                      errMessage = 'Please enter a valid confirm password';
                      setState(() {});

                      return;
                    }

                    if (_newPassController.text !=
                        _confirmPassController.text) {
                      errMessage =
                          'New password and confirm password do not match';
                      setState(() {});
                      return;
                    }
                    widget.onDone?.call(
                        _oldPassController.text, _newPassController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
