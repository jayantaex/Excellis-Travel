import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
  });
  final String title;
  final String message;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.lg),
          decoration: BoxDecoration(
            color: AppHelpers.isDarkMode(context)
                ? AppColors.secondaryDark
                : AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSizes.md),

              // Title
              Text(
                title,
                style: TextStyle(
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.sm),

              // Message
              Text(
                message,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.lg),

              // Buttons
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: TextButton.styleFrom(
                        foregroundColor: AppHelpers.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.textPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),

                  const SizedBox(width: AppSizes.md),

                  // Delete Button
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        onConfirm();
                      },
                      child: Text('Delete',
                          style: TextStyle(
                            color: AppHelpers.isDarkMode(context)
                                ? AppColors.error
                                : AppColors.error,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

// Helper function to show the dialog
Future<bool?> showDeleteConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) =>
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) => DeleteConfirmationDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
      ),
    );
