import 'package:excellistravel/features/flight_booking/data/models/air_port_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';

class TrendingSearches extends StatelessWidget {
  TrendingSearches({super.key, required this.onTrendingSearchTap});
  final Function(AirportModel departure, AirportModel arrival)
      onTrendingSearchTap;

  final List<Map<String, dynamic>> trendingSearches = [
    {
      'departure': AirportModel(
          name: 'Indira Gandhi International Airport',
          iataCode: 'DEL',
          address: Address(cityName: 'Delhi')),
      'arrival': AirportModel(
          name: 'Kempegowda International Airport',
          iataCode: 'BLR',
          address: Address(cityName: 'Bangalore')),
    },
    {
      'departure': AirportModel(
          name: 'Chhatrapati Shivaji Maharaj International Airport',
          iataCode: 'BOM',
          address: Address(cityName: 'Mumbai')),
      'arrival': AirportModel(
          name: 'Indira Gandhi International Airport',
          iataCode: 'DEL',
          address: Address(cityName: 'Delhi')),
    },
    {
      'departure': AirportModel(
          name: 'Rajiv Gandhi International Airport',
          iataCode: 'HYD',
          address: Address(cityName: 'Hyderabad')),
      'arrival': AirportModel(
          name: 'Chennai International Airport',
          iataCode: 'MAA',
          address: Address(cityName: 'Chennai')),
    },
    {
      'departure': AirportModel(
          name: 'Netaji Subhash Chandra Bose International Airport',
          iataCode: 'CCU',
          address: Address(cityName: 'Kolkata')),
      'arrival': AirportModel(
          name: 'Indira Gandhi International Airport',
          iataCode: 'DEL',
          address: Address(cityName: 'Delhi')),
    },
    {
      'departure': AirportModel(
          name: 'Sardar Vallabhbhai Patel International Airport',
          iataCode: 'AMD',
          address: Address(cityName: 'Ahmedabad')),
      'arrival': AirportModel(
          name: 'Chhatrapati Shivaji Maharaj International Airport',
          iataCode: 'BOM',
          address: Address(cityName: 'Mumbai')),
    },
    {
      'departure': AirportModel(
          name: 'Pune Airport',
          iataCode: 'PNQ',
          address: Address(cityName: 'Pune')),
      'arrival': AirportModel(
          name: 'Kempegowda International Airport',
          iataCode: 'BLR',
          address: Address(cityName: 'Bangalore')),
    },
    {
      'departure': AirportModel(
          name: 'Dabolim Airport',
          iataCode: 'GOI',
          address: Address(cityName: 'Goa')),
      'arrival': AirportModel(
          name: 'Chhatrapati Shivaji Maharaj International Airport',
          iataCode: 'BOM',
          address: Address(cityName: 'Mumbai')),
    }
  ];

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200,
        width: AppHelpers.getScreenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending Searches',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              width: AppHelpers.getScreenWidth(context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendingSearches.length,
                itemBuilder: (BuildContext context, int index) =>
                    TrendingSearchCard(
                  onTrendingSearchTap: onTrendingSearchTap,
                  departure:
                      trendingSearches[index]['departure'] as AirportModel,
                  arrival: trendingSearches[index]['arrival'] as AirportModel,
                ),
              ),
            ),
          ],
        ),
      );
}

class TrendingSearchCard extends StatelessWidget {
  const TrendingSearchCard(
      {super.key,
      required this.departure,
      required this.arrival,
      required this.onTrendingSearchTap});

  final AirportModel departure;
  final AirportModel arrival;
  final Function(AirportModel departure, AirportModel arrival)
      onTrendingSearchTap;
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => onTrendingSearchTap(departure, arrival),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(right: 11),
          height: 100,
          width: AppHelpers.getScreenWidth(context) * 0.85,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.3,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${departure.iataCode ?? ''} (${departure.address?.cityName?.toUpperCase() ?? ''})',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                    Text(
                      departure.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(Icons.flight_takeoff_rounded,
                      size: 18, color: AppColors.white)),
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.3,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${arrival.iataCode ?? ''} (${arrival.address?.cityName?.toUpperCase() ?? ''})',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                    Text(
                      arrival.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
