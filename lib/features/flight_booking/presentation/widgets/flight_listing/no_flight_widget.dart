import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';

class NoFlightWidget extends StatelessWidget {
  const NoFlightWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppHelpers.getScreenHeight(context) * 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppHelpers.assetImage(
                assetName: 'noFlight', width: 100, height: 100),
            const SizedBox(height: 20),
            const Text(
              'No Flights Found',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No flights found for the selected date range. Please try again with different dates.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      );
}
