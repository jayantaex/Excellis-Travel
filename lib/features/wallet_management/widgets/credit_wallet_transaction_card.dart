import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../../utils/app_helpers.dart';
import '../data/models/custom_cr_transaction_model.dart';
import 'credit_transaction_details.dart';
import 'transaction_details_sheet.dart';

class CreditWalletTransactionCard extends StatelessWidget {
  const CreditWalletTransactionCard({
    super.key,
    required this.data,
  });

  final CreditTransactionData data;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: const CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.trending_up_outlined,
              size: 16, color: AppColors.white),
        ),
        title: Text(data.title ?? '',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary)),
        subtitle: Text(data.desc ?? '',
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,
            size: 16, color: AppColors.primary),
        onTap: () {
          showAppSheet(
            context: context,
            title: 'Transaction Details',
            child: CreditTransactionDetails(data: data),
          );
        },
      ));
}
