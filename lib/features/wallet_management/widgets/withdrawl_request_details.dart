import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../utils/app_helpers.dart';
import '../../../utils/title_case.dart';
import '../data/models/withdrawl_request_data_model.dart';

class WithdrawlRequestDetails extends StatelessWidget {
  const WithdrawlRequestDetails({super.key, required this.request});
  final Requests? request;

  @override
  Widget build(BuildContext context) => request != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(
                context: context,
                title: 'Amount: ',
                value: '₹${request?.amount ?? ''}'),
            const SizedBox(height: 8),
            _buildRow(
                context: context,
                title: 'Requested by: ',
                value: toTitleCase(
                    '${request?.requester?.firstName ?? ''} ${request?.requester?.lastName ?? ''}')),
            const SizedBox(height: 8),
            _buildRow(
                context: context,
                title: 'Requested at: ',
                value: AppHelpers.formatDate(
                    DateTime.parse(request?.requestedAt ?? ''),
                    pattern: 'dd MMM, yyyy')),
            const SizedBox(height: 8),
            _buildRow(
              context: context,
              title: 'Status: ',
              value: toTitleCase(request?.status ?? ''),
            ),
            const SizedBox(height: 8),
            _buildRow(
                context: context,
                title: 'Remark: ',
                value: toTitleCase(request?.metadata?.remark ?? 'N/A')),
          ],
        )
      : const SizedBox.shrink();
}

Widget _buildRow(
        {required String title,
        required String value,
        required BuildContext context}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppHelpers.isDarkMode(context)
                  ? AppColors.white
                  : AppColors.textPrimary),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary),
        ),
      ],
    );
