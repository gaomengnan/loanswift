part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnabledButtonStateEvent extends AuthEvent {}
class DisabledButtonStateEvent extends AuthEvent {}
