import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../../utils/app_helpers.dart';
import 'primary_button.dart';

Future<void> showAppSheet({
  required BuildContext context,
  required String title,
  required Widget child,
  bool? submitButtonRequired = false,
  String submitButtonTitle = 'Submit',
  VoidCallback? onSubmitPressed,
  VoidCallback? onClosePressed,
}) =>
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: AppHelpers.isDarkMode(context)
          ? AppColors.secondaryDark
          : AppColors.white,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 45,
                width: AppHelpers.getScreenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppHelpers.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        backgroundColor: AppHelpers.isDarkMode(context)
                            ? AppColors.divider.withValues(alpha: 0.1)
                            : AppColors.white,
                        child: IconButton(
                          onPressed: () {
                            onClosePressed?.call();
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 20,
                            color: AppHelpers.isDarkMode(context)
                                ? AppColors.white
                                : AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Divider(
                thickness: 1,
                color: AppColors.grey.withValues(alpha: 0.2),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: child,
              ),
              if (submitButtonRequired == true)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: SizedBox(
                    height: 50,
                    width: AppHelpers.getScreenWidth(context),
                    child: AppPrimaryButton(
                      bgColor: AppHelpers.isDarkMode(context)
                          ? AppColors.primary
                          : AppColors.black,
                      onPressed: onSubmitPressed,
                      title: submitButtonTitle,
                      isLoading: false,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
