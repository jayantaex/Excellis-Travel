import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';

class SearchFilterWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  const SearchFilterWidget(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(168),
          color: isSelected ? AppColors.black : AppColors.white,
        ),
        child: Text(
          title,
          style: isSelected
              ? const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white)
              : const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
        ),
      ),
    );
  }
}
