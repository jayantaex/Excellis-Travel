import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

Future<void> recoverPassConfirmation(
    BuildContext context, String email, Function() onProceed) async {
  await showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColors.white,
            title: const Text('Confirm email'),
            content: Text(
                'Are you sure you want to proceed?\n We will send a recovery link to $email.'),
            actions: [
              TextButton(
                child: const Text('Proceed'),
                onPressed: () {
                  onProceed();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
}
