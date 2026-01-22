import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../utils/title_case.dart';
import '../../data/models/sates_data_model.dart';

class SaleDetailsSheet extends StatelessWidget {
  const SaleDetailsSheet({super.key, required this.commission});
  final Commissions commission;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ContentRow(
            title: 'Booking ID:',
            value:
                '${commission.booking?.bookingReference ?? commission.bookingId}',
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Booking Status:',
            value: toTitleCase(commission.booking?.bookingStatus ?? ''),
            valueStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: commission.booking?.bookingStatus == 'confirmed'
                  ? AppColors.success
                  : AppColors.warning,
            ),
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Payment Status:',
            value: commission.booking?.paymentStatus?.toUpperCase() ?? '',
            valueStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: commission.booking?.paymentStatus == 'paid'
                  ? AppColors.success
                  : AppColors.error,
            ),
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Date:',
            value: AppHelpers.formatDate(
                DateTime.parse(commission.createdAt ?? ''),
                pattern: 'dd MMM, yyyy'),
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Role:',
            value: toTitleCase(commission.user?.role ?? ''),
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Name:',
            value:
                '${toTitleCase(commission.user?.firstName ?? '')} ${toTitleCase(commission.user?.lastName ?? '')}',
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Paid Amount:',
            value: AppHelpers.formatCurrency(
                double.parse(commission.booking?.totalAmount ?? '0.0')),
          ),
          const SizedBox(height: 8),
          ContentRow(
            title: 'Earning:',
            value: AppHelpers.formatCurrency(
                double.parse(commission.markupAmount ?? '0.0')),
            valueStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.success,
            ),
          )
        ],
      );
}

class ContentRow extends StatelessWidget {
  const ContentRow(
      {super.key,
      required this.title,
      required this.value,
      this.titleStyle,
      this.valueStyle});
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.black,
                ),
          ),
          Text(
            value,
            style: valueStyle ??
                const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
          ),
        ],
      );
}
