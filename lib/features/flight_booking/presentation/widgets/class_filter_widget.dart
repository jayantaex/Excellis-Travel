import 'package:flutter/material.dart';

import '../../../../core/utils/app_helpers.dart';
import 'search_filter_widget.dart';

class ClassFilterWidget extends StatefulWidget {
  final List<String> filters;
  const ClassFilterWidget({super.key, required this.filters});

  @override
  State<ClassFilterWidget> createState() => _ClassFilterWidgetState();
}

class _ClassFilterWidgetState extends State<ClassFilterWidget> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: AppHelpers.getScreenWidth(context),
      child: ListView.builder(
        itemBuilder: (context, index) => SearchFilterWidget(
          onTap: () {
            setState(() {
              selectedFilter = widget.filters[index];
            });
          },
          isSelected: selectedFilter == widget.filters[index],
          title: widget.filters[index],
        ),
        itemCount: widget.filters.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
