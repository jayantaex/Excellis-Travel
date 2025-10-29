import 'dart:developer';

import 'package:excellistravel/core/utils/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/image_picker.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/profile_bloc.dart';
import '../widgets/delete_account_sheet.dart';
import '../widgets/profile_photo_preview.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final AppImagePicker _appImagePicker = AppImagePicker();
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

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      String? token = await StorageService.getAccessToken();
      if (token != null && token.isNotEmpty) {
        context.mounted
            ? context.read<ProfileBloc>().add(LoadProfileEvent(token: token))
            : null;
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
    _officeAddressController.dispose();
    _pinController.dispose();
    _cityController.dispose();
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
              log("STATE::: $state", name: 'Edit Profile Screen');

              if (state is ProfileLoaded) {
                _companyNameController.text = '';
                _firstNameController.text = state.profileData.firstName ?? '';
                _lastNameController.text = state.profileData.lastName ?? '';
                _panNoController.text = '';
                _emailController.text = state.profileData.email ?? '';
                _phoneController.text = state.profileData.phone ?? '';
                _officeAddressController.text = state.profileData.address ?? '';
                _pinController.text = '';
                _cityController.text = '';
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

              if (state is ProfileLoaded) {
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
                      offset: const Offset(-10, -30),
                      backgroundColor: AppColors.white,
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.bottomRight,
                      label: InkWell(
                        onTap: () async {
                          XFile? image =
                              await _appImagePicker.pickFromGallery();
                          await showPhotoPreview(
                              context: context, url: image!.path);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Jhon Doe',
                        style: TextStyle(
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
                                  maxCharacters: 10,
                                  isMultiline: false,
                                ),
                                const SizedBox(height: 16),
                                AppPrimaryInput(
                                  controller: _officeAddressController,
                                  label: 'Office Address',
                                  maxCharacters: 10,
                                  isMultiline: false,
                                ),
                                const SizedBox(height: 16),
                                AppPrimaryInput(
                                  controller: _cityController,
                                  label: 'City',
                                  maxCharacters: 50,
                                  isMultiline: false,
                                ),
                                // const SizedBox(height: 16),
                                // AppPrimaryInput(
                                //   controller: ,
                                //   label: 'State',
                                //   maxCharacters: 50,
                                //   isMultiline: false,
                                // ),
                                const SizedBox(height: 16),
                                AppPrimaryInput(
                                  controller: _pinController,
                                  label: 'Pincode',
                                  maxCharacters: 6,
                                  isMultiline: false,
                                ),
                                const SizedBox(height: 16),
                                const AppPrimaryButton(
                                  title: 'Update',
                                  isLoading: false,
                                  bgColor: AppColors.primary,
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
    ));
  }
}
