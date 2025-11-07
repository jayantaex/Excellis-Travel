import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/flight_offer_price_model.dart';
import 'fare_breakdown_card.dart';

class FareCard extends StatelessWidget {
  final TravelerPricing data;
  const FareCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.grey.withOpacity(0.05),
        border: Border.all(
          width: 1,
          color: AppColors.grey.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${data.fareOption} ${data.travelerType} (${data.price?.currency})',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Divider(
            color: AppColors.grey.withOpacity(0.3),
            thickness: 0.5,
          ),
          const SizedBox(height: 14),
          const FeatureCard(
            title: 'Cabin Baggage',
            iconName: 'baggage',
            allowance: '7KG (1 bag only)/Adult',
          ),
          const SizedBox(height: 12),
          Divider(
            color: AppColors.grey.withOpacity(0.3),
            thickness: 0.5,
          ),
          const SizedBox(height: 12),
          ...data.fareDetailsBySegment!.map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                        '${e.brandedFare} - ${e.fareDetailsBySegmentClass}'),
                    subtitle: Text(
                      '${e.fareBasis} - ${e.fareDetailsBySegmentClass}',
                      style:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                    trailing: Text(
                      '${e.cabin}',
                      style: const TextStyle(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                  FeatureCard(
                    title: 'Check-in Baggage',
                    iconName: 'baggage',
                    allowance:
                        '${e.includedCheckedBags!.weight} ${e.includedCheckedBags!.weightUnit}(1 bag only)',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FareBreakdownCard(data: data.price),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String iconName;
  final String allowance;
  const FeatureCard(
      {super.key,
      required this.title,
      required this.iconName,
      required this.allowance});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.grey.withOpacity(0.1),
          child: AppHelpers.svgAsset(
              assetName: iconName, isIcon: true, height: 20, width: 20)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        allowance,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
