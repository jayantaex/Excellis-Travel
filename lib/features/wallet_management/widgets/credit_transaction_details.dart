import 'package:excellistravel/utils/title_case.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../utils/app_helpers.dart';
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
          _buildRow(title: 'ID : ', value: data.txnId ?? 'N/A'),
          _buildRow(
              title: 'Date : ',
              value: AppHelpers.formatDate(DateTime.parse(data.dateTime ?? ''),
                  pattern: 'dd MMM, yyyy')),
          _buildRow(
              title: 'Time : ',
              value: AppHelpers.formatTime(DateTime.parse(data.dateTime ?? ''),
                  pattern: 'hh:mm a')),
          _buildRow(title: 'Type : ', value: data.type ?? 'N/A'),
          if (data.recipient != null)
            _buildRow(
                title: 'Recipient : ', value: data.recipient?.email ?? 'N/A'),
          if (data.bookingStatus != null)
            _buildRow(
                title: 'Booking Status : ',
                value: toTitleCase(data.bookingStatus ?? '')),
          if (data.paymentReference != null)
            _buildRow(
                title: 'Payment Reference : ',
                value: data.paymentReference ?? 'N/A'),
          if (data.autoDeductionAttempted != null)
            _buildRow(
                valueColor: data.autoDeductionAttempted == true
                    ? AppColors.success
                    : AppColors.error,
                title: 'Auto Deduction Attempted : ',
                value: data.autoDeductionAttempted == true ? 'Yes' : 'No'),
          if (data.autoDeductionDate != null)
            _buildRow(
                title: 'Auto Deduction Date : ',
                value: AppHelpers.formatDate(
                    DateTime.parse(data.autoDeductionDate ?? ''),
                    pattern: 'dd MMM, yyyy hh:mm a')),
          if (data.reminderSent != null)
            _buildRow(
                title: 'Reminder Sent : ',
                valueColor: data.reminderSent == true
                    ? AppColors.success
                    : AppColors.error,
                value: data.reminderSent == true ? 'Yes' : 'No'),
          _buildRow(
              title: 'Amount : ',
              value: AppHelpers.formatCurrency(data.amount ?? 0.0)),
          if (data.rePaymentStatus != null)
            _buildRow(
                title: 'Repayment Status : ',
                value: toTitleCase(data.rePaymentStatus ?? '')),
          if (data.repaymentDate != null)
            _buildRow(
                title: 'Repayment Date : ',
                value: AppHelpers.formatDate(
                    DateTime.parse(data.repaymentDate ?? ''),
                    pattern: 'dd MMM, yyyy hh:mm a')),
        ],
      );
}

Widget _buildRow(
        {required String title, required String value, Color? valueColor}) =>
    Row(
      children: [
        Text(title,
            style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 12)),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
              color: valueColor ?? AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 10),
        ),
      ],
    );
