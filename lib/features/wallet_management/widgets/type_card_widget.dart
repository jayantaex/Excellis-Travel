import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';

class TypeCardWidget extends StatelessWidget {
  const TypeCardWidget({super.key, required this.type, required this.value});
  final String type;
  final String value;

  @override
  Widget build(BuildContext context) {
    final bool isCredit = type == 'cr';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isCredit
              ? [
                  AppColors.white.withOpacity(0.25),
                  AppColors.white.withOpacity(0.15),
                ]
              : [
                  AppColors.white.withOpacity(0.2),
                  AppColors.white.withOpacity(0.1),
                ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.white.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon and Label Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  isCredit
                      ? Icons.arrow_downward_rounded
                      : Icons.arrow_upward_rounded,
                  size: 18,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isCredit ? 'Total Credits' : 'Total Debits',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),

          // Amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '₹$value',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
