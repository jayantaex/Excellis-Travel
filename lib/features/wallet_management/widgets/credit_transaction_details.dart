import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../utils/app_helpers.dart';
import '../../../utils/title_case.dart';
import '../data/models/custom_cr_transaction_model.dart';

class CreditTransactionDetails extends StatelessWidget {
  const CreditTransactionDetails({
    super.key,
    required this.data,
  });
  final CreditTransactionData data;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _buildRow(
              title: 'Transaction ID : ',
              value: data.txnId ?? 'N/A',
              context: context),
          _buildRow(
              title: 'Amount : ',
              value: AppHelpers.formatCurrency(data.amount ?? 0.0),
              context: context),
          _buildRow(
              title: 'Used for : ', value: data.desc ?? '', context: context),
          _buildRow(
              title: 'Date : ',
              value: AppHelpers.formatDate(
                  DateTime.parse(data.dateTime ?? '').toLocal(),
                  pattern: 'dd MMM, yyyy'),
              context: context),
          _buildRow(
              title: 'Time : ',
              value: AppHelpers.formatTime(
                  DateTime.parse(data.dateTime ?? '').toLocal(),
                  pattern: 'hh:mm a'),
              context: context),
          _buildRow(
              title: 'Type : ',
              value: toTitleCase(data.type ?? ''),
              context: context),
          if (data.recipient != null)
            _buildRow(
                title: 'Recipient : ',
                value: data.recipient?.email ?? 'N/A',
                context: context),
          if (data.bookingStatus != null)
            _buildRow(
                title: 'Booking Status : ',
                value: toTitleCase(data.bookingStatus ?? ''),
                context: context),
          if (data.paymentReference != null)
            _buildRow(
                title: 'Payment Reference : ',
                value: data.paymentReference ?? 'N/A',
                context: context),
          if (data.autoDeductionAttempted != null)
            _buildRow(
                valueColor: data.autoDeductionAttempted == true
                    ? AppColors.success
                    : AppColors.error,
                title: 'Auto Deduction Attempted : ',
                value: data.autoDeductionAttempted == true ? 'Yes' : 'No',
                context: context),
          if (data.autoDeductionDate != null)
            _buildRow(
                title: 'Auto Deduction Date : ',
                value: AppHelpers.formatDate(
                    DateTime.parse(data.autoDeductionDate ?? ''),
                    pattern: 'dd MMM, yyyy hh:mm a'),
                context: context),
          if (data.reminderSent != null)
            _buildRow(
                title: 'Reminder Sent : ',
                valueColor: data.reminderSent == true
                    ? AppColors.success
                    : AppColors.error,
                value: data.reminderSent == true ? 'Yes' : 'No',
                context: context),
          if (data.rePaymentStatus != null)
            _buildRow(
                title: 'Repayment Status : ',
                value: toTitleCase(data.rePaymentStatus ?? ''),
                context: context),
          if (data.repaymentDate != null)
            _buildRow(
                title: 'Repayment Date : ',
                value: AppHelpers.formatDate(
                    DateTime.parse(data.repaymentDate ?? ''),
                    pattern: 'dd MMM, yyyy hh:mm a'),
                context: context),
        ],
      );
}

Widget _buildRow(
        {required String title,
        required String value,
        Color? valueColor,
        required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
                color: valueColor ??
                    (AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.textPrimary),
                fontWeight: FontWeight.w600,
                fontSize: 10),
          ),
        ],
      ),
    );
