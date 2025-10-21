import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginEvent>(_handleLoginEvent);
    on<RegisterEvent>(_handleRegistrationEvent);
    on<LogoutEvent>(_handleLogoutEvent);
  }

  FutureOr<void> _handleLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await authRepository.login(event.username, event.password);
      emit(Authenticated(token: user.data!));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  FutureOr<void> _handleRegistrationEvent(
      RegisterEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> _handleLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) {
    emit(LogingOut());
    try {
      emit(LoggedOutSucess());
    } catch (e) {
      emit(LoggedOutFailure(message: e.toString()));
    }
  }
}
