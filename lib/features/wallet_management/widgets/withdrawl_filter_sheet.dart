import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../utils/title_case.dart';

class WithdrawlFilterSheet extends StatelessWidget {
  const WithdrawlFilterSheet(
      {super.key,
      required this.statuses,
      required this.selectedStatus,
      required this.onSelect});
  final List<String> statuses;
  final String selectedStatus;
  final Function(String status) onSelect;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Status',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var status in statuses)
                  InkWell(
                    onTap: () {
                      onSelect(status);
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedStatus == status
                              ? AppColors.primary
                              : AppColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        toTitleCase(status),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: selectedStatus == status
                                ? AppColors.primary
                                : AppColors.textPrimary),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      );
}
