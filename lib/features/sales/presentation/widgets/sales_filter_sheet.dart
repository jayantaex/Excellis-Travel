import 'package:excellistravel/utils/app_date_picker.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';

class SalesFilterSheet extends StatefulWidget {
  const SalesFilterSheet({
    super.key,
    required this.bookingIdController,
    required this.startDateController,
    required this.endDateController,
    required this.onStartDatePicked,
    required this.onEndDatePicked,
    required this.onSubmitPressed,
  });

  final TextEditingController bookingIdController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function(DateTime) onStartDatePicked;
  final Function(DateTime) onEndDatePicked;
  final Function() onSubmitPressed;

  @override
  State<SalesFilterSheet> createState() => _SalesFilterSheetState();
}

class _SalesFilterSheetState extends State<SalesFilterSheet> {
  DateTime? startDate;
  DateTime? endDate;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) => SizedBox(
        width: AppHelpers.getScreenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              child: AppPrimaryInput(
                suffixIcon: IconButton(
                    onPressed: () {
                      widget.bookingIdController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.grey,
                      size: 16,
                    )),
                maxCharacters: 16,
                hint: 'Enter your booking reference id',
                label: 'Booking Reference ID',
                controller: widget.bookingIdController,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: AppHelpers.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context) * 0.45,
                    height: 50,
                    child: AppPrimaryInput(
                      controller: widget.startDateController,
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
                          widget.onStartDatePicked(picked);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context) * 0.45,
                    height: 50,
                    child: AppPrimaryInput(
                      controller: widget.endDateController,
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
                          firstDate: DateTime(2025),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.now(),
                        );
                        if (picked != null) {
                          endDate = picked;
                          widget.onEndDatePicked(picked);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (_errorMessage.isNotEmpty)
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 0,
                title: Text(
                  _errorMessage,
                  style: const TextStyle(
                    color: AppColors.error,
                    fontSize: 12,
                  ),
                ),
                leading: const Icon(
                  Icons.error_outline_outlined,
                  size: 16,
                  color: AppColors.error,
                ),
              ),
            SizedBox(
              height: 50,
              width: AppHelpers.getScreenWidth(context),
              child: AppPrimaryButton(
                onPressed: () {
                  // Clear previous error message
                  setState(() {
                    _errorMessage = '';
                  });

                  // Validate: At least one filter criteria must be selected
                  if (widget.bookingIdController.text.isEmpty &&
                      startDate == null &&
                      endDate == null) {
                    setState(() {
                      _errorMessage =
                          'Filter criteria is not matched. Please select at least one filter criteria.';
                    });
                    return;
                  }

                  // Validate: Booking ID must be at least 14 characters if provided
                  if (widget.bookingIdController.text.isNotEmpty &&
                      widget.bookingIdController.text.length < 14) {
                    setState(() {
                      _errorMessage =
                          'Invalid booking ID. Make sure you are entering correct booking ID';
                    });
                    return;
                  }

                  // Validate: If start date is selected, end date must also be selected
                  if (widget.startDateController.text.isNotEmpty &&
                      widget.endDateController.text.isEmpty) {
                    setState(() {
                      _errorMessage =
                          'End date is required to complete the filter.';
                    });
                    return;
                  }

                  // Validate: If end date is selected, start date must also be selected
                  if (widget.endDateController.text.isNotEmpty &&
                      widget.startDateController.text.isEmpty) {
                    setState(() {
                      _errorMessage =
                          'Start date is required to complete the filter.';
                    });
                    return;
                  }

                  // Validate: Start date must be before or equal to end date
                  if (startDate != null &&
                      endDate != null &&
                      startDate!.isAfter(endDate!)) {
                    setState(() {
                      _errorMessage = 'Make sure you are putting correct dates';
                    });
                    return;
                  }

                  // All validations passed
                  widget.onSubmitPressed();
                  Navigator.pop(context);
                },
                title: 'Apply',
                isLoading: false,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      );
}
