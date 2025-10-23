import 'package:flutter/material.dart';

import '../../../../core/utils/app_helpers.dart';
import 'search_filter_widget.dart';

class ClassFilerWidget extends StatefulWidget {
  final List<String> filters;
  const ClassFilerWidget({super.key, required this.filters});

  @override
  State<ClassFilerWidget> createState() => _ClassFilerWidgetState();
}

class _ClassFilerWidgetState extends State<ClassFilerWidget> {
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
