part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class LoadAuthTokenEvent extends AuthEvent{}
class EnabledButtonStateEvent extends AuthEvent {}
class DisabledButtonStateEvent extends AuthEvent {}
