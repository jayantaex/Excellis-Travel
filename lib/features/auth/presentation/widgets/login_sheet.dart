import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';
import 'auth_dropdown_widget.dart';
import 'auth_input_widget.dart';
import 'registration_sheet.dart';

Future<void> showLoginSheet(BuildContext context) async {
  showModalBottomSheet(
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    elevation: 0,
    barrierColor: AppColors.transparent,
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) => LoginSheet(),
  );
}

class LoginSheet extends StatelessWidget {
  LoginSheet({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String usertype = 'retailer';
  String errMsg = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHelpers.getScreenHeight(context) * 0.65,
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        children: [
          const SizedBox(height: 55),
          const Text('Welcome back!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Text(
            'You can reach us anytime',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 53),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AuthDropdownWidget(
              onChanged: (value) {
                usertype = value ?? 'retailer';
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AuthInputWidget(
                isPassword: false,
                maxCharacters: 20,
                controller: _userNameController,
                label: 'Email or Username',
                hint: 'Enter your Email or Username'),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AuthInputWidget(
                isPassword: true,
                maxCharacters: 8,
                controller: _passwordController,
                label: 'Password',
                hint: 'Enter your Password'),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                width: AppHelpers.getScreenWidth(context),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errMsg,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.error),
                    ))),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppPrimaryButton(
              title: 'LOGIN',
              isLoading: false,
              onPressed: () {
                context.goNamed(BottomNavModule.name);
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              width: AppHelpers.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      Navigator.of(context).pop();
                      await showAgencyRegistrationSheet(context);
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
