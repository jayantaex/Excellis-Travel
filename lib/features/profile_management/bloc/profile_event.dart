part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class LoadProfileEvent extends ProfileEvent {
  const LoadProfileEvent();
}

final class UpdateProfileEvent extends ProfileEvent {
  final Map<String, dynamic> data;
  const UpdateProfileEvent({required this.data});
}
