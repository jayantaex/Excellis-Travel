import 'dart:developer';

import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:excellistravel/core/services/temp_store.dart';
import 'package:flutter/material.dart';

import '../../../data/models/flights_data_model.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    super.key,
    this.dictionaries,
    required this.selectedAircraftCode,
    required this.onSelect,
    required this.aircraftCodes,
  });
  final FlightDictionary? dictionaries;
  final List<String> selectedAircraftCode;
  final Function(String aircraftCode) onSelect;
  final List<String> aircraftCodes;

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.selectedAircraftCode.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.selectedAircraftCode.clear();
                  });
                  Navigator.pop(context);
                },
                child: const Text('Clear'),
              ),
            ),
          ...widget.aircraftCodes.map(
            (e) => ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                Icons.flight,
                color: AppColors.primary,
                size: 32,
              ),
              title: Text(
                TempStore.getAircraftName(e).isNotEmpty
                    ? TempStore.getAircraftName(e)
                    : e,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Code: $e',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              trailing: Checkbox(
                activeColor: AppColors.primary,
                checkColor: AppColors.white,
                value: widget.selectedAircraftCode.contains(e),
                onChanged: (value) {
                  log('$value $e');
                  setState(() {
                    if (value == true) {
                      widget.selectedAircraftCode.add(e);
                    } else {
                      widget.selectedAircraftCode.remove(e);
                    }
                  });
                },
              ),
            ),
          ),
        ],
      );
}
