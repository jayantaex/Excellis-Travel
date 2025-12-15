import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';

Future<void> showNotificationDetailsSheet({
  required BuildContext context,
  required String title,
  required String body,
  IconData? icon,
  Color? color,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => NotificationDetailsSheet(
      title: title,
      body: body,
      icon: icon ?? Icons.notifications_rounded,
      color: color ?? AppColors.primary,
    ),
  );
}

class NotificationDetailsSheet extends StatelessWidget {
  const NotificationDetailsSheet({
    super.key,
    required this.title,
    required this.body,
    required this.icon,
    required this.color,
  });
  final String title;
  final String body;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        width: AppHelpers.getScreenWidth(context),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notification Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 0.5),
            const SizedBox(height: 20),

            // Icon and Title Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Body Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.grey.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.grey.withValues(alpha: 0.1),
                  ),
                ),
                child: Text(
                  body,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey.withValues(alpha: 0.9),
                    height: 1.6,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}
