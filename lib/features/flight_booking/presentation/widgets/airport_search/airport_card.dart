import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';

class AirportCard extends StatelessWidget {
  final String airportName;
  final String airportCode;
  final String city;
  final Function onAirportSelected;
  const AirportCard(
      {super.key,
      required this.airportName,
      required this.airportCode,
      required this.city,
      required this.onAirportSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            airportCode,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(airportName),
        subtitle: Text(city),
        onTap: () {
          onAirportSelected();
        });
  }
}
