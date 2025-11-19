import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: AppHelpers.getScreenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
          ],
        ),
      );
}
