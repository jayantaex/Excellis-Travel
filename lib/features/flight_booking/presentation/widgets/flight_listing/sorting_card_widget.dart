import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../bloc/flight_bloc.dart';

class SortingCardWidget extends StatefulWidget {
  const SortingCardWidget(
      {super.key,
      required this.filters,
      required this.selectedFilter,
      required this.onFilterSelected});
  final List<String> filters;
  final String selectedFilter;
  final Function(String filter) onFilterSelected;
  @override
  State<SortingCardWidget> createState() => _ClassFilterWidgetState();
}

class _ClassFilterWidgetState extends State<SortingCardWidget> {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: AppHelpers.getScreenWidth(context),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              BlocConsumer<FlightBloc, FlightState>(
            listener: (context, state) {},
            builder: (context, state) => SortingCardItemWidget(
              onTap: () {
                widget.onFilterSelected(widget.filters[index]);
                if (state is FlightLoaded) {
                  context.read<FlightBloc>().add(
                        SortFlightEvent(
                            filterName: widget.filters[index],
                            flightData: state.data,
                            isFiltered: state.isFiltered,
                            filteredData: state.filteredData,
                            currentFilter: state.currentFilter,
                            minOfferFare: state.minOfferFare,
                            maxOfferFare: state.maxOfferFare,
                            minPublishedFare: state.minPublishedFare,
                            maxPublishedFare: state.maxPublishedFare,
                            airlines: state.airlines,
                            selectedAircraftCode:
                                state.currentFilter?.aircraftCodes ?? []),
                      );
                }
              },
              isSelected: widget.selectedFilter == widget.filters[index],
              title: widget.filters[index],
            ),
          ),
          itemCount: widget.filters.length,
          scrollDirection: Axis.horizontal,
        ),
      );
}

class SortingCardItemWidget extends StatelessWidget {
  const SortingCardItemWidget(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onTap(),
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(168),
            color: isSelected
                ? AppHelpers.isDarkMode(context)
                    ? AppColors.primaryDark
                    : AppColors.black
                : AppHelpers.isDarkMode(context)
                    ? AppColors.secondaryDark
                    : AppColors.white,
          ),
          child: Text(
            title,
            style: isSelected
                ? const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)
                : const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
          ),
        ),
      );
}
