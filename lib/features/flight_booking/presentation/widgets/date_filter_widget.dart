import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class DateFilterWidget extends StatefulWidget {
  final List<DateTime> dates;

  const DateFilterWidget({super.key, required this.dates});

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: AppHelpers.percenWidth(context: context),
      child: ListView.builder(
          itemCount: widget.dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
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
                        widget.dates[index],
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
                        widget.dates[index],
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
            );
          }),
    );
  }
}
