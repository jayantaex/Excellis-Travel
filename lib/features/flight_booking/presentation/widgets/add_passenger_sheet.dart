import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../models/passenger_model.dart';
import '../screens/pasenger_details_screen.dart';
import 'search_drop_down.dart';

Future<void> showAddPassengerSheet(
    {required BuildContext context,
    required Function(PassengerModel passenger) onDone}) async {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String _selectedGender = 'Male';
  String _cityzenship = 'India';
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Passenger Details',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Complete the form by providing necessary information',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              controller: _firstNameController,
              hint: 'Enter your first name',
              label: 'First Name',
              maxCharacters: 30,
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              controller: _lastNameController,
              hint: 'Enter your last name',
              label: 'Last Name',
              maxCharacters: 30,
            ),
            const SizedBox(height: 16),
            SearchDropDown(
              onChanged: (p0) {
                _selectedGender = p0!;
              },
              label: 'Gender',
              title: 'Select Gender',
              value: 'Male',
              items: genderData
                  .map(
                    (String e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            SearchDropDown(
              onChanged: (p0) {
                _cityzenship = p0!;
              },
              label: 'Citizenship',
              title: 'Select Citizenship',
              value: 'India',
              items: citizenshipData
                  .map(
                    (String e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppPrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onDone(
                      PassengerModel(
                        name:
                            '${_firstNameController.text} ${_lastNameController.text}',
                        citizenship: _cityzenship,
                        gender: _selectedGender,
                      ),
                    );
                  },
                  title: 'Confirm',
                  isLoading: false),
            )
          ],
        ),
      ),
    ),
  );
}
