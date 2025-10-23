import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../widgets/login_sheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      context.mounted ? await showLoginSheet(context) : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Image.asset('assets/images/app_logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
