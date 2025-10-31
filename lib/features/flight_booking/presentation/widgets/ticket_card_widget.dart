import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../flight_booking_module.dart';
import '../../models/flights_data_model.dart';

class TicketCardWidget extends StatelessWidget {
  final FareDetailsBySegment data;
  const TicketCardWidget({super.key, required this.data});

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
              '${data.brandedFareLabel}',
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
          FeatureCard(
            title: 'Cabin Baggage',
            iconName: 'baggage',
            allowance:
                '${data.includedCabinBags?.weight}${data.includedCabinBags?.weightUnit}(1 bag only)/Adult',
          ),
          FeatureCard(
            title: 'Check-in Baggage',
            iconName: 'baggage',
            allowance:
                '${data.includedCheckedBags?.weight}${data.includedCheckedBags?.weightUnit}(1 bag only)/Adult',
          ),
          const SizedBox(height: 12),
          Divider(
            color: AppColors.grey.withOpacity(0.3),
            thickness: 0.5,
          ),
          const SizedBox(height: 14),
          ...data.amenities!.map((amenity) {
            return AminityCard(
              title: amenity.description ?? '',
              isChargeable: amenity.isChargeable ?? false,
            );
          }),
          const SizedBox(height: 24),
          SizedBox(
            height: 45,
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45,
                  width: AppHelpers.getScreenWidth(context) * 0.3,
                  // child: TextButton(
                  //     onPressed: () {},
                  //     child: const Text('Lock In',
                  //         style: TextStyle(
                  //             fontSize: 14, fontWeight: FontWeight.w400))),
                ),
                SizedBox(
                  height: 35,
                  width: AppHelpers.getScreenWidth(context) * 0.25,
                  child: AppPrimaryButton(
                      onPressed: () {
                        context.pushNamed(
                          FlightBookingModule.passengerDetailsNewName,
                        );
                      },
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                      title: 'Book now',
                      isLoading: false),
                )
              ],
            ),
          )
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

class AminityCard extends StatelessWidget {
  final String title;
  final bool isChargeable;
  const AminityCard(
      {super.key, required this.title, required this.isChargeable});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: AppHelpers.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppHelpers.getScreenWidth(context) * 0.65,
            child: Row(
              children: [
                const Icon(Icons.done_rounded,
                    color: AppColors.success, size: 16),
                const SizedBox(width: 8),
                Text(
                  title.toLowerCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ),
          Text(
            isChargeable ? 'Chargeable' : 'Free',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w400,
              color: isChargeable ? AppColors.error : AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
