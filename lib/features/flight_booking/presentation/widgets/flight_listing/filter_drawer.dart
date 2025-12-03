import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/flights_data_model.dart';

Drawer flightSearchDrawer(
        {required List<String> aircraftCodes,
        required List<String> selectedAircraftCode,
        required FlightDictionary? dictionaries,
        required VoidCallback onApply,
        required BuildContext context}) =>
    Drawer(
      child: SafeArea(
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

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //departure time
                    Text(
                      'Departure Time',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 18),
                    Wrap(
                        // children: [Conta],
                        ),

                    ListTile()
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
                          onPressed: () {},
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
                        onPressed: onApply,
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
      ),
    );

class DepartureTimeCard extends StatelessWidget {
  const DepartureTimeCard({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        width: 100,
        child: Column(
          children: [
            Icon(icon),
            Text(title),
          ],
        ),
      );
}
