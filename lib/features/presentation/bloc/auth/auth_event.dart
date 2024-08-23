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
