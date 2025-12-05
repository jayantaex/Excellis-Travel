import 'dart:developer';

import 'package:excellistravel/core/utils/airline_image_provider.dart';
import 'package:excellistravel/features/flight_booking/data/models/filter_data_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/airline_model.dart';

Drawer flightSearchDrawer({
  required BuildContext context,
  required Function(FilterDataModel filterData, BuildContext context) onApply,
  required Function(BuildContext context) onClear,
  FilterDataModel? initialFilter,
  required double minOfferFare,
  required double maxOfferFare,
  required double minPublishedFare,
  required double maxPublishedFare,
  required List<AirlineModel> airlines,
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
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    child: FilterContent(
      listOfDepartureTime: listOfDepartureTime,
      listOfStops: listOfStops,
      onApply: onApply,
      onClear: onClear,
      initialFilter: initialFilter,
      minOfferFare: minOfferFare,
      maxOfferFare: maxOfferFare,
      minPublishedFare: minPublishedFare,
      maxPublishedFare: maxPublishedFare,
      airlines: airlines,
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
    required this.minOfferFare,
    required this.maxOfferFare,
    required this.minPublishedFare,
    required this.maxPublishedFare,
    required this.airlines,
  });

  final List<Map<String, dynamic>> listOfDepartureTime;
  final List<Map<String, dynamic>> listOfStops;
  final List<AirlineModel> airlines;

  final Function(FilterDataModel filterData, BuildContext context) onApply;
  final Function(BuildContext context) onClear;
  final FilterDataModel? initialFilter;
  final double minOfferFare;
  final double maxOfferFare;
  final double minPublishedFare;
  final double maxPublishedFare;

  @override
  State<FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  String _selectedDepartureTime = '';
  String _selectedStop = '';
  RangeValues? _rangeValues;
  final List<String> _selectedAirlines = [];

  RangeValues get _currentRange =>
      _rangeValues ?? RangeValues(widget.minOfferFare, widget.maxPublishedFare);

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
    setState(() {
      if (widget.initialFilter != null) {
        _selectedDepartureTime = widget.initialFilter?.departureTime ?? '';
        _selectedStop = widget.initialFilter?.stops ?? '';
        final double lower =
            (widget.initialFilter?.minOfferFare ?? widget.minOfferFare)
                .clamp(widget.minOfferFare, widget.maxPublishedFare)
                .toDouble();
        final double upper =
            (widget.initialFilter?.maxPublishedFare ?? widget.maxPublishedFare)
                .clamp(widget.minOfferFare, widget.maxPublishedFare)
                .toDouble();
        _rangeValues =
            lower <= upper ? RangeValues(lower, upper) : _currentRange;

        // Sync selected airlines
        _selectedAirlines.clear();
        if (widget.initialFilter?.aircraftCodes != null) {
          _selectedAirlines.addAll(widget.initialFilter!.aircraftCodes!);
        }
      } else {
        // If initialFilter is null, clear selections
        _selectedAirlines.clear();
        _selectedDepartureTime = '';
        _selectedStop = '';
        _rangeValues =
            RangeValues(widget.minOfferFare, widget.maxPublishedFare);
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //departure time
                      const Text(
                        'Departure Time',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      RangeSlider(
                        divisions: 100,
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.grey,
                        labels: RangeLabels(
                          _currentRange.start.toStringAsFixed(2),
                          _currentRange.end.toStringAsFixed(2),
                        ),
                        values: _currentRange,
                        max: widget.maxPublishedFare,
                        min: widget.minOfferFare,
                        onChanged: (value) {
                          setState(() {
                            _rangeValues = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹${_currentRange.start.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '₹${_currentRange.end.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Airlines',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      ...widget.airlines.map(
                        (airline) => ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          minVerticalPadding: 0,
                          leading: SizedBox(
                              height: 35,
                              width: 45,
                              child: getAirlineLogo(airlineCode: airline.code)),
                          title: Text(
                            '${airline.name} (${airline.totalFlights})',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          trailing: Checkbox(
                            activeColor: AppColors.primary,
                            value: _selectedAirlines.contains(airline.code),
                            onChanged: (value) {
                              setState(
                                () {
                                  if (value != null) {
                                    if (value) {
                                      _selectedAirlines.add(airline.code);
                                    } else {
                                      _selectedAirlines.remove(airline.code);
                                    }
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
                              _selectedAirlines.clear();
                              _rangeValues = RangeValues(
                                widget.minOfferFare,
                                widget.maxPublishedFare,
                              );
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
                                minPublishedFare: _currentRange.start,
                                maxPublishedFare: _currentRange.end,
                                minOfferFare: _currentRange.start,
                                maxOfferFare: _currentRange.end,
                                aircraftCodes:
                                    List<String>.from(_selectedAirlines),
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
