import 'package:flutter/material.dart';

Future<void> showUpdatingSheet(
    {required BuildContext context,
    required String currentVersion,
    required VoidCallback onPressed,
    required String availabeVersion}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Update Available',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('A newer version availabe for this app.'),
          Text('Current Verison: $currentVersion'),
          Text('Availabe Verison: $availabeVersion'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: const Text(
              'Download',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ))
      ],
    ),
  );
}
