import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_drop_down.dart' show AppDropDown;
import '../../../../utils/app_date_picker.dart' show showAppDatePicker;
import '../../../../utils/app_helpers.dart';
import '../../../../utils/app_toast.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';

class TicketFilterSheet extends StatefulWidget {
  const TicketFilterSheet({
    super.key,
    required this.bookingIdController,
    required this.startDateController,
    required this.endDateController,
    required this.onStartDatePicked,
    required this.onEndDatePicked,
    required this.selectedStatus,
    required this.selectedDateType,
    required this.onStatusChanged,
    required this.onDateTypeChanged,
    required this.onSubmitPressed,
  });
  final TextEditingController bookingIdController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function(DateTime) onStartDatePicked;
  final Function(DateTime) onEndDatePicked;
  final String selectedStatus;
  final String selectedDateType;
  final void Function(String?) onStatusChanged;
  final void Function(String?) onDateTypeChanged;
  final void Function() onSubmitPressed;

  @override
  State<TicketFilterSheet> createState() => _TicketFilterSheetState();
}

class _TicketFilterSheetState extends State<TicketFilterSheet> {
  DateTime? startDate;
  DateTime? endDate;
  late String _selectedStatus;
  late String _selectedDateType;
  String _errorMsg = '';

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.selectedStatus;
    _selectedDateType = widget.selectedDateType;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppPrimaryInput(
            suffixIcon: InkWell(
              onTap: () {
                widget.bookingIdController.clear();
              },
              child: const Icon(
                Icons.close_rounded,
                size: 16,
              ),
            ),
            maxCharacters: 50,
            hint: 'Enter your booking reference id',
            label: 'Booking Reference ID',
            controller: widget.bookingIdController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: AppHelpers.getScreenWidth(context) * 0.45,
                  child: AppDropDown(
                    onChanged: (String? value) {
                      _selectedStatus = value ?? '';
                      widget.onStatusChanged(value);
                    },
                    title: 'Status',
                    value: _selectedStatus,
                    label: 'Select status',
                    items: const [
                      DropdownMenuItem(value: '', child: Text('All')),
                      DropdownMenuItem(
                          value: 'confirmed', child: Text('Confirmed')),
                      DropdownMenuItem(
                          value: 'pending', child: Text('Pending')),
                      DropdownMenuItem(
                          value: 'cancelled', child: Text('Cancelled')),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: AppHelpers.getScreenWidth(context) * 0.45,
                  child: SizedBox(
                    height: 50,
                    width: AppHelpers.getScreenWidth(context) * 0.45,
                    child: AppDropDown(
                      onChanged: (String? value) {
                        _selectedDateType = value ?? 'bookingdate';
                        widget.onDateTypeChanged(value);
                      },
                      title: 'Date Type',
                      value: _selectedDateType,
                      label: 'Select date type',
                      items: const [
                        DropdownMenuItem(
                            value: 'bookingdate', child: Text('Booking Date')),
                        DropdownMenuItem(
                            value: 'traveldate', child: Text('Travel Date')),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 50,
            width: AppHelpers.getScreenWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: AppHelpers.getScreenWidth(context) * 0.45,
                  child: AppPrimaryInput(
                    controller: widget.startDateController,
                    suffixIcon: const Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                    maxCharacters: 15,
                    hint: 'Pick up start date',
                    label: 'Start date',
                    onTap: () async {
                      // For booking date: allow past dates only
                      // For travel date: allow past and future dates
                      final bool isBookingDate =
                          _selectedDateType == 'bookingdate';
                      final DateTime now = DateTime.now();
                      final DateTime firstDate = isBookingDate
                          ? DateTime(
                              2020) // Allow dates from 2020 for booking dates
                          : DateTime(
                              2020); // Allow dates from 2020 for travel dates
                      final DateTime lastDate = isBookingDate
                          ? now // Booking dates: up to today
                          : now.add(const Duration(
                              days: 365 *
                                  2)); // Travel dates: up to 2 years in future

                      final DateTime? picked = await showAppDatePicker(
                        context: context,
                        firstDate: firstDate,
                        lastDate: lastDate,
                        initialDate: startDate ?? now,
                      );
                      if (picked != null) {
                        startDate = picked;
                        widget.onStartDatePicked(picked);
                        widget.startDateController.text = AppHelpers.formatDate(
                            picked,
                            pattern: 'dd-MM-yyyy');
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: AppHelpers.getScreenWidth(context) * 0.45,
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
                      if (startDate == null) {
                        showToast(message: 'Please select start date first');
                        return;
                      }

                      // For booking date: allow past dates only
                      // For travel date: allow past and future dates
                      final bool isBookingDate =
                          _selectedDateType == 'bookingdate';
                      final DateTime now = DateTime.now();
                      final DateTime firstDate =
                          startDate!; // End date must be after start date
                      final DateTime lastDate = isBookingDate
                          ? now // Booking dates: up to today
                          : now.add(const Duration(
                              days: 365 *
                                  2)); // Travel dates: up to 2 years in future

                      final DateTime? picked = await showAppDatePicker(
                        context: context,
                        firstDate: firstDate,
                        lastDate: lastDate,
                        initialDate: endDate ??
                            (startDate!.isAfter(now) ? startDate! : now),
                      );
                      if (picked != null) {
                        endDate = picked;
                        if (picked.isBefore(startDate!)) {
                          showToast(
                              message: 'End date cannot be before start date');
                          return;
                        }
                        widget.onEndDatePicked(picked);
                        widget.endDateController.text = AppHelpers.formatDate(
                            picked,
                            pattern: 'dd-MM-yyyy');
                      }
                    },
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 16),

          if (_errorMsg.isNotEmpty)
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              horizontalTitleGap: 0,
              leading: const Icon(Icons.info_outline_rounded,
                  size: 16, color: AppColors.error),
              title: Text(
                _errorMsg,
                style: const TextStyle(
                  color: AppColors.error,
                  fontSize: 12,
                ),
              ),
            ),
          SizedBox(
            height: 50,
            width: AppHelpers.getScreenWidth(context),
            child: AppPrimaryButton(
              bgColor: AppHelpers.isDarkMode(context)
                  ? AppColors.primary
                  : AppColors.black,
              onPressed: () {
                // Clear previous error
                setState(() {
                  _errorMsg = '';
                });

                log('selectedStatus: $_selectedStatus');

                // Validate: Allow filtering by status only, booking ID only, or dates only
                // But require at least one filter criteria
                final bool hasBookingId =
                    widget.bookingIdController.text.isNotEmpty;
                final bool hasStartDate =
                    widget.startDateController.text.isNotEmpty;
                final bool hasEndDate =
                    widget.endDateController.text.isNotEmpty;
                final bool hasStatus = _selectedStatus.isNotEmpty;

                // Check if at least one filter is applied
                if (!hasBookingId &&
                    !hasStartDate &&
                    !hasEndDate &&
                    !hasStatus) {
                  setState(() {
                    _errorMsg =
                        'Filter criteria is not valid. Please select at least one filter criteria.';
                  });
                  return;
                }

                // Validate booking ID length if provided
                if (hasBookingId &&
                    widget.bookingIdController.text.length < 14) {
                  setState(() {
                    _errorMsg =
                        'Invalid booking ID. Make sure you are entering correct booking ID.';
                  });
                  return;
                }

                // Validate date range: if one date is provided, both must be provided
                if (hasStartDate && !hasEndDate) {
                  setState(() {
                    _errorMsg =
                        'End date is required. Please select end date to complete the filter.';
                  });
                  return;
                }

                if (hasEndDate && !hasStartDate) {
                  setState(() {
                    _errorMsg =
                        'Start date is required. Please select start date to complete the filter.';
                  });
                  return;
                }

                // Validate date range: end date must be after start date
                if (hasStartDate &&
                    hasEndDate &&
                    startDate != null &&
                    endDate != null) {
                  if (startDate!.isAfter(endDate!)) {
                    setState(() {
                      _errorMsg =
                          'Make sure you are putting a valid date range';
                    });
                    return;
                  }
                }

                // All validations passed
                widget.onSubmitPressed();
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
          // Status Filter Dropdown
        ],
      );
}
