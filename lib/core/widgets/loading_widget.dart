import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_styles.dart';

class LoadingEffect extends StatelessWidget {
  final double? height;
  final double? width;
  LoadingEffect({super.key, required this.height, required this.width});

  final Color _baseColor = AppColors.white.withOpacity(0.3);
  final Color _highlightColor = AppColors.white.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        height: height ?? 6,
        width: width ?? 45,
      ),
    );
  }
}
