import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../utils/image_picker.dart';
import '../../bloc/profile_bloc.dart';
import 'profile_photo_preview.dart';

class ProfileAvatarWidget extends StatelessWidget {
  ProfileAvatarWidget({super.key, this.isEditable = true});
  bool? isEditable;
  final AppImagePicker _appImagePicker = AppImagePicker();
  final String imageBaseUrl =
      'https://api.excellistravel.com//auth/profile/image/';

  @override
  Widget build(BuildContext context) => BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return Badge(
              isLabelVisible: isEditable! && state is! ProfileImageUpdating,
              offset: const Offset(-10, -30),
              backgroundColor: AppHelpers.isDarkMode(context)
                  ? AppColors.secondaryDark
                  : AppColors.white,
              padding: const EdgeInsets.all(0),
              alignment: Alignment.bottomRight,
              label: InkWell(
                onTap: () async {
                  final XFile? image = await _appImagePicker.pickFromGallery();
                  if (context.mounted) {
                    await showPhotoPreview(
                      context: context,
                      url: image!.path,
                      onUpdate: () {
                        context.read<ProfileBloc>().add(UpdateProfileImageEvent(
                              imageFile: File(image.path),
                            ));
                      },
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.primary,
                  ),
                ),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppHelpers.isDarkMode(context)
                    ? AppColors.white.withValues(alpha: 0.1)
                    : AppColors.white.withValues(alpha: 0.2),
                backgroundImage: state is ProfileImageUpdating ||
                        state.profileData.profileImage == null ||
                        state.profileData.profileImage == ''
                    ? null
                    : NetworkImage(
                        '$imageBaseUrl${state.profileData.profileImage?.split('/').last}'),
                child: state is ProfileImageUpdating
                    ? const CircularProgressIndicator.adaptive()
                    : state.profileData.profileImage == null ||
                            state.profileData.profileImage == ''
                        ? Text(
                            state.profileData.firstName?.isNotEmpty == true
                                ? state.profileData.firstName![0].toUpperCase()
                                : 'G',
                            style: TextStyle(
                              fontSize: 45,
                              color: AppHelpers.isDarkMode(context)
                                  ? AppColors.white
                                  : AppColors.white,
                            ),
                          )
                        : const SizedBox(),
              ),
            );
          } else {
            return const CircleAvatar(
                radius: 60, child: CircularProgressIndicator.adaptive());
          }
        },
      );
}
