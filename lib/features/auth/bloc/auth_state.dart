part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => <Object>[];
}

final class AuthInitial extends AuthState {}

//login states
final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {}

final class Unauthenticated extends AuthState {
  const Unauthenticated({required this.message});
  final String message;
}

//registration states
final class RegistrationInProgress extends AuthState {}

final class RegistrationSuccess extends AuthState {}

final class RegistrationFailure extends AuthState {
  const RegistrationFailure({required this.message});
  final String message;

  @override
  List<Object> get props => <Object> [message];
}

//logout states
final class LogingOut extends AuthState {}

final class LoggedOutSucess extends AuthState {}

final class LoggedOutFailure extends AuthState {
  const LoggedOutFailure({required this.message});
  final String message;

  @override
  List<Object> get props => <Object> [message];
}

//error state
final class AuthError extends AuthState {
  const AuthError({required this.message});
  final String message;

  @override
  List<Object> get props => <Object> [message];
}
