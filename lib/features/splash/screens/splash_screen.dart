import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../core/constants/app_styles.dart';
import '../../auth/auth_module.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(AuthModule.loginName);
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
}
