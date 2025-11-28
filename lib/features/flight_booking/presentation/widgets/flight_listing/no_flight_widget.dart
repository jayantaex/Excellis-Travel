import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';

class NoFlightWidget extends StatelessWidget {
  const NoFlightWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.white,
            child: AppHelpers.assetImage(assetName: 'noFlight'),
          ),
          const SizedBox(height: 20),
          const Text(
            'No Flights Found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No flights found for the selected date range. Please try again with different dates.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ],
      );
}
