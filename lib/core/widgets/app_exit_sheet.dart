import 'package:flutter/material.dart';

import '../utils/app_helpers.dart';

class AppExitSheet extends StatelessWidget {
  const AppExitSheet({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: AppHelpers.getScreenWidth(context),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 12),
            Text(
                'Are you sure you want to exit the app? \nAny unsaved progress may be lost, and you will need to reopen the application to continue your session.'),
            SizedBox(height: 25),
          ],
        ),
      );
}
