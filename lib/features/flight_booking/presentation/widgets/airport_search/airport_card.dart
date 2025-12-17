import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';

class AirportCard extends StatelessWidget {
  AirportCard(
      {super.key,
      required this.airportName,
      required this.airportCode,
      required this.city,
      required this.onAirportSelected});
  final String airportName;
  final String airportCode;
  final String city;
  final Function onAirportSelected;
  final Map<String, String> abbreviationMap = {
    'intl': 'international',
    'int': 'international',
    'apt': 'airport',
    'airpt': 'airport',
  };

  String formatAirportName(String input) {
    final words = input
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .map((word) => abbreviationMap[word] ?? word)
        .toList();

    if (!words.contains('airport')) {
      words.add('airport');
    }

    return words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  @override
  Widget build(BuildContext context) => ListTile(
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
      title: Text(formatAirportName(airportName),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: Text(city,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey)),
      onTap: () {
        onAirportSelected();
      });
}
