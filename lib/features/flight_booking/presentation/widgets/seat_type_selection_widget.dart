import 'package:flutter/material.dart';
import 'package:reiselab/core/utils/app_helpers.dart';

import '../../../../core/constants/app_styles.dart';

class SeatTypeSelectionWidget extends StatefulWidget {
  final Function(String?)? onChanged;
  final Widget? prefixIcon;
  final TextEditingController controller;
  const SeatTypeSelectionWidget(
      {super.key, this.onChanged, this.prefixIcon, required this.controller});

  @override
  State<SeatTypeSelectionWidget> createState() =>
      _SeatTypeSelectionWidgetState();
}

class _SeatTypeSelectionWidgetState extends State<SeatTypeSelectionWidget> {
  String _defaultValue = 'business';

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        labelText: 'Seat Type',
        hintText: 'Business',
        prefix: widget.prefixIcon,
      ),
      onTap: () async {
        await showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Select Seat Type'),
            content: SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.8,
              child: Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //radio tile buttons
                    RadioListTile.adaptive(
                      tileColor: AppColors.transparent,
                      value: 'business',
                      groupValue: _defaultValue,
                      onChanged: (value) {
                        setState(() {
                          _defaultValue = value!;
                        });
                        widget.onChanged!(value);
                        Navigator.of(context).pop();
                      },
                      title: const Text('Business'),
                    ),
                    RadioListTile.adaptive(
                      fillColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      tileColor: AppColors.transparent,
                      value: 'economic',
                      groupValue: _defaultValue,
                      onChanged: (value) {
                        setState(() {
                          _defaultValue = value!;
                        });
                        widget.onChanged!(value);
                        Navigator.of(context).pop();
                      },
                      title: const Text('Economic'),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel',
                    style: TextStyle(color: AppColors.error)),
              ),
            ],
          ),
        );
      },
    );
  }
}
