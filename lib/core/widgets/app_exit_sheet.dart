import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_styles.dart';
import '../utils/app_helpers.dart';
import 'primary_button.dart';

Future<void> showAppExitSheet({required BuildContext context}) async {
  showModalBottomSheet(
      backgroundColor: AppColors.white,
      showDragHandle: false,
      context: context,
      builder: (BuildContext context) => const AppExitSheet());
}

class AppExitSheet extends StatelessWidget {
  const AppExitSheet({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 24),
          AppHelpers.svgAsset(
            assetName: 'sign_out',
            isIcon: true,
            height: 52,
            width: 42,
          ),
          const SizedBox(height: 12),
          const Text(
            'Exit',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Are you sure you want to exit the app?'),
          const SizedBox(height: 25),
          SizedBox(
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    width: AppHelpers.getScreenWidth(context) * 0.4,
                    child: AppPrimaryButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: 'Cancel',
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        isLoading: false)),
                SizedBox(
                  width: AppHelpers.getScreenWidth(context) * 0.4,
                  child: AppPrimaryButton(
                    onPressed: () async {
                      await SystemNavigator.pop();
                    },
                    title: 'Yes',
                    style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    isLoading: false,
                    bgColor: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
}
