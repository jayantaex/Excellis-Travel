import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';

class FlightDetailsLoadingWidget extends StatelessWidget {
  const FlightDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppHelpers.getScreenHeight(context) * 0.8,
        width: AppHelpers.getScreenWidth(context),
        child: const Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      );
}
