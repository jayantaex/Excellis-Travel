part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//login states
final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {}

final class Unauthenticated extends AuthState {
  final String message;
  const Unauthenticated({required this.message});
}

//registration states
final class RegistrationInProgress extends AuthState {}

final class RegistrationSuccess extends AuthState {}

final class RegistrationFailure extends AuthState {
  final String message;
  const RegistrationFailure({required this.message});

  @override
  List<Object> get props => [message];
}

//logout states
final class LogingOut extends AuthState {}

final class LoggedOutSucess extends AuthState {}

final class LoggedOutFailure extends AuthState {
  final String message;
  const LoggedOutFailure({required this.message});

  @override
  List<Object> get props => [message];
}

//error state
final class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
