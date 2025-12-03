import 'package:excellistravel/core/utils/app_date_picker.dart';
import 'package:excellistravel/core/widgets/app_drop_down.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/app_toast.dart';
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
                    onChanged: widget.onStatusChanged,
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
                          value: 'cancel', child: Text('Cancelled')),
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
                      onChanged: widget.onDateTypeChanged,
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
                      final DateTime? picked = await showAppDatePicker(
                        context: context,
                        firstDate: DateTime(2025),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
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
                      final DateTime? picked = await showAppDatePicker(
                        context: context,
                        firstDate: startDate ?? DateTime(2025),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                      );
                      if (picked != null) {
                        endDate = picked;
                        if (startDate == null) {
                          showToast(message: 'Please select start date first');
                          return;
                        }

                        if (startDate != null && picked.isBefore(startDate!)) {
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
              onPressed: () {
                if (widget.bookingIdController.text.isEmpty &&
                    startDate == null &&
                    endDate == null) {
                  setState(() {
                    _errorMsg =
                        'Filter criteria is not valid. Please select at least one filter criteria.';
                  });
                  return;
                }

                if (widget.bookingIdController.text.isNotEmpty &&
                    widget.bookingIdController.text.length < 14) {
                  setState(() {
                    _errorMsg =
                        'Invalid booking ID. Make sure you are entering correct booking ID.';
                  });
                  return;
                }

                if (widget.startDateController.text.isNotEmpty &&
                    widget.endDateController.text.isEmpty) {
                  _errorMsg =
                      'End date is required. Please select end date to complete the filter.';
                  setState(() {});
                  return;
                }

                if (widget.endDateController.text.isNotEmpty &&
                    widget.startDateController.text.isEmpty) {
                  _errorMsg =
                      'Start date is required. Please select start date to complete the filter.';
                  setState(() {});
                  return;
                }

                if (widget.startDateController.text.isNotEmpty &&
                    widget.endDateController.text.isNotEmpty &&
                    startDate!.isAfter(endDate!)) {
                  _errorMsg = 'Make sure you are putting a valid date range';
                  setState(() {});
                  return;
                }

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
