import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/common/models/profile_data_model.dart';
import '../../../core/network/api_response.dart';
import '../data/profile_management_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<LoadProfileEvent>(_handleLoadProfileEvent);
    on<UpdateProfileEvent>(_handleUpdateProfileEvent);
  }
  final ProfileManagementRepository profileRepository;

  FutureOr<void> _handleLoadProfileEvent(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final ApiResponse<ProfileModel> res =
          await profileRepository.getUserProfile();
      final ProfileModel profileData = res.data ?? ProfileModel();
      // emit(const ProfileError(message: 'Access denied'));

      emit(ProfileLoaded(profileData: profileData));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> _handleUpdateProfileEvent(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileUpdating());
      final ApiResponse<ProfileModel> res =
          await profileRepository.updateProfile(
        body: event.data,
      );
      if (res.errorMessage == null) {
        emit(ProfileUpdated());
        return;
      }
      emit(
        ProfileUpdateError(
          message: res.errorMessage ?? 'Something went wrong',
        ),
      );
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
