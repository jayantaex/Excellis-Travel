import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

Future<void> showNotificationDetailsSheet({
  required BuildContext context,
  required String title,
  required String body,
}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) => NotificationDetailsSheet(
      title: title,
      body: body,
    ),
  );
}

class NotificationDetailsSheet extends StatelessWidget {
  final String title;
  final String body;
  const NotificationDetailsSheet(
      {super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 40),
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              Text(
                '$title',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.grey,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
          ),
          const SizedBox(height: 15),
          Text(
            '$body',
          )
        ],
      ),
    );
  }
}
