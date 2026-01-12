import 'package:flutter/material.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../../utils/app_helpers.dart';
import '../../../utils/title_case.dart';
import 'transaction_details_sheet.dart';

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
    required this.status,
    this.description,
    this.transactionId,
  });

  final String title;
  final String date;
  final String amount;
  final String type; // 'credit' or 'debit'
  final String status; // 'pending' or 'approved' or 'rejected'
  final String? description;
  final String? transactionId;

  @override
  Widget build(BuildContext context) {
    final bool isCredit = type.toLowerCase() == 'credit';

    return InkWell(
      onTap: () async {
        await showAppSheet(
            context: context,
            title: 'Transaction Details',
            child: TransactionDetailsSheet(
              title: title,
              date: date,
              amount: amount,
              type: type,
              status: status,
              description: description,
              transactionId: transactionId,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppHelpers.isDarkMode(context)
              ? AppColors.cardDark
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppHelpers.isDarkMode(context)
                ? AppColors.border.withValues(alpha: 0.1)
                : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Icon Container
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isCredit
                        ? AppColors.success.withValues(alpha: 0.1)
                        : AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isCredit
                        ? Icons.arrow_downward_rounded
                        : Icons.arrow_upward_rounded,
                    color: isCredit ? AppColors.success : AppColors.error,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                // Transaction Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppHelpers.isDarkMode(context)
                              ? AppColors.white
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (description != null && description!.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          description!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.textHint,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${isCredit ? '+' : '-'} ₹$amount',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isCredit ? AppColors.success : AppColors.error,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 5,
                          color: getColorByStatus(status),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          toTitleCase(status),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: getColorByStatus(status),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color getColorByStatus(String status) {
  switch (status) {
    case 'pending':
      return AppColors.warning;
    case 'completed':
      return AppColors.success;
    case 'cancelled':
      return AppColors.error;
    default:
      return AppColors.textSecondary;
  }
}
