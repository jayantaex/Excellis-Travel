import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../legal/legal_module.dart';
import '../../auth_module.dart';
import '../../bloc/auth_bloc.dart';
import 'auth_dropdown_widget.dart';
import 'auth_input_widget.dart';

class AgencyRegistrationSheet extends StatelessWidget {
  AgencyRegistrationSheet({super.key});

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _panNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _officeAddressController =
      TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _nearbyAirportController =
      TextEditingController();
  final TextEditingController _gstNoController = TextEditingController();
  final TextEditingController _aadhaarNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  String usertype = 'retailer';
  final List<DropdownMenuItem<String>> _items = <DropdownMenuItem<String>>[
    const DropdownMenuItem(value: 'retailer', child: Text('Become a Retailer')),
    const DropdownMenuItem(value: 'user', child: Text('Become a User')),
  ];
  final String errMsg = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: AppHelpers.getScreenHeight(context) * 0.75,
        width: AppHelpers.getScreenWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 55),
              const Text('Register As Agency',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Complete the form by providing necessary information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 53),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: UserTypeSelection(
                  items: _items,
                  onChanged: (value) {
                    usertype = value ?? 'retailer';
                  },
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 50,
                    controller: _companyNameController,
                    label: 'Company Name',
                    hint: 'Enter your Company Name'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 40,
                    controller: _firstNameController,
                    label: 'First Name',
                    hint: 'Enter your First Name'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 40,
                    controller: _lastNameController,
                    label: 'Last Name',
                    hint: 'Enter your Last Name'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 10,
                    controller: _panNoController,
                    label: 'PAN Number',
                    hint: 'Enter your PAN Number'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 20,
                    controller: _emailController,
                    label: 'Email ID',
                    hint: 'Enter your Email ID'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    keyboardType: TextInputType.phone,
                    maxCharacters: 10,
                    controller: _phoneController,
                    label: 'Phone Number',
                    hint: 'Enter your Phone Number'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 50,
                    controller: _officeAddressController,
                    label: 'Office Address',
                    hint: 'Enter your Office Address'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 6,
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    label: 'Pin Code',
                    hint: 'Enter your Pin Code'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 20,
                    controller: _stateController,
                    label: 'State',
                    hint: 'Enter your State'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 30,
                    controller: _cityController,
                    label: 'City',
                    hint: 'Enter your City'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 30,
                    controller: _nearbyAirportController,
                    label: 'Nearby Airport',
                    hint: 'Enter your Nearby Airport'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 15,
                    controller: _gstNoController,
                    label: 'GST Number',
                    hint: 'Enter your GST Number'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: false,
                    maxCharacters: 12,
                    controller: _aadhaarNoController,
                    keyboardType: TextInputType.number,
                    label: 'Aadhaar Number',
                    hint: 'Enter your Aadhaar Number'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: true,
                    maxCharacters: 8,
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your Password'),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AuthInputWidget(
                    isPassword: true,
                    maxCharacters: 8,
                    controller: _conPasswordController,
                    label: 'Confirm Password',
                    hint: 'Re-Enter your Password'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errMsg,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.error),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppPrimaryButton(
                  title: 'REGISTER',
                  isLoading: false,
                  onPressed: () {
                    context.read<AuthBloc>().add(RegisterEvent(
                          confirmPassword: _conPasswordController.text,
                          password: _passwordController.text,
                          nearByAirport: _nearbyAirportController.text,
                          userType: usertype,
                          companyName: _companyNameController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          panNumber: _panNoController.text,
                          emailId: _emailController.text,
                          phoneNumber: _phoneController.text,
                          officeAddress: _officeAddressController.text,
                          pinCode: _pinController.text,
                          city: _cityController.text,
                          state: _stateController.text,
                          gstNumber: _gstNoController.text,
                          aadhaarNumber: _aadhaarNoController.text,
                        ));
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: AppHelpers.getScreenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(AuthModule.loginName);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'By continuing, you agree to our ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: AppHelpers.getScreenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(LegalModule.termsName);
                      },
                      child: const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Text(
                      ' and ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(LegalModule.policyName);
                      },
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
