import 'dart:developer';

import 'package:excellistravel/features/flight_booking/data/models/filter_data_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';

Drawer flightSearchDrawer({
  required BuildContext context,
  required Function(FilterDataModel filterData, BuildContext context) onApply,
  required Function(BuildContext context) onClear,
  FilterDataModel? initialFilter,
}) {
  final List<Map<String, dynamic>> listOfDepartureTime = [
    {'title': 'Before 6AM', 'icon': 'bf_6', 'name': 'before_6am'},
    {'title': '6AM - 12PM', 'icon': '6_12', 'name': '6_to_12pm'},
    {'title': '12PM - 6PM', 'icon': '12_6', 'name': '12_to_6pm'},
    {'title': 'After 6PM', 'icon': 'af_6', 'name': 'after_6pm'},
  ];

  final List<Map<String, dynamic>> listOfStops = [
    {'title': 'Non Stop', 'name': 'non_stop'},
    {'title': '1 Stop', 'name': '1_stop'},
    {'title': 'Multiple Stop', 'name': 'multiple_stop'},
  ];

  return Drawer(
    child: FilterContent(
      listOfDepartureTime: listOfDepartureTime,
      listOfStops: listOfStops,
      onApply: onApply,
      onClear: onClear,
      initialFilter: initialFilter,
    ),
  );
}

class FilterContent extends StatefulWidget {
  const FilterContent({
    super.key,
    required this.listOfDepartureTime,
    required this.listOfStops,
    required this.onApply,
    required this.onClear,
    this.initialFilter,
  });

  final List<Map<String, dynamic>> listOfDepartureTime;
  final List<Map<String, dynamic>> listOfStops;
  final Function(FilterDataModel filterData, BuildContext context) onApply;
  final Function(BuildContext context) onClear;
  final FilterDataModel? initialFilter;

  @override
  State<FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  String _selectedDepartureTime = '';
  String _selectedStop = '';
  String minPrice = '10';
  String maxPrice = '100';
  RangeValues _rangeValues = const RangeValues(10, 100);

  @override
  void initState() {
    super.initState();
    // Initialize with the current filter values if they exist
    _syncWithInitialFilter();
  }

  @override
  void didUpdateWidget(FilterContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update local state when initialFilter changes (e.g., when reset is triggered)
    if (oldWidget.initialFilter != widget.initialFilter) {
      log('Filter changed - Old: ${oldWidget.initialFilter?.departureTime}, New: ${widget.initialFilter?.departureTime}');
      _syncWithInitialFilter();
    }
  }

  void _syncWithInitialFilter() {
    log('Syncing with initialFilter: DepartureTime=${widget.initialFilter?.departureTime}, Stops=${widget.initialFilter?.stops}');
    setState(() {
      if (widget.initialFilter != null) {
        _selectedDepartureTime = widget.initialFilter!.departureTime ?? '';
        _selectedStop = widget.initialFilter!.stops ?? '';
      } else {
        // If initialFilter is null, clear selections
        _selectedDepartureTime = '';
        _selectedStop = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              // Filter content

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //departure time
                    const Text(
                      'Departure Time',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ...widget.listOfDepartureTime.map(
                          (e) => DepartureTimeCard(
                            isSelected: _selectedDepartureTime == e['name'],
                            onTap: () {
                              setState(() {
                                _selectedDepartureTime = e['name'];
                              });
                            },
                            title: e['title'],
                            icon: e['icon'],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    const Text(
                      'Stops',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),

                    SizedBox(
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...widget.listOfStops.map(
                            (e) => StopChip(
                              title: e['title'],
                              isSelected: _selectedStop == e['name'],
                              onTap: () {
                                setState(() {
                                  _selectedStop = e['name'];
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Price',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),

                    RangeSlider(
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.grey,
                        labels: RangeLabels(
                          _rangeValues.start.round().toString(),
                          _rangeValues.end.round().toString(),
                        ),
                        values: _rangeValues,
                        max: 100,
                        divisions: 10,
                        onChanged: (value) {
                          setState(() {
                            _rangeValues = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            minPrice.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            maxPrice.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )

                    //time-table
                    //price
                    //cabin
                  ],
                ),
              ),
              // Apply button
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: TextButton(
                          onPressed: () {
                            // Clear local state
                            setState(() {
                              _selectedDepartureTime = '';
                              _selectedStop = '';
                            });
                            // Call the clear callback
                            widget.onClear(context);
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(color: AppColors.primary),
                          )),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: AppPrimaryButton(
                        onPressed: () {
                          widget.onApply(
                              FilterDataModel(
                                departureTime: _selectedDepartureTime,
                                stops: _selectedStop,
                                minPrice: null,
                                maxPrice: null,
                              ),
                              context);
                        },
                        title: 'Apply',
                        isLoading: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class DepartureTimeCard extends StatelessWidget {
  const DepartureTimeCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.isSelected,
      required this.onTap});
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.grey),
          ),
          width: 110,
          child: Column(
            children: [
              AppHelpers.svgAsset(
                assetName: icon,
                color: isSelected ? AppColors.primary : AppColors.grey,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
}

class StopChip extends StatelessWidget {
  const StopChip(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.grey),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}
