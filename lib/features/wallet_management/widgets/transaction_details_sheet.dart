import 'package:excellistravel/utils/title_case.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../utils/app_helpers.dart';

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
          _buildRow(
              title: 'Transaction ID : ',
              value: '$transactionId',
              context: context),
          _buildRow(title: 'Date : ', value: date, context: context),
          _buildRow(
              title: 'Type : ', value: toTitleCase(type), context: context),
          _buildRow(title: 'Amount : ', value: amount, context: context),
          _buildRow(
              title: 'Status : ', value: toTitleCase(status), context: context),
        ],
      );
}

Widget _buildRow(
        {required String title,
        required String value,
        required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12)),
          const Spacer(),
          Container(
            alignment: Alignment.centerRight,
            width: AppHelpers.getScreenWidth(context) * 0.55,
            child: Text(value,
                style: TextStyle(
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 10)),
          ),
        ],
      ),
    );
