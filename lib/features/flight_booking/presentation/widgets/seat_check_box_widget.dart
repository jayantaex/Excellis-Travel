import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class SeatCheckBoxWidget extends StatelessWidget {
  final bool isSelected;
  final bool isBooked;
  final bool onLeft;
  final Function onTap;
  final String? tag;
  final String? id;
  const SeatCheckBoxWidget(
      {super.key,
      required this.isSelected,
      required this.isBooked,
      required this.onLeft,
      required this.onTap,
      this.tag,
      this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isBooked
          ? null
          : () {
              onTap(id);
            },
      child: Container(
          alignment: Alignment.center,
          height: AppHelpers.getScreenWidth(context) * 0.1,
          width: AppHelpers.getScreenWidth(context) * 0.1,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary
                : isBooked
                    ? onLeft
                        ? const Color(0XFF9F4018)
                        : const Color(0XFF827975)
                    : AppColors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: isSelected
              ? const Icon(Icons.done_rounded, color: AppColors.white)
              : null),
    );
  }
}
