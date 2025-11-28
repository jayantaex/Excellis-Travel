import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../data/models/ticket_model.dart';

class BillingInfo extends StatelessWidget {
  const BillingInfo({super.key, this.billingAddress, this.contactDetails});
  final BillingAddress? billingAddress;
  final ContactDetails? contactDetails;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ItemRow(
              title: 'Address 1',
              value: '${billingAddress?.addressLine1 ?? ''} ',
            ),
            ItemRow(
              title: 'Address 2',
              value: '${billingAddress?.addressLine2 ?? ''} ',
            ),
            ItemRow(
              title: 'City',
              value: '${billingAddress?.city ?? ''} ',
            ),
            ItemRow(
              title: 'State',
              value: '${billingAddress?.state ?? ''} ',
            ),
            ItemRow(
              title: 'Pin Code',
              value: '${billingAddress?.pinCode ?? ''} ',
            ),
            ItemRow(
              title: 'Country',
              value: '${billingAddress?.country ?? ''} ',
            ),
            const ItemRow(
              title: '',
              value: '',
            ),
            const ItemRow(
              title: '',
              value: '',
            ),
            ItemRow(
              title: 'Email',
              value: '${contactDetails?.email ?? ''} ',
            ),
            ItemRow(
              title: 'Phone',
              value: '${contactDetails?.phoneNumber ?? ''} ',
            ),
            ItemRow(
              title: 'Country Code',
              value: '${contactDetails?.countryCode ?? ''} ',
            )
          ],
        ),
      );
}

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            )
          ],
        ),
      );
}
