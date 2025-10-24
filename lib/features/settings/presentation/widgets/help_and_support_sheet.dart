import 'package:excellistravel/core/widgets/primary_button.dart';
import 'package:excellistravel/core/widgets/primary_input.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_drop_down.dart';

Future<void> showHelpAndSupportSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) => HelpAndSupportSheet(),
  );
}

class HelpAndSupportSheet extends StatelessWidget {
  HelpAndSupportSheet({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  String selectedSubject = 'General Inquiries';
  final List<DropdownMenuItem<String>> supportItems = const [
    DropdownMenuItem(
      value: 'Flight Booking & Ticketing Issues',
      child: Text('Flight Booking & Ticketing Issues'),
    ),
    DropdownMenuItem(
      value: 'Payments & Refunds',
      child: Text('Payments & Refunds'),
    ),
    DropdownMenuItem(
      value: 'Flight Changes & Cancellations',
      child: Text('Flight Changes & Cancellations'),
    ),
    DropdownMenuItem(
      value: 'Passenger Information & Documents',
      child: Text('Passenger Information & Documents'),
    ),
    DropdownMenuItem(
      value: 'Add-ons & Services',
      child: Text('Add-ons & Services'),
    ),
    DropdownMenuItem(
      value: 'Technical & App Issues',
      child: Text('Technical & App Issues'),
    ),
    DropdownMenuItem(
      value: 'Other Travel Services',
      child: Text('Other Travel Services'),
    ),
    DropdownMenuItem(
      value: 'Account & Loyalty',
      child: Text('Account & Loyalty'),
    ),
    DropdownMenuItem(
      value: 'General Inquiries',
      child: Text('General Inquiries'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 40),
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              const Text(
                'Help & Support',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.grey,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
          ),
          const SizedBox(height: 15),
          AppDropDown(
            onChanged: (p0) {},
            items: supportItems,
            label: 'Subject*',
            title: 'Select Subject',
            value: selectedSubject,
          ),
          const SizedBox(height: 15),
          AppPrimaryInput(
            maxCharacters: 50,
            label: 'Name*',
            controller: _nameController,
            isMultiline: false,
            hint: 'Enter your name',
          ),
          const SizedBox(height: 15),
          AppPrimaryInput(
            maxCharacters: 10,
            label: 'Phone*',
            controller: _phoneController,
            isMultiline: false,
            hint: 'Enter your phone number',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 15),
          AppPrimaryInput(
            maxCharacters: 50,
            label: 'Email',
            controller: _nameController,
            isMultiline: false,
            hint: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          AppPrimaryInput(
            maxCharacters: 50,
            label: 'Remark*',
            controller: _remarkController,
            isMultiline: false,
            hint: 'Enter your query',
          ),
          const SizedBox(height: 15),
          AppPrimaryButton(
            title: 'Submit',
            isLoading: false,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
