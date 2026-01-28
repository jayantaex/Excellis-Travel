import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../core/common/bloc/states/states_bloc.dart';
import '../../../../core/common/common_module.dart';
import '../../../../core/common/models/city_model.dart';
import '../../../../core/common/models/state_model.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../flight_booking/flight_booking_module.dart';
import '../../../flight_booking/presentation/widgets/flight_search/app_drop_down.dart';
import '../../bloc/profile_bloc.dart';
import '../widgets/profile_avatar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _panNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _nearbyAirportController =
      TextEditingController();
  final TextEditingController _gstNoController = TextEditingController();
  final TextEditingController _aadhaarNoController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  String _selectedState = '';
  int _selectedStateId = 0;
  String _selectedStateCode = '';

  void onCityChange(CityModel city) {
    setState(() {
      _cityController.text = city.name ?? '';
    });
  }

  @override
  void initState() {
    Future.microtask(() {
      _handleFetchProfile();
      _handleFetchStates();
    });
    super.initState();
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _panNoController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _pinController.dispose();
    _nearbyAirportController.dispose();
    _gstNoController.dispose();
    _aadhaarNoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              bottom: false,
              child: BlocConsumer<ProfileBloc, ProfileState>(
                listener: (BuildContext context, ProfileState state) async {
                  log('state $state');

                  if (state is ProfileLoaded) {
                    List<String> addressList = <String>[];

                    if (state.profileData.address != null) {
                      addressList =
                          state.profileData.address?.split(',') ?? <String>[];
                    }

                    if (addressList.isNotEmpty && addressList.length > 3) {
                      _pinController.text = addressList.last.trim();
                      _selectedState =
                          addressList[addressList.length - 2].trim();
                      _cityController.text =
                          addressList[addressList.length - 3].trim();
                    }

                    _companyNameController.text = '';
                    _firstNameController.text =
                        state.profileData.firstName ?? '';
                    _lastNameController.text = state.profileData.lastName ?? '';
                    _panNoController.text = '';
                    _emailController.text = state.profileData.email ?? '';
                    _phoneController.text = state.profileData.phone ?? '';
                    _addressController.text = state.profileData.address ?? '';
                    _nearbyAirportController.text = '';
                    _gstNoController.text = '';
                    _aadhaarNoController.text = '';
                  }
                  if (state is ProfileError) {
                    await AppHelpers.showSnackBar(context, state.message,
                        backgroundColor: AppColors.error,
                        textColor: AppColors.white);
                  }
                },
                builder: (BuildContext context, ProfileState state) {
                  if (state is ProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.white,
                      ),
                    );
                  }

                  if (state is ProfileLoaded ||
                      state is ProfileUpdating ||
                      state is ProfileImageUpdating) {
                    return Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: AppCustomAppbar(centerTitle: 'Edit Profile'),
                        ),
                        const SizedBox(height: 20),
                        ProfileAvatarWidget(),
                        const SizedBox(height: 8),
                        Text(
                          '${_firstNameController.text} ${_lastNameController.text}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppHelpers.isDarkMode(context)
                                  ? AppColors.secondaryDark
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 20),
                                    AppPrimaryInput(
                                      controller: _firstNameController,
                                      label: 'First Name',
                                      maxCharacters: 50,
                                    ),
                                    const SizedBox(height: 16),
                                    AppPrimaryInput(
                                      controller: _lastNameController,
                                      label: 'Last Name',
                                      maxCharacters: 50,
                                    ),
                                    const SizedBox(height: 16),
                                    AppPrimaryInput(
                                      controller: _emailController,
                                      label: 'Email',
                                      maxCharacters: 50,
                                      enable: false,
                                    ),
                                    const SizedBox(height: 16),
                                    AppPrimaryInput(
                                      controller: _phoneController,
                                      label: 'Phone Number',
                                      maxCharacters: 10,
                                    ),
                                    // const SizedBox(height: 16),
                                    // AppPrimaryInput(
                                    //   controller: _aadhaarNoController,
                                    //   label: 'Aadhar Number',
                                    //   maxCharacters: 12,
                                    // ),
                                    // const SizedBox(height: 16),
                                    // AppPrimaryInput(
                                    //   controller: _panNoController,
                                    //   label: 'Pan Number',
                                    //   maxCharacters: 10,
                                    // ),
                                    // const SizedBox(height: 16),
                                    // AppPrimaryInput(
                                    //   controller: _nearbyAirportController,
                                    //   label: 'Nearby Airport',
                                    //   maxCharacters: 50,
                                    //   onTap: () {
                                    //     context.pushNamed(FlightBookingModule
                                    //         .airportSearchName);
                                    //   },
                                    // ),
                                    const SizedBox(height: 16),
                                    AppPrimaryInput(
                                      controller: _addressController,
                                      label: 'Address',
                                      hint: 'Enter your address',
                                      maxCharacters: 20,
                                    ),
                                    // const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    BlocConsumer<StatesBloc, StatesState>(
                                      listener: (BuildContext context,
                                          StatesState state) {
                                        if (state is StatesLoaded) {
                                          if (_selectedState.isEmpty) {
                                            _selectedState =
                                                state.states[0].name ?? '';
                                            _selectedStateCode =
                                                state.states[0].code ?? '';
                                            _selectedStateId =
                                                state.states[0].id ?? 0;
                                          } else {
                                            for (StateModel e in state.states) {
                                              if (e.name?.toLowerCase() ==
                                                  _selectedState
                                                      .toLowerCase()) {
                                                _selectedStateCode =
                                                    e.code ?? '';
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
                                      builder: (BuildContext context,
                                          StatesState state) {
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
                                              for (StateModel element
                                                  in state.states) {
                                                if (element.name == stateName) {
                                                  _selectedState =
                                                      element.name ?? '';
                                                  _selectedStateCode =
                                                      element.code ?? '';
                                                  _selectedStateId =
                                                      element.id ?? 0;
                                                }
                                              }
                                              setState(() {});
                                            },
                                          );
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    AppPrimaryInput(
                                      controller: _cityController,
                                      label: 'City*',
                                      enable: _selectedStateCode.isNotEmpty,
                                      onTap: () {
                                        context.pushNamed(
                                            CommonModule.citySearchName,
                                            extra: <String, Object>{
                                              'stateCode': _selectedStateCode,
                                              'stateName': _selectedState,
                                              'stateId': _selectedStateId,
                                              'onSelected': onCityChange
                                            });
                                      },
                                      maxCharacters: 6,
                                    ),
                                    const SizedBox(height: 16),
                                    AppPrimaryInput(
                                      controller: _pinController,
                                      label: 'Pincode',
                                      maxCharacters: 6,
                                    ),
                                    const SizedBox(height: 16),
                                    BlocConsumer<ProfileBloc, ProfileState>(
                                      listener: (BuildContext context,
                                          ProfileState state) async {
                                        if (state is ProfileUpdated) {
                                          context
                                              .read<ProfileBloc>()
                                              .add(const LoadProfileEvent());
                                          AppHelpers.showSnackBar(context,
                                              'Profile updated successfully',
                                              backgroundColor:
                                                  AppColors.success);
                                        }
                                        if (state is ProfileUpdateError) {
                                          await AppHelpers.showSnackBar(
                                              context, state.message);
                                        }
                                      },
                                      builder: (BuildContext context,
                                              ProfileState state) =>
                                          SizedBox(
                                        height: 45,
                                        width:
                                            AppHelpers.getScreenWidth(context),
                                        child: AppPrimaryButton(
                                          onPressed: () {
                                            final String firstName =
                                                _firstNameController.text
                                                    .trim();
                                            final String lastName =
                                                _lastNameController.text.trim();
                                            final String phone =
                                                _phoneController.text.trim();
                                            final String address =
                                                _addressController.text.trim();
                                            final String city =
                                                _cityController.text.trim();
                                            final String pincode =
                                                _pinController.text.trim();

                                            // Validate First Name
                                            if (firstName.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter your first name');
                                              return;
                                            }
                                            if (firstName.length < 3) {
                                              AppHelpers.showSnackBar(context,
                                                  'First name must be at least 3 characters');
                                              return;
                                            }
                                            if (firstName.split(' ').length >
                                                1) {
                                              AppHelpers.showSnackBar(context,
                                                  'First name should not contain spaces');
                                              return;
                                            }

                                            // Validate Last Name
                                            if (lastName.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter your last name');
                                              return;
                                            }
                                            if (lastName.length < 3) {
                                              AppHelpers.showSnackBar(context,
                                                  'Last name must be at least 3 characters');
                                              return;
                                            }

                                            // Validate Phone
                                            if (phone.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter your phone number');
                                              return;
                                            }
                                            if (!AppHelpers
                                                .validateMobileNumber(phone)) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter a valid 10-digit phone number');
                                              return;
                                            }

                                            // Validate Address
                                            if (address.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter your address');
                                              return;
                                            }

                                            // Validate State
                                            if (_selectedState.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please select a state');
                                              return;
                                            }

                                            // Validate City
                                            if (city.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter/select your city');
                                              return;
                                            }

                                            // Validate Pincode
                                            if (pincode.isEmpty) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter your pincode');
                                              return;
                                            }
                                            if (pincode.length != 6 ||
                                                int.tryParse(pincode) == null) {
                                              AppHelpers.showSnackBar(context,
                                                  'Please enter a valid 6-digit pincode');
                                              return;
                                            }

                                            final Map<String, String> data =
                                                <String, String>{
                                              'first_name': firstName,
                                              'last_name': lastName,
                                              'email':
                                                  _emailController.text.trim(),
                                              'phone': phone,
                                              'address':
                                                  '${address.split(',').first}, $city, $_selectedState, $pincode',
                                            };
                                            context.read<ProfileBloc>().add(
                                                UpdateProfileEvent(data: data));
                                          },
                                          title: 'Update',
                                          isLoading: state is ProfileLoading,
                                          bgColor: AppColors.primary,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  if (state is ProfileError) {
                    return Center(
                      child: Text(state.message,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          )),
                    );
                  }
                  if (state is ProfileUpdateError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: AppColors.error,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      'Something wents wrong',
                      style: TextStyle(fontSize: 14, color: AppColors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
  void _handleFetchProfile() {
    context.read<ProfileBloc>().add(const LoadProfileEvent());
  }

  void _handleFetchStates() {
    context.read<StatesBloc>().add(GetStatesEvent());
  }
}
