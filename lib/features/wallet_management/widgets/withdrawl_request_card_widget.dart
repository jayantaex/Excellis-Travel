import 'package:flutter/material.dart';
import '../../../core/constants/app_styles.dart';

import '../../../core/widgets/app_sheet.dart';
import '../../../utils/app_helpers.dart';
import '../../../utils/title_case.dart';
import '../data/models/withdrawl_request_data_model.dart';
import 'withdrawl_request_details.dart';

class WithdrawlRequestCardWidget extends StatelessWidget {
  const WithdrawlRequestCardWidget(
      {super.key, this.request, this.onCancelRequest});
  final Requests? request;
  final VoidCallback? onCancelRequest;

  @override
  Widget build(BuildContext context) => request != null
      ? ListTile(
          onTap: () async {
            await showAppSheet(
                context: context,
                title: 'Withdrawal Request Details',
                child: WithdrawlRequestDetails(request: request),
                submitButtonTitle: 'Cancel Request',
                submitButtonRequired:
                    request?.status == 'pending' ? true : false,
                onSubmitPressed: onCancelRequest);
          },
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(Icons.monetization_on_outlined,
              size: 26, color: AppColors.primary),
          title: Text('Amount: ₹${request?.amount ?? ''}'),
          subtitle: Text(
            'Requested by: ${request?.requester?.firstName ?? ''} ${request?.requester?.lastName ?? ''}',
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                toTitleCase(request?.status ?? ''),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: getColorByStatus(request?.status ?? '')),
              ),
              const SizedBox(height: 4),
              Text(
                AppHelpers.formatDate(
                    DateTime.parse(request?.requestedAt ?? ''),
                    pattern: 'dd MMM, yyyy'),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary),
              ),
            ],
          ),
        )
      : const SizedBox.shrink();
}

Color getColorByStatus(String status) {
  switch (status) {
    case 'pending':
      return AppColors.warning;
    case 'approved':
      return AppColors.success;
    case 'rejected':
      return AppColors.error;
    case 'cancelled':
      return AppColors.textDisabled;
    default:
      return AppColors.textSecondary;
  }
}
