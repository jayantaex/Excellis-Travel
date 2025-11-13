import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';

class DateFilterWidget extends StatefulWidget {

  const DateFilterWidget(
      {super.key, required this.startDate, this.onDateSelected});
  final String startDate;
  final Function(DateTime date)? onDateSelected;

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  int selectedIndex = 0;
  DateTime startDate = DateTime.now();
  List<DateTime> dates = [];
  int limit = 30; //days

  @override
  void initState() {
    startDate = DateTime.parse(widget.startDate);
    for (var i = 0; i < limit; i++) {
      dates.add(startDate.add(Duration(days: i)));
    }
    setState(() {});

    // startDate = DateTime.parse(widget.startDate);
    // for (var i = 0; i < limit; i++) {
    //   dates.add(startDate.add(Duration(days: i)));
    // }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 70,
      width: AppHelpers.percenWidth(context: context),
      child: ListView.builder(
          itemCount: dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                widget.onDateSelected!(dates[index]);
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: selectedIndex != index
                      ? AppColors.white
                      : AppColors.black,
                  borderRadius: BorderRadius.circular(14),
                ),
                height: 65,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppHelpers.formatDate(
                        dates[index],
                        pattern: 'MMM',
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selectedIndex != index
                            ? AppColors.grey
                            : AppColors.white,
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
                        color: selectedIndex != index
                            ? AppColors.grey
                            : AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
}
