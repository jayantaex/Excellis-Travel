import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../flight_booking_module.dart';
import 'extra_baggage_sheet.dart';

class BaggageAllowanceCard extends StatefulWidget {
  const BaggageAllowanceCard({super.key});

  @override
  State<BaggageAllowanceCard> createState() => _BaggageAllowanceCardState();
}

class _BaggageAllowanceCardState extends State<BaggageAllowanceCard> {
  Map _baggageData = {};
  bool isBaggageAdded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.grey.withOpacity(0.1),
              child: AppHelpers.svgAsset(
                assetName: 'baggage',
                isIcon: true,
                height: 20,
                width: 20,
              ),
            ),
            title: const Text(
              'Cabin',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              '7Kg(1 bag only)/Adult',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
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
            title: const Text(
              'Check-in',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              '15Kg(1 bag only)/Adult',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
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
            title: const Text(
              ' Add extra check-in baggage',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              'allowance starting from 1,800/ 3KG',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
            trailing: InkWell(
              onTap: () async {
                isBaggageAdded
                    ? {
                        _baggageData = {},
                        isBaggageAdded = false,
                        setState(() {})
                      }
                    : await addExtraBaggageSheet(
                        context: context,
                        onDone: (data) {
                          _baggageData = data;
                          isBaggageAdded = true;
                          setState(() {});
                        });
              },
              child: Text(
                isBaggageAdded ? 'CLEAR ALL' : 'ADD',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary),
              ),
            ),
          ),
          _baggageData['items'] != null
              ? Column(
                  children: List.generate(
                      _baggageData['items'].length,
                      (index) => ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    AppColors.grey.withOpacity(0.1),
                                child: AppHelpers.svgAsset(
                                    assetName: 'baggage',
                                    isIcon: true,
                                    height: 20,
                                    width: 20)),
                            title:
                                Text('${_baggageData['items'][index]['title']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                            subtitle:
                                Text('${_baggageData['items'][index]['price']}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    )),
                          )),
                )
              : const SizedBox(),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text(
              'Cancellation refund & date change',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
                'Get refund for cancellations and date changes up to 24 hours before departure',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                )),
            trailing: InkWell(
              onTap: () {
                context.pushNamed(FlightBookingModule.bookingPolicyName);
              },
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
