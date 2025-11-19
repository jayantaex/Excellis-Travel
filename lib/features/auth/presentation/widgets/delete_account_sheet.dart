import 'package:flutter/material.dart';

class DeleteAccountSheet extends StatelessWidget {
  const DeleteAccountSheet({super.key});

  @override
  Widget build(BuildContext context) => const Column(
        children: [
          Text(
              'Are you sure you want to delete your account? this action cannot be undone. Once you delete your account, you will not be able to access your account again also your data will be deleted.'),
          SizedBox(height: 20),
        ],
      );
}
