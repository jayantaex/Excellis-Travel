import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/data/country_code.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_drop_down.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../../utils/title_case.dart';
import '../../bloc/flight_bloc.dart';
import '../../data/models/air_port_model.dart';
import '../widgets/airport_search/airport_card.dart';
import '../widgets/loading/airport_card_loading_widget.dart';

class AirportSearchScreen extends StatefulWidget {
  const AirportSearchScreen(
      {super.key, this.selectedAirport, this.type, this.onAirportSelected});
  final String? selectedAirport;
  final String? type;
  final void Function(AirportModel airport)? onAirportSelected;

  @override
  State<AirportSearchScreen> createState() => _AirportSearchScreenState();
}

class _AirportSearchScreenState extends State<AirportSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];
  String _selectedCountyCode = 'IN';
  @override
  void initState() {
    Future.microtask(() async {
      for (Map<String, String> element in countryList) {
        items.add(
          DropdownMenuItem<String>(
            value: element['code'],
            child: Text('${element['name']} (${element['code']})'),
          ),
        );
      }
      if (widget.selectedAirport != null &&
          widget.selectedAirport!.isNotEmpty) {
        _searchController.text = widget.selectedAirport!;
        await _handleAirportSearch(keyword: widget.selectedAirport);
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                          color: AppHelpers.isDarkMode(context)
                              ? AppColors.surfaceDark
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: AppHelpers.isDarkMode(context)
                              ? Border.all(
                                  color:
                                      AppColors.white.withValues(alpha: 0.05))
                              : null,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      AppHelpers.getScreenWidth(context) * 0.6,
                                  child: AppPrimaryInput(
                                    focus: true,
                                    onChange: (String query) {
                                      AppHelpers.debounce(
                                        () async {
                                          await _handleAirportSearch(
                                              keyword: query);
                                        },
                                      );
                                    },
                                    label: widget.type ?? 'Airport',
                                    hint:
                                        'Enter city name here or airport code',
                                    maxCharacters: 20,
                                    controller: _searchController,
                                    suffixIcon:
                                        _searchController.text.isNotEmpty
                                            ? IconButton(
                                                onPressed: () {
                                                  _searchController.clear();
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  size: 14,
                                                ))
                                            : null,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      AppHelpers.getScreenWidth(context) * 0.3,
                                  child: AppDropDown(
                                    isExpanded: true,
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
                                listener: (BuildContext context,
                                    FlightState state) {},
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
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          state.airports[index].subType ==
                                                  'CITY'
                                              ? const SizedBox()
                                              : AirportCard(
                                                  airportCode: state
                                                          .airports[index]
                                                          .iataCode ??
                                                      '',
                                                  city: toTitleCase(state
                                                          .airports[index]
                                                          .address
                                                          ?.cityName ??
                                                      ''),
                                                  airportName: toTitleCase(state
                                                          .airports[index]
                                                          .name ??
                                                      ''),
                                                  onAirportSelected: () {
                                                    widget.onAirportSelected!(
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

  Future<void> _handleAirportSearch({String? keyword}) async {
    context.read<FlightBloc>().add(
          SearchAirportEvent(
            countryCode: _selectedCountyCode,
            keyword: keyword ?? '',
            subType: 'CITY,AIRPORT',
          ),
        );
  }
}

class NoAirPortFound extends StatelessWidget {
  const NoAirPortFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelpers.isDarkMode(context);
    return Center(
      child: Text('No Airport Found',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isDarkMode
                ? AppColors.white.withValues(alpha: 0.5)
                : AppColors.textSecondary,
          )),
    );
  }
}
