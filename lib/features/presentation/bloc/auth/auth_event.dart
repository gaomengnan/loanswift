part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// class LoadAuthTokenEvent extends AuthEvent {}

//class EnabledButtonStateEvent extends AuthEvent {}
//
//class DisabledButtonStateEvent extends AuthEvent {}

class UserLoginEvent extends AuthEvent {
  final String phone;
  final String code;

  UserLoginEvent({required this.phone, required this.code});
}

class AppStarupEvent extends AuthEvent {}

class UserLogoutEvent extends AuthEvent {}

class UserTokenExpiredEvent extends AuthEvent {}

class UserLoginLogTime extends AuthEvent {
  final DateTime? startTime;
  final DateTime? endTime;

  UserLoginLogTime({this.startTime, this.endTime});
}
