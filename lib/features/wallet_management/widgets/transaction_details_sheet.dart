import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';

class TransactionDetailsSheet extends StatelessWidget {
  const TransactionDetailsSheet({
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
  Widget build(BuildContext context) => Column(
        children: [
          _buildRow(title: 'ID : ', value: transactionId ?? 'N/A'),
          _buildRow(title: 'Date : ', value: date),
          _buildRow(title: 'Type : ', value: type),
          _buildRow(title: 'Amount : ', value: amount),
          _buildRow(title: 'Status : ', value: status),
        ],
      );
}

Widget _buildRow({required String title, required String value}) => Row(
      children: [
        Text(title,
            style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 12)),
        const Spacer(),
        Text(value,
            style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 10)),
      ],
    );
