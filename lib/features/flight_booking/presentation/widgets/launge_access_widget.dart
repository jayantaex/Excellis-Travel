import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';

class LaungeAccessWidget extends StatelessWidget {
  const LaungeAccessWidget({super.key, this.bgColor});
  final Color? bgColor;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        width: AppHelpers.getScreenWidth(context),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: AppHelpers.svgAsset(assetName: 'loungeIcon', isIcon: true),
          title: const Text(
            'Airport Lounge Access',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          subtitle: const Text(
            'Free snacks, Wi-Fi, and workspace',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
          ),
          trailing: const Icon(
            Icons.add_circle_outline_rounded,
            size: 18,
          ),
        ),
      );
}
