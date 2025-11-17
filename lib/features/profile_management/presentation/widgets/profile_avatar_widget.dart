import 'dart:io';

import 'package:excellistravel/features/profile_management/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/image_picker.dart';
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
              backgroundColor: AppColors.white,
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
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                  ),
                ),
              ),
              child: CircleAvatar(
                radius: 60,
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
                            state.profileData.firstName![0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 45,
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
