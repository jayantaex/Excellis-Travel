import 'package:excellistravel/utils/app_helpers.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

Future<void> recoverPassConfirmation(
    BuildContext context, String email, Function() onProceed) async {
  await showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppHelpers.isDarkMode(context)
                ? AppColors.secondaryDark
                : AppColors.white,
            title: const Text('Confirm email'),
            content: Text(
                'Are you sure you want to proceed?\n We will send a recovery link to $email.'),
            actions: [
              TextButton(
                child: const Text('Cancel',
                    style: TextStyle(color: AppColors.error)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Proceed',
                    style: TextStyle(color: AppColors.success)),
                onPressed: () {
                  onProceed();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
}
