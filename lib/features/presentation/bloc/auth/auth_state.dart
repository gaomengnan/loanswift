part of 'auth_bloc.dart';

// loginState
enum AuthenticationStatus {
  unknown,
  authenticated,
}

extension LoginStateEnum on AuthenticationStatus {
  bool get isLogined => this == AuthenticationStatus.authenticated;
}

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});

  @override
  List<Object?> get props => [];
}
