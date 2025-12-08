import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:excellistravel/core/common/common_module.dart';
import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:excellistravel/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/primary_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../../core/common/bloc/states/states_bloc.dart';
import '../../../../../core/common/models/city_model.dart';
import '../../../../../core/common/models/state_model.dart';
import '../../../../../core/widgets/app_drop_down.dart';

class BillingSheet extends StatefulWidget {
  const BillingSheet(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.mobileNumberController,
      required this.addressLine1Controller,
      required this.addressLine2Controller,
      required this.cityController,
      required this.pinCodeController,
      required this.countryController});
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController mobileNumberController;
  final TextEditingController addressLine1Controller;
  final TextEditingController addressLine2Controller;
  final TextEditingController cityController;
  final TextEditingController pinCodeController;
  final TextEditingController countryController;

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
                              color: AppColors.grey.withOpacity(0.3)),
                        ),
                        height: 50,
                        width: AppHelpers.getScreenWidth(context) * 0.3,
                        child: CountryCodePicker(
                          favorite: const ['+91'],
                          onChanged: (CountryCode countryCode) {
                            widget.countryController.text =
                                countryCode.name ?? '';
                          },
                          hideSearch: true,
                          margin: const EdgeInsets.all(0),
                          dialogSize: Size(AppHelpers.getScreenWidth(context),
                              AppHelpers.getScreenHeight(context) * 0.6),
                          barrierColor: AppColors.black.withOpacity(0.5),
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
                const AppPrimaryInput(
                  maxCharacters: 100,
                  label: 'Address Line 2',
                  hint: 'Enter your address line 2',
                ),
                const SizedBox(height: 10),
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
                              if (_selectedState.isEmpty) {
                                _selectedState = state.states[0].name ?? '';
                                _selectedStateCode = state.states[0].code ?? '';
                                _selectedStateId = state.states[0].id ?? 0;
                              } else {
                                for (StateModel e in state.states) {
                                  if (e.name?.toLowerCase() ==
                                      _selectedState.toLowerCase()) {
                                    _selectedStateCode = e.code ?? '';
                                    _selectedStateId = e.id ?? 0;
                                  }
                                }
                              }
                              context.read<CityBloc>().add(
                                    GetCityEvent(
                                      stateId: _selectedStateId,
                                      stateCode: _selectedStateCode,
                                    ),
                                  );
                            }
                          },
                          builder: (BuildContext context, StatesState state) {
                            if (state is StatesLoaded) {
                              return AppDropDown(
                                label: 'State',
                                value: _selectedState,
                                items: state.states
                                    .map(
                                      (StateModel e) =>
                                          DropdownMenuItem<String>(
                                        value: e.name ?? '',
                                        child: Text(e.name ?? ''),
                                      ),
                                    )
                                    .toList(),
                                title: 'Select State',
                                onChanged: (String? stateName) {
                                  for (StateModel element in state.states) {
                                    if (element.name == stateName) {
                                      _selectedState = element.name ?? '';
                                      _selectedStateCode = element.code ?? '';
                                      _selectedStateId = element.id ?? 0;
                                    }
                                  }
                                  setState(() {});
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
                          maxCharacters: 20,
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
                AppPrimaryInput(
                  controller: widget.countryController,
                  maxCharacters: 20,
                  label: 'Country*',
                  hint: 'Enter your country',
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
}
