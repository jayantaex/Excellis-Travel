import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/profile_data_model.dart';
import '../../../core/network/api_response.dart';
import '../data/profile_management_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileManagementRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<LoadProfileEvent>(_handleLoadProfileEvent);
  }

  FutureOr<void> _handleLoadProfileEvent(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      ApiResponse res = await profileRepository.getUserProfile(event.token);
      var profileData = res.data;

      emit(ProfileLoaded(profileData: profileData));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
