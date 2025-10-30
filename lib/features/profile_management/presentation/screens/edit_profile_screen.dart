import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../core/common/bloc/states/location_bloc.dart';
import '../../../../core/common/models/city_model.dart';
import '../../../../core/common/models/state_model.dart';
import '../../../../core/constants/app_styles.dart';
// import '../../../../core/utils/image_picker.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../flight_booking/flight_booking_module.dart';
import '../../../flight_booking/presentation/widgets/app_drop_down.dart';
import '../../bloc/profile_bloc.dart';
import '../widgets/delete_account_sheet.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // final AppImagePicker _appImagePicker = AppImagePicker();
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
  String _selectedState = '';
  String _selectedCity = '';
  int _selectedStateId = 0;
  String _selectedStateCode = '';
  final List<DropdownMenuItem<String>> _states = [];
  final List<DropdownMenuItem<String>> _cities = <DropdownMenuItem<String>>[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (context.mounted) {
        context.read<ProfileBloc>().add(const LoadProfileEvent());
        context.read<LocationBloc>().add(GetStatesEvent());
      }
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SafeArea(
            bottom: false,
            child: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileLoaded) {
                  List<String> addressList = [];

                  if (state.profileData.address != null) {
                    addressList = state.profileData.address?.split(',') ?? [];
                  }

                  if (addressList.isNotEmpty && addressList.length > 3) {
                    _pinController.text = addressList.last;
                    _selectedState = addressList[addressList.length - 2].trim();
                    _selectedCity = 'Raghunathpur';
                    // _selectedCity = addressList[addressList.length - 3];
                  }

                  _companyNameController.text = '';
                  _firstNameController.text = state.profileData.firstName ?? '';
                  _lastNameController.text = state.profileData.lastName ?? '';
                  _panNoController.text = '';
                  _emailController.text = state.profileData.email ?? '';
                  _phoneController.text = state.profileData.phone ?? '';
                  _addressController.text = state.profileData.address ?? '';
                  _nearbyAirportController.text = '';
                  _gstNoController.text = '';
                  _aadhaarNoController.text = '';
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.white,
                    ),
                  );
                }

                if (state is ProfileLoaded || state is ProfileUpdating) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppCustomAppbar(
                          centerTitle: 'Profile',
                          trailing: CircleAvatar(
                            backgroundColor: AppColors.black.withOpacity(0.1),
                            child: IconButton(
                              onPressed: () async {
                                await showDeleteAccountSheet(context: context);
                              },
                              icon: const Icon(
                                Icons.more_horiz_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Badge(
                        isLabelVisible: false,
                        // offset: const Offset(-10, -30),
                        // backgroundColor: AppColors.white,
                        // padding: const EdgeInsets.all(0),
                        // alignment: Alignment.bottomRight,
                        // label: InkWell(
                        //   onTap: () async {
                        //     XFile? image =
                        //         await _appImagePicker.pickFromGallery();
                        //     await showPhotoPreview(
                        //         context: context, url: image!.path);
                        //   },
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(6.0),
                        //     child: Icon(
                        //       Icons.camera_alt_rounded,
                        //       size: 20,
                        //     ),
                        //   ),
                        // ),
                        child: CircleAvatar(
                          radius: 60,
                          child: Text(
                            _firstNameController.text[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 45,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                          '${_firstNameController.text} ${_lastNameController.text}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white)),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  AppPrimaryInput(
                                    controller: _firstNameController,
                                    label: 'First Name',
                                    maxCharacters: 50,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _lastNameController,
                                    label: 'Last Name',
                                    maxCharacters: 50,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _emailController,
                                    label: 'Email',
                                    maxCharacters: 50,
                                    isMultiline: false,
                                    enable: false,
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _phoneController,
                                    label: 'Phone Number',
                                    maxCharacters: 10,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _aadhaarNoController,
                                    label: 'Aadhar Number',
                                    maxCharacters: 12,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _panNoController,
                                    label: 'Pan Number',
                                    maxCharacters: 10,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _nearbyAirportController,
                                    label: 'Nearby Airport',
                                    maxCharacters: 50,
                                    isMultiline: false,
                                    onTap: () {
                                      context.pushNamed(FlightBookingModule
                                          .airportSearchName);
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _addressController,
                                    label: 'Address',
                                    hint: 'Enter your address',
                                    maxCharacters: 20,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  BlocConsumer<CityBloc, CityState>(
                                    listener: (context, state) {
                                      if (state is CityLoaded) {
                                        _cities.clear();
                                        for (var element in state.cities) {
                                          _cities.add(
                                            DropdownMenuItem(
                                              value: element.name,
                                              child: Text(element.name ?? ''),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is CityLoaded) {
                                        return AppDropDown(
                                          label: 'City',
                                          value: _selectedCity,
                                          items: _cities,
                                          title: 'Select City',
                                          onChanged: (city) {
                                            setState(() {
                                              _selectedCity = city ?? '';
                                            });
                                          },
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  BlocConsumer<LocationBloc, LocationState>(
                                    listener: (context, state) {
                                      if (state is StatesLoaded) {
                                        if (_selectedState.isEmpty) {
                                          _selectedState =
                                              state.states[0].name ?? '';
                                          _selectedStateCode =
                                              state.states[0].code ?? '';
                                          _selectedStateId =
                                              state.states[0].id ?? 0;
                                        } else {
                                          for (var e in state.states) {
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
                                    builder: (context, state) {
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
                                          onChanged: (state) {
                                            setState(() {
                                              _selectedState = state ?? '';
                                            });
                                          },
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  AppPrimaryInput(
                                    controller: _pinController,
                                    label: 'Pincode',
                                    maxCharacters: 6,
                                    isMultiline: false,
                                  ),
                                  const SizedBox(height: 16),
                                  BlocConsumer<ProfileBloc, ProfileState>(
                                    listener: (context, state) async {
                                      log(state.toString());
                                      if (state is ProfileUpdated) {
                                        context
                                            .read<ProfileBloc>()
                                            .add(const LoadProfileEvent());
                                        AppHelpers.showSnackBar(context,
                                            'Profile updated successfully',
                                            backgroundColor: AppColors.success);
                                      }
                                      if (state is ProfileUpdateError) {
                                        await AppHelpers.showSnackBar(
                                            context, state.message);
                                      }
                                    },
                                    builder: (context, state) {
                                      return AppPrimaryButton(
                                        onPressed: () {
                                          Map<String, String> data = {
                                            "first_name": _firstNameController
                                                .text
                                                .trim(),
                                            "last_name":
                                                _lastNameController.text.trim(),
                                            "email":
                                                _emailController.text.trim(),
                                            "phone":
                                                _phoneController.text.trim(),
                                            "address":
                                                '${_addressController.text.trim().split(',').first}, ${_selectedCity.trim()}, $_selectedState, ${_pinController.text.trim()}',
                                          };
                                          context.read<ProfileBloc>().add(
                                              UpdateProfileEvent(data: data));
                                        },
                                        title: 'Update',
                                        isLoading: state is ProfileLoading,
                                        bgColor: AppColors.primary,
                                      );
                                    },
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
                    child: Text(state.message),
                  );
                }
                if (state is ProfileUpdateError) {
                  return Center(
                    child: Text(state.message),
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
  }
}
