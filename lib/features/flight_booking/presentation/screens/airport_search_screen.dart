import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reiselab/core/utils/app_helpers.dart';
import 'package:reiselab/core/widgets/app_custom_appbar.dart';
import 'package:reiselab/core/widgets/app_gradient_bg.dart';
import 'package:reiselab/core/widgets/primary_input.dart';
import 'package:reiselab/core/widgets/trans_white_bg_widget.dart';
import 'package:reiselab/features/flight_booking/models/air_port_model.dart';

import '../../../../core/constants/app_styles.dart';
import '../../data/search_data.dart';

class AirportSearchScreen extends StatefulWidget {
  final String? selectedAirport;
  final String? type;
  final void Function(AirportModel airport)? onAirportSelected;
  const AirportSearchScreen({
    super.key,
    this.selectedAirport,
    this.onAirportSelected,
    this.type,
  });

  @override
  State<AirportSearchScreen> createState() => _AirportSearchScreenState();
}

class _AirportSearchScreenState extends State<AirportSearchScreen> {
  final SearchData _data = SearchData();
  List<AirportModel> airports = [];
  String _selectedAirport = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    airports = _data.airports;
    _selectedAirport = widget.selectedAirport?.split('\n')[1] ?? '';
    _searchController.text = _selectedAirport;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: Center(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppCustomAppbar(
                      centerTitle: 'Airport Search',
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          AppPrimaryInput(
                            onChange: (String query) {
                              log(query);
                              AppHelpers.debounce(
                                () {
                                  setState(() {
                                    airports =
                                        _data.searchAirports(query: query);
                                  });
                                },
                              );
                              log('${airports.length}');
                            },
                            label: widget.type ?? 'Departure',
                            hint: 'Enter airport name or city',
                            maxCharacters: 50,
                            controller: _searchController,
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                              child: ListView.builder(
                            itemCount: airports.length,
                            itemBuilder: (context, index) => ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    airports[index].code ?? 'NO-CODE',
                                    style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                title: Text(airports[index].name ?? 'NO-NAME'),
                                subtitle:
                                    Text(airports[index].city ?? 'NO-CITY'),
                                onTap: () {
                                  widget.onAirportSelected!(airports[index]);
                                  Navigator.pop(context);
                                }),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
