import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_sheet.dart';
import 'sale_details_sheet.dart';

import '../../data/models/sates_data_model.dart';

class TrasactionTile extends StatelessWidget {
  const TrasactionTile({super.key, required this.commission});

  final Commissions commission;

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () async {
          await showAppSheet(
              context: context,
              title: 'Transaction Details',
              child: SaleDetailsSheet(commission: commission));
        },
        shape: const Border(),
        leading: const CircleAvatar(
          child: Icon(Icons.flight, size: 16, color: AppColors.primaryLight),
        ),
        title: Text(
            '${commission.booking?.bookingReference ?? commission.bookingId}',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black)),
        subtitle: Text(commission.createdAt ?? '',
            style: const TextStyle(fontSize: 12, color: AppColors.grey)),
        trailing: Text(
          '₹${commission.baseAmount}',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.grey,
          ),
        ),
      );
}
