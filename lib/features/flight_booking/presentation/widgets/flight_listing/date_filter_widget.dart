import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';

class DateFilterWidget extends StatefulWidget {
  const DateFilterWidget(
      {super.key, this.onDateSelected, required this.selectedDate});
  final DateTime selectedDate;
  final Function(DateTime date)? onDateSelected;

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  DateTime startDate = DateTime.now();
  List<DateTime> dates = [];
  int limit = 30;

  @override
  void initState() {
    for (var i = 0; i < limit; i++) {
      dates.add(startDate.add(Duration(days: i)));
    }
    log('${widget.selectedDate}');
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String selectedDate = AppHelpers.formatDate(
      widget.selectedDate,
      pattern: 'yyyy-MM-dd',
    );
    return SizedBox(
      height: 70,
      width: AppHelpers.percenWidth(context: context),
      child: ListView.builder(
          itemCount: dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            String thisDate =
                AppHelpers.formatDate(dates[index], pattern: 'yyyy-MM-dd');
            return InkWell(
              onTap: () {
                widget.onDateSelected!(dates[index]);
                // log('${dates[index]}');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: selectedDate == thisDate
                      ? AppColors.black
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                height: 65,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppHelpers.formatDate(
                        dates[index],
                        pattern: 'MMM',
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selectedDate == thisDate
                            ? AppColors.white
                            : AppColors.grey,
                      ),
                    ),
                    Text(
                      AppHelpers.formatDate(
                        dates[index],
                        pattern: 'dd',
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedDate == thisDate
                            ? AppColors.white
                            : AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
