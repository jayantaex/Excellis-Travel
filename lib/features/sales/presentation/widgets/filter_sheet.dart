import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/primary_input.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/primary_button.dart';

Future<void> filterSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: AppHelpers.getScreenWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Filter Options',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black)),
              const SizedBox(height: 20),
              Divider(color: AppColors.grey.withOpacity(0.1), thickness: 1),
              const SizedBox(height: 20),
              const AppPrimaryInput(
                maxCharacters: 50,
                hint: 'Enter your booking reference id',
                label: 'Booking Reference ID',
              ),
              const SizedBox(height: 8),
              AppPrimaryInput(
                suffixIcon: const Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.grey,
                  size: 20,
                ),
                maxCharacters: 50,
                hint: 'Pick up start date',
                label: 'Start date',
                onTap: () async {
                  await showDatePicker(
                    builder: (context, child) => Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.primary,
                        ),
                      ),
                      child: child!,
                    ),
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                  );
                },
              ),
              const SizedBox(height: 8),
              AppPrimaryInput(
                maxCharacters: 50,
                hint: 'Pick up end date ',
                label: 'End date',
                suffixIcon: const Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.grey,
                  size: 20,
                ),
                onTap: () async {
                  await showDatePicker(
                      builder: (context, child) => Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.primary,
                              ),
                            ),
                            child: child!,
                          ),
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now());
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context) * 0.4,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Clear'),
                    ),
                  ),
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context) * 0.4,
                    child: AppPrimaryButton(
                      isLoading: false,
                      onPressed: () => Navigator.pop(context),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      title: 'Apply',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    ),
  );
}
