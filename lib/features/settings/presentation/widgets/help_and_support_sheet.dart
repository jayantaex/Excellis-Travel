import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_drop_down.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../utils/app_helpers.dart';

Future<void> showHelpAndSupportSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    context: context,
    builder: (BuildContext context) => HelpAndSupportSheet(),
  );
}

class HelpAndSupportSheet extends StatelessWidget {
  HelpAndSupportSheet({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  String selectedSubject = 'General Inquiries';
  final List<DropdownMenuItem<String>> supportItems =
      const <DropdownMenuItem<String>>[
    DropdownMenuItem<String>(
      value: 'Flight Booking & Ticketing Issues',
      child: Text('Flight Booking & Ticketing Issues'),
    ),
    DropdownMenuItem<String>(
      value: 'Payments & Refunds',
      child: Text('Payments & Refunds'),
    ),
    DropdownMenuItem<String>(
      value: 'Flight Changes & Cancellations',
      child: Text('Flight Changes & Cancellations'),
    ),
    DropdownMenuItem<String>(
      value: 'Passenger Information & Documents',
      child: Text('Passenger Information & Documents'),
    ),
    DropdownMenuItem<String>(
      value: 'Add-ons & Services',
      child: Text('Add-ons & Services'),
    ),
    DropdownMenuItem<String>(
      value: 'Technical & App Issues',
      child: Text('Technical & App Issues'),
    ),
    DropdownMenuItem<String>(
      value: 'Other Travel Services',
      child: Text('Other Travel Services'),
    ),
    DropdownMenuItem<String>(
      value: 'Account & Loyalty',
      child: Text('Account & Loyalty'),
    ),
    DropdownMenuItem<String>(
      value: 'General Inquiries',
      child: Text('General Inquiries'),
    ),
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              AppDropDown(
                onChanged: (String? p0) {
                  selectedSubject = p0!;
                },
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
                controller: _emailController,
                isMultiline: false,
                hint: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              AppPrimaryInput(
                maxCharacters: 50,
                keyboardType: TextInputType.multiline,
                label: 'Remark*',
                controller: _remarkController,
                isMultiline: true,
                hint: 'Enter your query',
              ),
              const SizedBox(height: 45),
              SizedBox(
                height: 45,
                width: AppHelpers.getScreenWidth(context),
                child: AppPrimaryButton(
                  title: 'Submit',
                  isLoading: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          )
        ],
      );
}
