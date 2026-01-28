import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_styles.dart';
import 'app_helpers.dart';

Future<DateTime?> showAppDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async =>
    await showDatePickerDialog(
      slidersColor:
          AppHelpers.isDarkMode(context) ? AppColors.white : AppColors.black,
      padding: const EdgeInsets.all(16),
      splashColor: AppColors.primary,
      selectedCellDecoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      currentDateDecoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        shape: BoxShape.circle,
      ),
      currentDateTextStyle: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      enabledCellsTextStyle: TextStyle(
        color:
            AppHelpers.isDarkMode(context) ? AppColors.white : AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      selectedCellTextStyle: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
      disabledCellsTextStyle: const TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      daysOfTheWeekTextStyle: const TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      leadingDateTextStyle: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      minDate: firstDate ?? DateTime(2025),
      maxDate: lastDate ?? DateTime(2100),
      selectedDate: initialDate ?? DateTime.now(),
    );
