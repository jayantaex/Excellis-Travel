import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/utils/app_toast.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/primary_input.dart';
import '../../../models/passenger_model.dart';
import '../flight_search/app_drop_down.dart';

Future<void> showAddPassengerSheet(
    {required BuildContext context,
    required String travellerType,
    required Function(PassengerModel passenger) onDone}) async {
  final TextEditingController firstNameController = TextEditingController(
      text: AppConstants.env == 'development' ? 'Jhon' : '');
  final TextEditingController lastNameController = TextEditingController(
      text: AppConstants.env == 'development' ? 'Doe' : '');
  final TextEditingController mobileNumberController = TextEditingController(
      text: AppConstants.env == 'development' ? '9064187130' : '');
  final TextEditingController emailController = TextEditingController(
      text: AppConstants.env == 'development' ? 'jhon@apptest.com' : '');
  final TextEditingController dobController = TextEditingController();
  DateTime? dob;
  String selectedGender = 'Male';
  final List<String> genderList = <String>['Male', 'Female'];
  DateTime firstDate = DateTime(2000);
  DateTime lastDate = DateTime.now();
  switch (travellerType) {
    case 'Adult':
      {
        firstDate = DateTime.now().subtract(
          const Duration(days: 365 * 120),
        );
        lastDate = DateTime.now().subtract(
          const Duration(days: 365 * 12),
        );
      }
      break;
    case 'Child':
      {
        firstDate = DateTime.now().subtract(
          const Duration(days: 365 * 12),
        );
        lastDate = DateTime.now().subtract(
          const Duration(days: 365 * 2),
        );
      }
      break;
    case 'Infant':
      {
        firstDate = DateTime.now().subtract(const Duration(days: 365 * 2));
        lastDate = DateTime.now().subtract(const Duration(days: 1));
      }
      break;
    default:
  }
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) => SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Passenger Details',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const Text(
              'Complete the form by providing necessary information',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: AppHelpers.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: AppHelpers.getScreenWidth(context) * 0.45,
                    child: AppPrimaryInput(
                      controller: firstNameController,
                      hint: 'Enter your first name',
                      label: 'First Name*',
                      maxCharacters: 30,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: AppHelpers.getScreenWidth(context) * 0.45,
                    child: AppPrimaryInput(
                      controller: lastNameController,
                      hint: 'Enter your last name',
                      label: 'Last Name*',
                      maxCharacters: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              controller: emailController,
              hint: 'Enter your email address',
              label: 'Email',
              maxCharacters: 320,
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              keyboardType: TextInputType.number,
              controller: mobileNumberController,
              hint: 'Enter your Mobile number',
              label: 'Mobile Number',
              maxCharacters: 10,
            ),
            const SizedBox(height: 16),
            AppPrimaryInput(
              controller: dobController,
              onTap: () async {
                dob = await showDatePicker(
                    builder: (context, child) => Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.primary,
                            ),
                          ),
                          child: child!,
                        ),
                    context: context,
                    firstDate: firstDate,
                    lastDate: lastDate);
                dobController.text =
                    AppHelpers.formatDate(dob ?? DateTime.parse('2000-01-01'));
              },
              hint: 'Enter your date of birth',
              label: 'Date of Birth*',
              maxCharacters: 10,
            ),
            const SizedBox(height: 16),
            AppDropDown(
              onChanged: (String? p0) {
                selectedGender = p0!;
              },
              label: 'Gender',
              title: 'Select Gender',
              value: 'Male',
              items: genderList
                  .map(
                    (String e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
            // const SizedBox(height: 16),
            // AppDropDown(
            //   onChanged: (p0) {
            //     cityzenship = p0!;
            //   },
            //   label: 'Citizenship',
            //   title: 'Select Citizenship',
            //   value: 'India',
            //   items: citizenshipData
            //       .map(
            //         (String e) => DropdownMenuItem(
            //           value: e,
            //           child: Text(e),
            //         ),
            //       )
            //       .toList(),
            // ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppPrimaryButton(
                  onPressed: () {
                    if (firstNameController.text.isEmpty ||
                        lastNameController.text.isEmpty ||
                        dob == null) {
                      showToast(message: 'Please fill all the required fields');
                      return;
                    }

                    Navigator.pop(context);
                    onDone(
                      PassengerModel(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        dateOfBirth: dob,
                        emailAddress: emailController.text,
                        number: mobileNumberController.text,
                        gender: selectedGender,
                        type: travellerType,
                      ),
                    );
                  },
                  title: 'Confirm',
                  isLoading: false),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    ),
  );
}
