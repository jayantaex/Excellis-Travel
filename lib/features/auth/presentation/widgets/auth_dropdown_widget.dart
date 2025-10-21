import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';


class AuthDropdownWidget extends StatefulWidget {
  final Function(String?)? onChanged;
  const AuthDropdownWidget({super.key, this.onChanged});

  @override
  State<AuthDropdownWidget> createState() => _AuthDropdownWidgetState();
}

class _AuthDropdownWidgetState extends State<AuthDropdownWidget> {
  final _items = <DropdownMenuItem<String>>[
    const DropdownMenuItem(value: 'retailer', child: Text('Become a Retailer')),
    const DropdownMenuItem(value: 'user', child: Text('Become a User')),
  ];
  String _defaultValue = 'retailer';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.textHint.withOpacity(0.15),
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(90),
      ),
      child: DropdownButton(
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        style: const TextStyle(
            fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
        isExpanded: true,
        value: _defaultValue,
        items: _items,
        onChanged: (String? value) {
          setState(() {
            _defaultValue = value!;
          });
          widget.onChanged!(value);
        },
      ),
    );
  }
}
