import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../models/flights_data_model.dart';

class SegmentCard extends StatelessWidget {
  final Segment data;
  const SegmentCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          initiallyExpanded: false,
          shape: const Border(),
          title: Text(
            '${data.departure?.iataCode} (T${data.departure?.terminal ?? '1'}) - ${data.arrival?.iataCode}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          collapsedIconColor: AppColors.grey,
          iconColor: AppColors.primary,
          children: [
            //departure
            ListTile(
              leading: const Icon(
                Icons.connecting_airports_outlined,
                size: 18,
                color: AppColors.black,
              ),
              title: Text(
                '${data.departure?.iataCode} (T${data.departure?.terminal ?? '1'})',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${AppHelpers.formatDateTime(
                  data.departure?.at ?? DateTime.now(),
                  pattern: 'dd MMM, yyyy',
                )} | ${AppHelpers.formatTime(
                  data.departure?.at ?? DateTime.now(),
                  pattern: 'hh:MM aa',
                )}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            //arriaval
            ListTile(
              leading: const Icon(
                Icons.connecting_airports_outlined,
                size: 18,
                color: AppColors.black,
              ),
              title: Text(
                '${data.arrival?.iataCode}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${AppHelpers.formatDateTime(
                  data.arrival?.at ?? DateTime.now(),
                  pattern: 'dd MMM, yyyy',
                )} | ${AppHelpers.formatTime(
                  data.arrival?.at ?? DateTime.now(),
                  pattern: 'hh:MMaa',
                )}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
