import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../../core/common/bloc/states/states_bloc.dart';
import '../../../../../core/common/common_module.dart';
import '../../../../../core/common/models/city_model.dart';
import '../../../../../core/common/models/profile_data_model.dart';
import '../../../../../core/common/models/state_model.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/primary_input.dart';
import '../../../../../utils/app_helpers.dart';

class BillingSheet extends StatefulWidget {
  const BillingSheet({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.mobileNumberController,
    required this.addressLine1Controller,
    required this.addressLine2Controller,
    required this.cityController,
    required this.pinCodeController,
    this.profileData,
    required this.onSavePressed,
    required this.stateController,
    required this.countryController,
  });
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController mobileNumberController;
  final TextEditingController addressLine1Controller;
  final TextEditingController addressLine2Controller;
  final TextEditingController cityController;
  final TextEditingController pinCodeController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final ProfileModel? profileData;
  final Function(ProfileModel profileData) onSavePressed;
  @override
  State<BillingSheet> createState() => _BillingSheetState();
}

class _BillingSheetState extends State<BillingSheet> {
  String _selectedState = '';
  String _selectedStateCode = '';
  int _selectedStateId = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) {
        return;
      }

      // Extract user's state from profile data if available
      if (widget.profileData != null) {
        widget.firstNameController.text = widget.profileData?.firstName ?? '';
        widget.lastNameController.text = widget.profileData?.lastName ?? '';
        widget.emailController.text = widget.profileData?.email ?? '';
        widget.mobileNumberController.text = widget.profileData?.phone ?? '';
        widget.addressLine1Controller.text = widget.profileData?.address ?? '';

        final addressParts = widget.profileData?.address?.split(',');

        //remove state and city from address
        if (addressParts != null && addressParts.length > 2) {
          final List<String> addressList = [];
          widget.cityController.text = addressParts[1].trim();
          widget.pinCodeController.text = addressParts.last.trim();
          _selectedState = addressParts[2].trim();
          widget.stateController.text = _selectedState;
          for (var element in addressParts) {
            if ((element.toLowerCase().trim() ==
                    _selectedState.toLowerCase().trim()) ||
                (element.toLowerCase().trim() ==
                    widget.cityController.text.toLowerCase().trim()) ||
                (element.toLowerCase().trim() ==
                    widget.pinCodeController.text.toLowerCase().trim())) {
              continue;
            }
            addressList.add(element);
          }
          widget.addressLine1Controller.text = addressList.join(',');
        }
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        child: AppPrimaryInput(
                          maxCharacters: 20,
                          label: 'First Name*',
                          hint: 'Enter your first name',
                          controller: widget.firstNameController,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        child: AppPrimaryInput(
                          maxCharacters: 20,
                          label: 'Last Name*',
                          hint: 'Enter your last name',
                          controller: widget.lastNameController,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                AppPrimaryInput(
                  controller: widget.emailController,
                  maxCharacters: 20,
                  label: 'Email*',
                  hint: 'Enter your email',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            widget.countryController.text =
                                countryCode.code ?? 'IN';
                          },
                          hideSearch: true,
                          margin: const EdgeInsets.all(0),
                          dialogSize: Size(AppHelpers.getScreenWidth(context),
                              AppHelpers.getScreenHeight(context) * 0.6),
                          barrierColor: AppColors.black.withValues(alpha: 0.5),
                          flagDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: AppHelpers.getScreenWidth(context) * 0.6,
                        child: AppPrimaryInput(
                          controller: widget.mobileNumberController,
                          maxCharacters: 10,
                          label: 'Mobile Number*',
                          hint: 'Enter your mobile number',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                AppPrimaryInput(
                  controller: widget.addressLine1Controller,
                  maxCharacters: 100,
                  label: 'Address Line 1*',
                  hint: 'Enter your address line 1',
                ),
                const SizedBox(height: 10),
                AppPrimaryInput(
                  maxCharacters: 100,
                  label: 'Address Line 2',
                  hint: 'Enter your address line 2',
                  controller: widget.addressLine2Controller,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        child: BlocConsumer<StatesBloc, StatesState>(
                          listener: (BuildContext context, StatesState state) {
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
                                        widget.stateController.text =
                                            e.name ?? '';
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
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                title: 'Select State',
                                onChanged: (String? stateName) {
                                  if (stateName == null) return;
                                  for (StateModel element in state.states) {
                                    if (element.name == stateName) {
                                      widget.stateController.text =
                                          element.name ?? '';
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
                          controller: widget.cityController,
                          onTap: () {
                            context
                                .pushNamed(CommonModule.citySearchName, extra: {
                              'stateCode': _selectedStateCode,
                              'stateName': _selectedState,
                              'stateId': _selectedStateId,
                              'onSelected': (CityModel city) {
                                widget.cityController.text = city.name ?? '';
                              },
                            });
                          },
                          maxCharacters: 200,
                          label: 'City*',
                          hint: 'Enter your city',
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
                  controller: widget.pinCodeController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                AppPrimaryButton(
                  title: 'Save',
                  isLoading: false,
                  onPressed: () {
                    final ProfileModel data = ProfileModel(
                      address:
                          '${widget.addressLine1Controller.text},${widget.cityController.text},$_selectedState,${widget.pinCodeController.text}',
                      firstName: widget.firstNameController.text,
                      lastName: widget.lastNameController.text,
                      email: widget.emailController.text,
                      phone: widget.mobileNumberController.text,
                      role: 'user',
                    );
                    widget.onSavePressed(data);
                  },
                ),
              ],
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
