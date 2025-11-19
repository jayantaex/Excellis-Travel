import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../../../core/utils/storage_service.dart';
import '../../../core/utils/validators.dart';
import '../data/repository/auth_repository.dart';
import '../data/models/auth_resp_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthEvent>((AuthEvent event, Emitter<AuthState> emit) {});
    on<LoginEvent>(_handleLoginEvent);
    on<RegisterEvent>(_handleRegistrationEvent);
    on<LogoutEvent>(_handleLogoutEvent);
    on<ResetPasswordEvent>(_handleResetPasswordEvent);
    on<SendRecoverLinkEvent>(_recoverPassword);
  }
  AuthRepository authRepository;

  Future<void> _handleLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      if (event.userName.isEmpty || event.password.isEmpty) {
        emit(const AuthError(message: 'Please enter username and password'));
        return;
      }

      if (event.userType == '') {
        emit(const AuthError(message: 'Please select user type'));
      }

      final String? passwordError = Validators.password(event.password, 8);
      if (passwordError != null) {
        emit(AuthError(message: passwordError));
        return;
      }

      if (event.userName.contains('@')) {
        final String? emailError = Validators.email(event.userName);
        if (emailError != null) {
          emit(AuthError(message: emailError));
          return;
        }
      } else {
        final String? usernameError = Validators.username(event.userName);
        if (usernameError != null) {
          emit(AuthError(message: usernameError));
          return;
        }
      }

      final ApiResponse<AuthResponseModel> res = await authRepository.login(
        username: event.userName,
        password: event.password,
        fcmToken: event.fcmToken,
        userType: event.userType,
      );
      if (res.errorMessage != null) {
        emit(AuthError(message: res.errorMessage!));
        return;
      }
      //save token into local
      await StorageService.saveTokens(
          res.data?.data?.token ?? '', res.data?.data?.token ?? '');
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _handleRegistrationEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(RegistrationInProgress());
      final String? errMessage = validateRegisTration(
        userType: event.userType,
        companyName: event.companyName,
        firstName: event.firstName,
        lastName: event.lastName,
        panNumber: event.panNumber,
        emailId: event.emailId,
        phoneNumber: event.phoneNumber,
        officeAddress: event.officeAddress,
        pinCode: event.pinCode,
        state: event.state,
        city: event.city,
        nearByAirport: event.nearByAirport,
        gstNumber: event.gstNumber,
        aadhaarNumber: event.aadhaarNumber,
        password: event.password,
        confirmPassword: event.confirmPassword,
      );

      if (errMessage != null) {
        emit(RegistrationFailure(message: errMessage));
      } else {
        final ApiResponse<AuthResponseModel> res =
            await authRepository.register(
                firstName: event.firstName,
                lastName: event.lastName,
                email: event.emailId,
                phone: event.phoneNumber,
                role: event.userType,
                officeAddress: event.officeAddress,
                pinCode: event.pinCode,
                state: event.state,
                city: event.city,
                nearByAirport: event.nearByAirport,
                gstNumber: event.gstNumber,
                aadhaarNumber: event.aadhaarNumber,
                password: event.password,
                commissionRate: 5,
                isDirectBooking: true);

        if (res.errorMessage != null) {
          emit(RegistrationFailure(message: res.errorMessage!));
        } else {
          emit(RegistrationSuccess());
        }
      }
    } catch (e) {
      emit(RegistrationFailure(message: e.toString()));
    }
  }

  Future<void> _handleLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(LogingOut());
    try {
      emit(LoggedOutSucess());
    } catch (e) {
      emit(LoggedOutFailure(message: e.toString()));
    }
  }

  Future<void> _handleResetPasswordEvent(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    try {
      emit(PasswordResetInProgress());
      final ApiResponse<bool> res = await authRepository.resetPassword(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword);
      if (res.errorMessage != null) {
        emit(PasswordResetFailure(message: res.errorMessage!));
      } else {
        emit(PasswordResetSuccess());
      }
    } catch (e) {
      emit(PasswordResetFailure(message: e.toString()));
    }
  }

  Future<void> _recoverPassword(
      SendRecoverLinkEvent event, Emitter<AuthState> emit) async {
    try {
      emit(PasswordResetInProgress());
      final ApiResponse<bool> res =
          await authRepository.sendRecoverLink(email: event.email);
      if (res.errorMessage != null) {
        emit(PasswordResetFailure(message: res.errorMessage!));
      } else {
        emit(PasswordResetSuccess());
      }
    } catch (e) {
      emit(PasswordResetFailure(message: e.toString()));
    }
  }
}

String? validateRegisTration(
    {required String userType,
    required String companyName,
    required String firstName,
    required String lastName,
    required String panNumber,
    required String emailId,
    required String phoneNumber,
    required String officeAddress,
    required String pinCode,
    required String state,
    required String city,
    required String nearByAirport,
    required String gstNumber,
    required String aadhaarNumber,
    required String password,
    required String confirmPassword}) {
  if (password.isEmpty ||
      confirmPassword.isEmpty ||
      password.length < 8 ||
      confirmPassword.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (password != confirmPassword) {
    return 'Passwords do not match';
  }

  if (userType == 'retailer') {
    if (companyName.isEmpty || companyName.length < 3) {
      return 'Company name must be at least 3 characters long';
    }

    if (firstName.isEmpty || firstName.length < 3) {
      return 'First name must be at least 3 characters long';
    }

    if (lastName.isEmpty || lastName.length < 3) {
      return 'Last name must be at least 3 characters long';
    }

    if (emailId.isEmpty || !emailId.contains('@')) {
      return 'Please enter a valid email address';
    }

    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      return 'Phone number must be at least 10 characters long';
    }

    if (password.isEmpty || password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (confirmPassword.isEmpty || confirmPassword.length < 8) {
      return 'Confirm password must be at least 8 characters long';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
  } else {
    if (firstName.isEmpty || firstName.length < 3) {
      return 'First name must be at least 3 characters long';
    }

    if (lastName.isEmpty || lastName.length < 3) {
      return 'Last name must be at least 3 characters long';
    }

    if (emailId.isEmpty || !emailId.contains('@')) {
      return 'Please enter a valid email address';
    }

    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      return 'Phone number must be at least 10 characters long';
    }

    if (password.isEmpty || password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (confirmPassword.isEmpty || confirmPassword.length < 8) {
      return 'Confirm password must be at least 8 characters long';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
  }

  return null;
}
