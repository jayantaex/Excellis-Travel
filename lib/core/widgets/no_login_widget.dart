import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth_module.dart';
import '../constants/app_styles.dart';

class NotLoginWidget extends StatelessWidget {
  const NotLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Center(
          child: Text(
            'It looks like you are not logged in',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            context.goNamed(AuthModule.loginName);
          },
          child: const Text('LOGIN',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.white,
                  fontSize: 14,
                  color: AppColors.white)),
        ),
      ],
    );
}
