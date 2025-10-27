import 'dart:developer';

import 'package:excellistravel/features/bottom_navigation/bottom_nav_module.dart';
import 'package:excellistravel/features/legal/legal_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../auth_module.dart';
import '../../bloc/auth_bloc.dart';
import 'auth_dropdown_widget.dart';
import 'auth_input_widget.dart';

class LoginSheet extends StatefulWidget {
  final bool isLoading;
  const LoginSheet({super.key, required this.isLoading});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _items = <DropdownMenuItem<String>>[
    const DropdownMenuItem(value: 'retailer', child: Text('Retailer')),
    const DropdownMenuItem(value: 'user', child: Text('User')),
  ];
  String usertype = 'retailer';
  String errMsg = '';

  @override
  void initState() {
    kDebugMode
        ? {
            _userNameController.text = 'emilys',
            _passwordController.text = 'emilyspass'
          }
        : null;
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.only(top: 20),
      height: AppHelpers.getScreenHeight(context) * 0.62,
      width: AppHelpers.getScreenWidth(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(height: 25),
            SizedBox(
              width: AppHelpers.getScreenWidth(context),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    context.goNamed(BottomNavModule.name);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Skip >>',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'You can reach us anytime',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 33),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: UserTypeSelection(
                items: _items,
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
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppPrimaryButton(
                title: 'LOGIN',
                isLoading: widget.isLoading,
                onPressed: () {
                  log('Login pressed');

                  context.read<AuthBloc>().add(
                        LoginEvent(
                          fcmToken: '',
                          userName: _userNameController.text,
                          password: _passwordController.text,
                          userType: usertype,
                        ),
                      );
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
                      context.goNamed(AuthModule.registerName);
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
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'By continuing, you agree to our ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),

            SizedBox(
              width: AppHelpers.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(LegalModule.termsName);
                    },
                    child: const Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text(
                    ' and ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(LegalModule.policyName);
                    },
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
