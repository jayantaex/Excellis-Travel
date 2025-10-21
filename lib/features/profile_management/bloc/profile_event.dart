part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class LoadProfileEvent extends ProfileEvent {
  final String token;
  const LoadProfileEvent({required this.token});

  @override
  List<Object> get props => [token];
}
