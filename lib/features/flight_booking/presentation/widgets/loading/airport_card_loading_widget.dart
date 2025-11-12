import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/loading_widget.dart';

class AirportCardLoadingWidget extends StatelessWidget {
  const AirportCardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        title: LoadingEffect(
          baseColor: AppColors.grey.withOpacity(0.05),
          heighLightColor: AppColors.white,
          height: 15,
          width: 120,
        ),
        leading: LoadingEffect(
          height: 20,
          width: 40,
          baseColor: AppColors.grey.withOpacity(0.05),
          heighLightColor: AppColors.white,
        ),
        subtitle: LoadingEffect(
          height: 15,
          width: 80,
          baseColor: AppColors.grey.withOpacity(0.05),
          heighLightColor: AppColors.white,
        ),
      ),
    );
  }
}
