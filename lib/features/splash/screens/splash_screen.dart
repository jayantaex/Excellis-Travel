import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reiselab/core/utils/storage_service.dart';

import '../../../core/constants/app_styles.dart';
import '../../auth/auth_module.dart';
import '../../bottom_navigation/bottom_nav_module.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      await _handleAuthentication();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image.asset('assets/images/app_logo.png'),
      ),
    );
  }

  // landle authentication
  Future<void> _handleAuthentication() async {
    try {
      String? asscessToken = await StorageService.getAccessToken();
      String? refreshToken = await StorageService.getAccessToken();

      if ((asscessToken != null && asscessToken.isNotEmpty) &&
          (refreshToken != null && refreshToken.isNotEmpty)) {
        //check if token is valid

        //if token is inValid take another token from api using refresh token

        //if refresh token is inValid go to login

        // if refresh token is valid and got access token successfully then save it to secure storage

        // if api got failed while getting access token then go to login
        if (context.mounted) {
          context.goNamed(BottomNavModule.name);
        }
        return;
      }
      if (context.mounted) {
        context.goNamed(AuthModule.loginName);
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
