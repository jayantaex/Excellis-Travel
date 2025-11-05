import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_styles.dart';

class LoadingEffect extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? baseColor;
  final Color? heighLightColor;
  LoadingEffect(
      {super.key,
      required this.height,
      required this.width,
      this.radius,
      this.baseColor,
      this.heighLightColor});

  final Color _baseColor = AppColors.white.withOpacity(0.3);
  final Color _highlightColor = AppColors.white.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? _baseColor,
      highlightColor: heighLightColor ?? _highlightColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: Colors.red,
        ),
        height: height ?? 6,
        width: width ?? 45,
      ),
    );
  }
}
