import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reiselab/core/utils/app_helpers.dart';
import '../../../../core/constants/app_styles.dart';
import '../../bloc/auth_bloc.dart';
import '../widgets/login_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          log('Auth states :::: $state');
          if (state is AuthError) {
            AppHelpers.showSnackBar(context, state.message,
                backgroundColor: AppColors.error, showCloseButton: true);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Image.asset('assets/images/app_logo.png'),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 120),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    log('Auth states :::: $state');
                  },
                  builder: (context, state) {
                    return LoginSheet(
                      isLoading: state is AuthLoading,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
