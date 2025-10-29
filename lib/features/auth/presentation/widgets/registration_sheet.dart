import 'dart:developer';

import 'package:excellistravel/core/utils/app_toast.dart';
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
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _nearbyAirportController =
      TextEditingController();
  final TextEditingController _gstNoController = TextEditingController();
  final TextEditingController _aadhaarNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  String usertype = 'retailer';
  String selectedState = 'Andhra Pradesh';
  final List<DropdownMenuItem<String>> _items = <DropdownMenuItem<String>>[
    const DropdownMenuItem(value: 'retailer', child: Text('Become a Retailer')),
    const DropdownMenuItem(value: 'user', child: Text('Become a User')),
  ];

  final List<DropdownMenuItem<String>> _states = <DropdownMenuItem<String>>[
    // --- Indian States ---
    const DropdownMenuItem(
        value: 'Andhra Pradesh', child: Text('Andhra Pradesh')),
    const DropdownMenuItem(
        value: 'Arunachal Pradesh', child: Text('Arunachal Pradesh')),
    const DropdownMenuItem(value: 'Assam', child: Text('Assam')),
    const DropdownMenuItem(value: 'Bihar', child: Text('Bihar')),
    const DropdownMenuItem(value: 'Chhattisgarh', child: Text('Chhattisgarh')),
    const DropdownMenuItem(value: 'Goa', child: Text('Goa')),
    const DropdownMenuItem(value: 'Gujarat', child: Text('Gujarat')),
    const DropdownMenuItem(value: 'Haryana', child: Text('Haryana')),
    const DropdownMenuItem(
        value: 'Himachal Pradesh', child: Text('Himachal Pradesh')),
    const DropdownMenuItem(value: 'Jharkhand', child: Text('Jharkhand')),
    const DropdownMenuItem(value: 'Karnataka', child: Text('Karnataka')),
    const DropdownMenuItem(value: 'Kerala', child: Text('Kerala')),
    const DropdownMenuItem(
        value: 'Madhya Pradesh', child: Text('Madhya Pradesh')),
    const DropdownMenuItem(value: 'Maharashtra', child: Text('Maharashtra')),
    const DropdownMenuItem(value: 'Manipur', child: Text('Manipur')),
    const DropdownMenuItem(value: 'Meghalaya', child: Text('Meghalaya')),
    const DropdownMenuItem(value: 'Mizoram', child: Text('Mizoram')),
    const DropdownMenuItem(value: 'Nagaland', child: Text('Nagaland')),
    const DropdownMenuItem(value: 'Odisha', child: Text('Odisha')),
    const DropdownMenuItem(value: 'Punjab', child: Text('Punjab')),
    const DropdownMenuItem(value: 'Rajasthan', child: Text('Rajasthan')),
    const DropdownMenuItem(value: 'Sikkim', child: Text('Sikkim')),
    const DropdownMenuItem(value: 'Tamil Nadu', child: Text('Tamil Nadu')),
    const DropdownMenuItem(value: 'Telangana', child: Text('Telangana')),
    const DropdownMenuItem(value: 'Tripura', child: Text('Tripura')),
    const DropdownMenuItem(
        value: 'Uttar Pradesh', child: Text('Uttar Pradesh')),
    const DropdownMenuItem(value: 'Uttarakhand', child: Text('Uttarakhand')),
    const DropdownMenuItem(value: 'West Bengal', child: Text('West Bengal')),

    // --- Union Territories ---
    const DropdownMenuItem(
        value: 'Andaman and Nicobar Islands',
        child: Text('Andaman and Nicobar Islands')),
    const DropdownMenuItem(value: 'Chandigarh', child: Text('Chandigarh')),
    const DropdownMenuItem(
        value: 'Dadra and Nagar Haveli and Daman and Diu',
        child: Text('Dadra and Nagar Haveli and Daman and Diu')),
    const DropdownMenuItem(value: 'Delhi', child: Text('Delhi')),
    const DropdownMenuItem(
        value: 'Jammu and Kashmir', child: Text('Jammu and Kashmir')),
    const DropdownMenuItem(value: 'Ladakh', child: Text('Ladakh')),
    const DropdownMenuItem(value: 'Lakshadweep', child: Text('Lakshadweep')),
    const DropdownMenuItem(value: 'Puducherry', child: Text('Puducherry')),
  ];

  final String errMsg = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        log(state.toString());
        if (state is RegistrationSuccess) {
          await AppHelpers.showSnackBar(context,
              'You have registered successfully. Please login with your credentials',
              backgroundColor: AppColors.success);
          context.mounted ? context.goNamed(AuthModule.loginName) : null;
        }
      },
      builder: (context, state) {
        if (state is RegistrationFailure) {
          showToast(message: state.message);
        }
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
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Complete the form by providing necessary information',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 53),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AuthDropdownWidget(
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
                        label: 'First Name*',
                        hint: 'Enter your first name (required)'),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AuthInputWidget(
                        isPassword: false,
                        maxCharacters: 40,
                        controller: _lastNameController,
                        label: 'Last Name*',
                        hint: 'Enter your last name (required)'),
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
                        label: 'Email ID*',
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
                        label: 'Phone Number*',
                        hint: 'Enter your Phone Number(required)'),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AuthInputWidget(
                        isPassword: false,
                        maxCharacters: 50,
                        controller: _officeAddressController,
                        label: 'Address*',
                        hint: 'Enter your Address(required)'),
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
                    child: AuthDropdownWidget(
                      items: _states,
                      onChanged: (value) {
                        selectedState = value ?? 'Andhra Pradesh';
                      },
                    ),
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
                      isLoading: state is RegistrationInProgress,
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              RegisterEvent(
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
                                state: selectedState,
                                gstNumber: _gstNoController.text,
                                aadhaarNumber: _aadhaarNoController.text,
                              ),
                            );
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
      },
    );
  }
}
