import 'package:excellistravel/core/widgets/app_drop_down.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
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
    required this.onStatusChanged,
  });
  final TextEditingController bookingIdController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function(DateTime) onStartDatePicked;
  final Function(DateTime) onEndDatePicked;
  final String selectedStatus;
  final void Function(String?) onStatusChanged;

  @override
  State<TicketFilterSheet> createState() => _TicketFilterSheetState();
}

class _TicketFilterSheetState extends State<TicketFilterSheet> {
  DateTime? startDate;
  late String _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppPrimaryInput(
            maxCharacters: 50,
            hint: 'Enter your booking reference id',
            label: 'Booking Reference ID',
            controller: widget.bookingIdController,
          ),
          const SizedBox(height: 16),
          AppPrimaryInput(
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
              final DateTime? picked = await showDatePicker(
                builder: (context, child) => Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: AppColors.primary,
                    ),
                  ),
                  child: child!,
                ),
                context: context,
                firstDate: DateTime(2025),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
              );
              if (picked != null) {
                startDate = picked;
                widget.onStartDatePicked(picked);
                widget.startDateController.text =
                    AppHelpers.formatDate(picked, pattern: 'dd-MM-yyyy');
              }
            },
          ),
          const SizedBox(height: 16),
          AppPrimaryInput(
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
              final DateTime? picked = await showDatePicker(
                  builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: AppColors.primary,
                          ),
                        ),
                        child: child!,
                      ),
                  context: context,
                  firstDate: startDate ?? DateTime(2025),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now());
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
                widget.onEndDatePicked(picked);
                widget.endDateController.text =
                    AppHelpers.formatDate(picked, pattern: 'dd-MM-yyyy');
              }
            },
          ),
          const SizedBox(height: 16),
          // Status Filter Dropdown
          AppDropDown(
            onChanged: widget.onStatusChanged,
            title: 'Status',
            value: _selectedStatus,
            label: 'Select status',
            items: const [
              DropdownMenuItem(value: '', child: Text('All')),
              DropdownMenuItem(value: 'confirmed', child: Text('Confirmed')),
              DropdownMenuItem(value: 'pending', child: Text('Pending')),
              DropdownMenuItem(value: 'cancel', child: Text('Cancelled')),
            ],
          ),
        ],
      );
}
