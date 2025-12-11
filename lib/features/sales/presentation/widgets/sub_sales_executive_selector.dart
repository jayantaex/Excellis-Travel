import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../../utils/app_helpers.dart';
import '../screens/child_data_model.dart';

class SubSalesExecutiveSelector extends StatefulWidget {
  const SubSalesExecutiveSelector(
      {super.key,
      required this.subSalesExecutives,
      required this.preSelectedSubSalesExecutives,
      required this.onSelectionChange});
  final List<ChildDataModel> subSalesExecutives;
  final List<ChildDataModel> preSelectedSubSalesExecutives;
  final Function(List<ChildDataModel>) onSelectionChange;
  @override
  State<SubSalesExecutiveSelector> createState() =>
      _SubSalesExecutiveSelectorState();
}

class _SubSalesExecutiveSelectorState extends State<SubSalesExecutiveSelector> {
  final List<ChildDataModel> _selectedSubSalesExecutives = [];

  @override
  void initState() {
    super.initState();
    if (widget.preSelectedSubSalesExecutives.isNotEmpty) {
      _selectedSubSalesExecutives.addAll(widget.preSelectedSubSalesExecutives);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Sub Sales Executives',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            const Divider(color: AppColors.grey),
            ...widget.subSalesExecutives.map(
              (e) => ListTile(
                contentPadding: const EdgeInsets.all(0),
                onTap: () {
                  setState(() {
                    if (_selectedSubSalesExecutives.contains(e)) {
                      _selectedSubSalesExecutives.remove(e);
                    } else {
                      _selectedSubSalesExecutives.add(e);
                    }
                  });
                  widget.onSelectionChange(_selectedSubSalesExecutives);
                },
                title: Text(
                  '${e.firstName ?? ''} ${e.lastName ?? ''}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                trailing: _selectedSubSalesExecutives.contains(e)
                    ? const Icon(Icons.check_circle_outline_rounded,
                        color: AppColors.primary)
                    : const Icon(Icons.circle_outlined, color: AppColors.grey),
              ),
            ),
          ],
        ),
      );
}

Future<void> showSubSalesExecutiveSelector(
  BuildContext context,
  List<ChildDataModel> subSalesExecutives,
  Function(List<ChildDataModel>) onSelected,
  List<ChildDataModel> preSelectedSubSalesExecutives,
) async =>
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        List<ChildDataModel> selectedSubSalesExecutives = [];

        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 14),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          content: SizedBox(
            width: AppHelpers.getScreenWidth(context),
            child: SubSalesExecutiveSelector(
              subSalesExecutives: subSalesExecutives,
              preSelectedSubSalesExecutives: preSelectedSubSalesExecutives,
              onSelectionChange: (selectedSubSalesExecutivesList) {
                selectedSubSalesExecutives = selectedSubSalesExecutivesList;
              },
            ),
          ),
          actions: [
            AppPrimaryButton(
              isLoading: false,
              onPressed: () {
                onSelected(selectedSubSalesExecutives);
                Navigator.of(context).pop();
              },
              title: 'Select',
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: AppHelpers.getScreenWidth(context) * 9,
              height: 45,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const AppText(
                    text: 'Cancel',
                  )),
            ),
          ],
        );
      },
    );
