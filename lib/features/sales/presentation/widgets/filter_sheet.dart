import 'package:excellistravel/core/utils/app_date_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_input.dart';

class FilterSheet extends StatelessWidget {
  FilterSheet({
    super.key,
    required this.bookingIdController,
    required this.startDateController,
    required this.endDateController,
    required this.onStartDatePicked,
    required this.onEndDatePicked,
  });

  final TextEditingController bookingIdController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function(DateTime) onStartDatePicked;
  final Function(DateTime) onEndDatePicked;

  DateTime? startDate;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: AppHelpers.getScreenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppPrimaryInput(
              suffixIcon: IconButton(
                  onPressed: () {
                    bookingIdController.clear();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.grey,
                    size: 16,
                  )),
              maxCharacters: 50,
              hint: 'Enter your booking reference id',
              label: 'Booking Reference ID',
              controller: bookingIdController,
            ),
            const SizedBox(height: 8),
            AppPrimaryInput(
              controller: startDateController,
              suffixIcon: const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.grey,
                size: 20,
              ),
              maxCharacters: 50,
              hint: 'Pick up start date',
              label: 'Start date',
              onTap: () async {
                final DateTime? picked = await showAppDatePicker(
                  context: context,
                  firstDate: DateTime(2025),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                );
                if (picked != null) {
                  startDate = picked;
                  onStartDatePicked(picked);
                  startDateController.text =
                      AppHelpers.formatDate(picked, pattern: 'yyyy-MM-dd');
                }
              },
            ),
            const SizedBox(height: 8),
            AppPrimaryInput(
              controller: endDateController,
              maxCharacters: 50,
              hint: 'Pick up end date ',
              label: 'End date',
              suffixIcon: const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.grey,
                size: 20,
              ),
              onTap: () async {
                final DateTime? picked = await showAppDatePicker(
                  context: context,
                  firstDate: startDate ?? DateTime(2025),
                  lastDate: DateTime.now(),
                  initialDate: startDate ?? DateTime.now(),
                );
                if (picked != null) {
                  if (startDate != null && picked.isBefore(startDate!)) {
                    // Show error if end date is before start date
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('End date cannot be before start date'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  onEndDatePicked(picked);
                  endDateController.text =
                      AppHelpers.formatDate(picked, pattern: 'yyyy-MM-dd');
                }
              },
            ),
          ],
        ),
      );
}
