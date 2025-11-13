import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/data/country_code.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_drop_down.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/flight_bloc.dart';
import '../../models/air_port_model.dart';
import '../widgets/airport_search/airport_card.dart';
import '../widgets/loading/airport_card_loading_widget.dart';

class AirportSearchScreen extends StatelessWidget {
  AirportSearchScreen(
      {super.key, this.selectedAirport, this.type, this.onAirportSelected});
  final String? selectedAirport;
  final String? type;
  final void Function(AirportModel airport)? onAirportSelected;
  final TextEditingController _searchController = TextEditingController();
  final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];
  String _selectedCountyCode = 'IN';

  @override
  Widget build(BuildContext context) {
    for (Map<String, String> element in countryList) {
      items.add(
        DropdownMenuItem<String>(
          value: element['code'],
          child: Text('${element['name']} (${element['code']})'),
        ),
      );
    }
    if (selectedAirport != null && selectedAirport!.isNotEmpty) {
      _searchController.text = selectedAirport!;
      context.read<FlightBloc>().add(SearchAirportEvent(
            keyword: selectedAirport!,
            countryCode: 'IN',
            subType: 'AIRPORT',
          ));
    }
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: Center(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: <Widget>[
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
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: AppHelpers.getScreenWidth(context) * 0.6,
                                child: AppPrimaryInput(
                                  onChange: (String query) {
                                    AppHelpers.debounce(
                                      delay: const Duration(milliseconds: 200),
                                      () {
                                        context.read<FlightBloc>().add(
                                              SearchAirportEvent(
                                                countryCode:
                                                    _selectedCountyCode,
                                                keyword: query,
                                                subType: 'CITY,AIRPORT',
                                              ),
                                            );
                                      },
                                    );
                                  },
                                  label: type ?? 'Airport',
                                  hint: 'Enter city name here or airport code',
                                  maxCharacters: 20,
                                  controller: _searchController,
                                ),
                              ),
                              SizedBox(
                                width: AppHelpers.getScreenWidth(context) * 0.3,
                                child: AppDropDown(
                                  onChanged: (String? value) {
                                    _selectedCountyCode = value ?? 'IN';
                                  },
                                  title: 'Country',
                                  value: _selectedCountyCode,
                                  label: 'Country',
                                  items: items,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: BlocConsumer<FlightBloc, FlightState>(
                              listener:
                                  (BuildContext context, FlightState state) {},
                              builder:
                                  (BuildContext context, FlightState state) {
                                if (state is AirportSearching) {
                                  return ListView.builder(
                                    itemCount: 15,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            const AirportCardLoadingWidget(),
                                  );
                                }

                                if (state is AirportLoaded) {
                                  if (state.airports.isEmpty) {
                                    return const NoAirPortFound();
                                  }

                                  return ListView.builder(
                                    itemCount: state.airports.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            AirportCard(
                                      airportCode:
                                          state.airports[index].iataCode ?? '',
                                      city: state.airports[index].address
                                              ?.cityName ??
                                          '',
                                      airportName:
                                          state.airports[index].name ?? '',
                                      onAirportSelected: () {
                                        onAirportSelected!(
                                            state.airports[index]);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                }
                                if (state is AirportSearchingError) {
                                  return ErrorScreen(
                                    errorDesc: state.message,
                                    errorMessage: 'Airport Error',
                                  );
                                }

                                return const NoAirPortFound();
                              },
                            ),
                          )
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

class NoAirPortFound extends StatelessWidget {
  const NoAirPortFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('No Airport Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            )),
      );
}
