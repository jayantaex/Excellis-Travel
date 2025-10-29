import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../flight_booking_module.dart';
import '../widgets/launge_access_widget.dart';
import '../widgets/app_drop_down.dart';

List<String> citizenshipData = [
  "Afghanistan",
  "Algeria",
  "Bahrain",
  "Bangladesh",
  "Egypt",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Jordan",
  "Kenya",
  "Kuwait",
  "Lebanon",
  "Libya",
  "Malaysia",
  "Morocco",
  "Nepal",
  "Oman",
  "Pakistan",
  "Palestine",
  "Philippines",
  "Qatar",
  "Saudi Arabia",
  "Somalia",
  "Sri Lanka",
  "Sudan",
  "Syria",
  "Tunisia",
  "Turkey",
  "UAE",
  "Yemen",
];
List<String> genderData = ["Male", "Female", "Other"];

class PasengerDetailsScreen extends StatelessWidget {
  const PasengerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: Center(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  //nav Controller
             const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AppCustomAppbar(
                        start: 'CCU',
                        end: 'HDO',
                      )),

                  Expanded(
                    child: Container(
                      width: AppHelpers.getScreenWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      margin: const EdgeInsets.only(top: 16),
                      height: AppHelpers.getScreenHeight(context),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              'Passenger Details',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Complete the form by providing necessary information',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 16),
                            const AppPrimaryInput(
                              hint: 'Enter your first name',
                              label: 'First Name',
                              maxCharacters: 30,
                            ),
                            const SizedBox(height: 16),
                            const AppPrimaryInput(
                              hint: 'Enter your last name',
                              label: 'Last Name',
                              maxCharacters: 30,
                            ),
                            const SizedBox(height: 16),
                            const AppPrimaryInput(
                              hint: 'Enter your email address',
                              label: 'Email Address',
                              maxCharacters: 50,
                            ),
                            const SizedBox(height: 16),
                            const AppPrimaryInput(
                              hint: 'Mobile Number',
                              label: 'Enter your mobile number',
                              maxCharacters: 10,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 16),
                            AppDropDown(
                              onChanged: (p0) {},
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
                            const LaungeAccessWidget()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: AppColors.white,
          child: AppPrimaryButton(
            onPressed: () {
              context.pushNamed(FlightBookingModule.paymentDetailsName);
            },
            title: 'Done',
            isLoading: false,
            bgColor: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
