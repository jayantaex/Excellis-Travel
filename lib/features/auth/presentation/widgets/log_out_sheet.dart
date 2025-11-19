import 'package:flutter/material.dart';

class LogOutSheet extends StatelessWidget {
  const LogOutSheet({super.key});

  @override
  Widget build(BuildContext context) => const Column(
        children: [
          Text(
              'Are you sure you want to logout? To search flights again, you will need to log in again.'),
          SizedBox(height: 20),
        ],
      );
}
