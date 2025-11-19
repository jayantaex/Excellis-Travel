part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => <Object>[];
}

final class LoginEvent extends AuthEvent {
  const LoginEvent(
      {required this.userName,
      required this.password,
      required this.userType,
      required this.fcmToken});
  final String userName;
  final String userType;
  final String password;
  final String fcmToken;

  @override
  List<Object> get props => <Object>[userName, password];
}

final class RegisterEvent extends AuthEvent {
  const RegisterEvent({
    required this.nearByAirport,
    required this.password,
    required this.confirmPassword,
    required this.userType,
    required this.companyName,
    required this.firstName,
    required this.lastName,
    required this.panNumber,
    required this.emailId,
    required this.phoneNumber,
    required this.officeAddress,
    required this.pinCode,
    required this.city,
    required this.state,
    required this.gstNumber,
    required this.aadhaarNumber,
  });
  final String password;
  final String userType;
  final String companyName;
  final String firstName;
  final String lastName;
  final String panNumber;
  final String emailId;
  final String phoneNumber;
  final String officeAddress;
  final String pinCode;
  final String city;
  final String state;
  final String gstNumber;
  final String aadhaarNumber;
  final String nearByAirport;
  final String confirmPassword;

  @override
  List<Object> get props => <Object>[
        password,
        userType,
        companyName,
        firstName,
        lastName,
        panNumber,
        emailId,
        phoneNumber,
        officeAddress,
        pinCode,
        city,
        state,
        gstNumber,
        aadhaarNumber
      ];
}

final class LogoutEvent extends AuthEvent {}

final class ResetPasswordEvent extends AuthEvent {
  const ResetPasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });
  final String currentPassword;
  final String newPassword;
}

final class SendRecoverLinkEvent extends AuthEvent {
  const SendRecoverLinkEvent({required this.email});
  final String email;
}
