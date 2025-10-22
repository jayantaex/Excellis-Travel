import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reiselab/core/utils/storage_service.dart';
import 'package:reiselab/features/auth/auth_module.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';

Future<void> showLogoutSheet({required BuildContext context}) async {
  showModalBottomSheet(
      backgroundColor: AppColors.white,
      showDragHandle: true,
      context: context,
      builder: (context) => const LogOutSheet());
}

class LogOutSheet extends StatelessWidget {
  const LogOutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            '${AppConstants.assetIcontUrl}sign_out.svg',
            height: 52,
            width: 42,
            colorFilter:
                const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          const Text(
            'Sign Out',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('You will be logged out of your account.'),
          const SizedBox(height: 55),
          SizedBox(
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: AppHelpers.getScreenWidth(context) * 0.4,
                    child: AppPrimaryButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: 'Cancel',
                        isLoading: false)),
                SizedBox(
                  width: AppHelpers.getScreenWidth(context) * 0.4,
                  child: AppPrimaryButton(
                    onPressed: () async {
                      await StorageService.clearTokens();
                      context.mounted
                          ? context.goNamed(AuthModule.loginName)
                          : null;
                    },
                    title: 'Sign Out',
                    isLoading: false,
                    bgColor: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 35)
        ],
      ),
    );
  }
}
