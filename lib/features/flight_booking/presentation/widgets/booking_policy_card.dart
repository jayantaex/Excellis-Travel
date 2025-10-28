import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class BookingPolicyCard extends StatelessWidget {
  const BookingPolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.grey.withOpacity(0.1),
                child: AppHelpers.svgAsset(
                    assetName: 'baggage', isIcon: true, height: 20, width: 20)),
            title: const Text('Cabin',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
            subtitle: const Text(
              '7Kg(1 bag only)/Adult',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.grey.withOpacity(0.1),
                child: AppHelpers.svgAsset(
                    assetName: 'baggage', isIcon: true, height: 20, width: 20)),
            title: const Text('Check-in',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
            subtitle: const Text(
              '15Kg(1 bag only)/Adult',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.grey.withOpacity(0.1),
                child: AppHelpers.svgAsset(
                    assetName: 'baggage', isIcon: true, height: 20, width: 20)),
            title: const Text(' Add extra check-in baggage',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
            subtitle: const Text(
              'allowance starting from 1,800/ 3KG',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const CircleAvatar(
                child: Icon(Icons.add, color: AppColors.secondary)),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text('Cancellation refund & date change',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: const Text(
              'Get refund for cancellations and date changes up to 24 hours before departure',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
            trailing: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
