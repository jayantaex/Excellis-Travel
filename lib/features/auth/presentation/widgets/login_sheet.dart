import 'dart:developer';

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
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        ],
      ),
    );
  }
}
