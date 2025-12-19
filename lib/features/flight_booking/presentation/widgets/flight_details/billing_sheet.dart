import 'package:country_code_picker/country_code_picker.dart';
import 'package:excellistravel/features/flight_booking/data/dto/billing_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../../core/common/bloc/states/states_bloc.dart';
import '../../../../../core/common/common_module.dart';
import '../../../../../core/common/models/city_model.dart';
import '../../../../../core/common/models/state_model.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/primary_input.dart';
import '../../../../../utils/app_helpers.dart';

class BillingSheet extends StatefulWidget {
  const BillingSheet({
    super.key,
    this.billingProfile,
    required this.onSavePressed,
  });

  final BillingAddressModel? billingProfile;
  final Function(BillingAddressModel billingProfile) onSavePressed;
  @override
  State<BillingSheet> createState() => _BillingSheetState();
}

class _BillingSheetState extends State<BillingSheet> {
  final _formKey = GlobalKey<FormState>();
  String _selectedState = '';
  String _selectedStateCode = '';
  int _selectedStateId = 0;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) {
        return;
      }

      // Extract user's state from profile data if available
      if (widget.billingProfile != null) {
        firstNameController.text = widget.billingProfile?.firstName ?? '';
        lastNameController.text = widget.billingProfile?.lastName ?? '';
        emailController.text = widget.billingProfile?.email ?? '';
        mobileNumberController.text = widget.billingProfile?.mobileNumber ?? '';
        addressLine1Controller.text = widget.billingProfile?.addressLine1 ?? '';
        addressLine2Controller.text = widget.billingProfile?.addressLine2 ?? '';
        cityController.text = widget.billingProfile?.city ?? '';
        pinCodeController.text = widget.billingProfile?.pinCode ?? '';
        _selectedState = widget.billingProfile?.state ?? '';
        countryController.text = widget.billingProfile?.country ?? '';
      }

      // Fetch states - cities will be fetched after state is matched in listener
      context.read<StatesBloc>().add(GetStatesEvent());
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<StatesBloc, StatesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is StatesLoaded) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppHelpers.getScreenWidth(context) * 0.45,
                          child: AppPrimaryInput(
                            maxCharacters: 20,
                            label: 'First Name*',
                            hint: 'Enter your first name',
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'First name is required';
                              }
                              if (value.trim().length < 2) {
                                return 'First name must be at least 2 characters';
                              }
                              if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                return 'First name can only contain letters';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: AppHelpers.getScreenWidth(context) * 0.45,
                          child: AppPrimaryInput(
                            maxCharacters: 20,
                            label: 'Last Name*',
                            hint: 'Enter your last name',
                            controller: lastNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Last name is required';
                              }
                              if (value.trim().length < 2) {
                                return 'Last name must be at least 2 characters';
                              }
                              if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                return 'Last name can only contain letters';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppPrimaryInput(
                    controller: emailController,
                    maxCharacters: 50,
                    label: 'Email*',
                    hint: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      // Email regex pattern
                      final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            border: Border.all(
                                color: AppColors.grey.withValues(alpha: 0.3)),
                          ),
                          height: 50,
                          width: AppHelpers.getScreenWidth(context) * 0.3,
                          child: CountryCodePicker(
                            initialSelection: '+91',
                            favorite: const ['+91'],
                            onChanged: (CountryCode countryCode) {
                              countryController.text = countryCode.code ?? 'IN';
                            },
                            hideSearch: true,
                            margin: const EdgeInsets.all(0),
                            dialogSize: Size(AppHelpers.getScreenWidth(context),
                                AppHelpers.getScreenHeight(context) * 0.6),
                            barrierColor:
                                AppColors.black.withValues(alpha: 0.5),
                            flagDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                          ),
                        ),
                        SizedBox(
                          width: AppHelpers.getScreenWidth(context) * 0.6,
                          child: AppPrimaryInput(
                            controller: mobileNumberController,
                            maxCharacters: 10,
                            label: 'Mobile Number*',
                            hint: 'Enter your mobile number',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Mobile number is required';
                              }
                              if (value.trim().length != 10) {
                                return 'Mobile number must be 10 digits';
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'Mobile number can only contain digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppPrimaryInput(
                    controller: addressLine1Controller,
                    maxCharacters: 100,
                    label: 'Address Line 1*',
                    hint: 'Enter your address line 1',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Address is required';
                      }
                      if (value.trim().length < 5) {
                        return 'Address must be at least 5 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AppPrimaryInput(
                    maxCharacters: 100,
                    label: 'Address Line 2',
                    hint: 'Enter your address line 2',
                    controller: addressLine2Controller,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: AppHelpers.getScreenWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppHelpers.getScreenWidth(context) * 0.45,
                          child: BlocConsumer<StatesBloc, StatesState>(
                            listener:
                                (BuildContext context, StatesState state) {
                              if (state is StatesLoaded) {
                                bool stateFound = false;
                                if (state.states.isNotEmpty) {
                                  // Try to find the user's state from profileData first
                                  if (_selectedState.isNotEmpty) {
                                    for (StateModel e in state.states) {
                                      if (e.name?.toLowerCase().trim() ==
                                          _selectedState.toLowerCase().trim()) {
                                        // Update all state-related values when match is found
                                        setState(() {
                                          _selectedState = e.name ?? '';
                                          _selectedState = e.name ?? '';
                                          _selectedStateCode = e.code ?? '';
                                          _selectedStateId = e.id ?? 0;
                                        });
                                        stateFound = true;
                                        // Fetch cities for the matched state
                                        context.read<CityBloc>().add(
                                              GetCityEvent(
                                                stateId: _selectedStateId,
                                                stateCode: _selectedStateCode,
                                              ),
                                            );
                                        return;
                                      }
                                    }
                                  }
                                  // If user's state not found or empty, use first state as fallback
                                  if (!stateFound || _selectedState.isEmpty) {
                                    setState(() {
                                      _selectedState =
                                          state.states.first.name ?? '';
                                      _selectedStateCode =
                                          state.states.first.code ?? '';
                                      _selectedStateId =
                                          state.states.first.id ?? 0;
                                    });
                                    // Fetch cities for the fallback state
                                    context.read<CityBloc>().add(
                                          GetCityEvent(
                                            stateId: _selectedStateId,
                                            stateCode: _selectedStateCode,
                                          ),
                                        );
                                  }
                                }
                              }
                            },
                            builder: (BuildContext context, StatesState state) {
                              if (state is StatesLoaded) {
                                // Ensure the selected value exists in the items list
                                final bool isValidValue = state.states.any(
                                  (e) => e.name == _selectedState,
                                );
                                final String dropdownValue = isValidValue
                                    ? _selectedState
                                    : (state.states.isNotEmpty
                                        ? state.states.first.name ?? ''
                                        : '');

                                return AppDropDown(
                                  label: 'State',
                                  value: dropdownValue,
                                  items: state.states
                                      .map(
                                        (StateModel e) =>
                                            DropdownMenuItem<String>(
                                          value: e.name ?? '',
                                          child: Text(
                                            e.name ?? '',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppHelpers.isDarkMode(
                                                        context)
                                                    ? AppColors.white
                                                    : AppColors.black),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  title: 'Select State',
                                  onChanged: (String? stateName) {
                                    if (stateName == null) return;
                                    for (StateModel element in state.states) {
                                      if (element.name == stateName) {
                                        _selectedState = element.name ?? '';
                                        _selectedState = element.name ?? '';
                                        _selectedStateCode = element.code ?? '';
                                        _selectedStateId = element.id ?? 0;
                                        context.read<CityBloc>().add(
                                              GetCityEvent(
                                                stateId: _selectedStateId,
                                                stateCode: _selectedStateCode,
                                              ),
                                            );
                                        setState(() {});
                                        break;
                                      }
                                    }
                                  },
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: AppHelpers.getScreenWidth(context) * 0.45,
                          child: AppPrimaryInput(
                            enable: _selectedStateId != 0,
                            controller: cityController,
                            onTap: () {
                              context.pushNamed(CommonModule.citySearchName,
                                  extra: {
                                    'stateCode': _selectedStateCode,
                                    'stateName': _selectedState,
                                    'stateId': _selectedStateId,
                                    'onSelected': (CityModel city) {
                                      cityController.text = city.name ?? '';
                                    },
                                  });
                            },
                            maxCharacters: 200,
                            label: 'City*',
                            hint: 'Enter your city',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'City is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppPrimaryInput(
                    maxCharacters: 6,
                    label: 'Pin Code*',
                    hint: 'Enter your pin code',
                    controller: pinCodeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Pin code is required';
                      }
                      if (value.trim().length != 6) {
                        return 'Pin code must be 6 digits';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Pin code can only contain digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AppPrimaryButton(
                    bgColor: AppHelpers.isDarkMode(context)
                        ? AppColors.primary
                        : AppColors.black,
                    title: 'Save',
                    isLoading: false,
                    onPressed: () {
                      // Validate the form before saving
                      if (_formKey.currentState?.validate() ?? false) {
                        final BillingAddressModel data = BillingAddressModel(
                          addressLine1: addressLine1Controller.text,
                          addressLine2: addressLine2Controller.text,
                          city: cityController.text,
                          state: _selectedState,
                          pinCode: pinCodeController.text,
                          country: countryController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          mobileNumber: mobileNumberController.text,
                          countryCode: countryController.text,
                        );
                        widget.onSavePressed(data);
                      }
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
              strokeCap: StrokeCap.round,
            ),
          );
        },
      );
}
