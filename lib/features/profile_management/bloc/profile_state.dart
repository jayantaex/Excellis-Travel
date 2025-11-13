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
  const ProfileLoaded({required this.profileData});
  final ProfileModel profileData;
}

final class ProfileError extends ProfileState {
  const ProfileError({required this.message});
  final String message;
}

//update profile

final class ProfileUpdating extends ProfileState {}

final class ProfileUpdated extends ProfileState {}

final class ProfileUpdateError extends ProfileState {
  const ProfileUpdateError({required this.message});
  final String message;
}
