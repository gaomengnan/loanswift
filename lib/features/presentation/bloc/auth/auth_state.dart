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
  final AuthenticationStatus authenticationStatus;

  const AuthState({required this.authenticationStatus});

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial()
      : super(authenticationStatus: AuthenticationStatus.unknown);
}

final class AuthSuccess extends AuthState {
  const AuthSuccess()
      : super(authenticationStatus: AuthenticationStatus.authenticated);
}

final class LogoutSuccess extends AuthState {
  const LogoutSuccess()
      : super(authenticationStatus: AuthenticationStatus.unknown);
}

final class AuthLoading extends AuthState {
  const AuthLoading()
      : super(authenticationStatus: AuthenticationStatus.unknown);
}

final class LogoutLoading extends AuthState {
  const LogoutLoading({
    required super.authenticationStatus,
  });
}

final class AuthFailure extends AuthState {
  final CustomError error;

  const AuthFailure({required this.error})
      : super(authenticationStatus: AuthenticationStatus.unknown);

  @override
  List<Object?> get props => [error];
}

final class LogoutFailure extends AuthState {
  final CustomError error;

  final AuthenticationStatus authStatus;

  const LogoutFailure({required this.authStatus, required this.error})
      : super(authenticationStatus: authStatus);

  @override
  List<Object?> get props => [error];
}
