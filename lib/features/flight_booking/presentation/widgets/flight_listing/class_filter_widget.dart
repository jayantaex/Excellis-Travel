import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';

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

class SearchFilterWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  const SearchFilterWidget(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(168),
          color: isSelected ? AppColors.black : AppColors.white,
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
}
