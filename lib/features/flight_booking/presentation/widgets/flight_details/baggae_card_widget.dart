import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';

class BaggaeCardWidget extends StatelessWidget {
  const BaggaeCardWidget(
      {super.key,
      required this.title,
      required this.iconName,
      required this.allowance});
  final String title;
  final String iconName;
  final String allowance;

  @override
  Widget build(BuildContext context) => ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.grey.withOpacity(0.1),
            child: AppHelpers.svgAsset(
                assetName: iconName, isIcon: true, height: 16, width: 16)),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          allowance,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
