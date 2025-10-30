part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

//fetch profile

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profileData;
  const ProfileLoaded({required this.profileData});
}

final class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});
}

//update profile

final class ProfileUpdating extends ProfileState {}

final class ProfileUpdated extends ProfileState {}

final class ProfileUpdateError extends ProfileState {
  final String message;
  const ProfileUpdateError({required this.message});
}
