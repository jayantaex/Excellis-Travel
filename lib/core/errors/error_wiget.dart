import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class AppErrorWidget {
  static void show(
      {required WidghetType type,
      required BuildContext context,
      required String message,
      String? title,
      String? pageName,
      Image? image,
      required VoidCallback onOk}) {
    switch (type) {
      case WidghetType.snackBar:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.error,
          content: Text(
            message,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ));
        break;
      case WidghetType.dialog:
        break;
      case WidghetType.bottomSheet:
        break;
      case WidghetType.screen:
        break;
    }
  }
}

enum WidghetType { snackBar, dialog, bottomSheet, screen }
