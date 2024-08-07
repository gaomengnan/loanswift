part of 'auth_bloc.dart';

// 按钮状态
//enum ButtonStatus {
//  loading,
//  forbidden,
//  enabled,
//}

//extension ButtonStateEnum on ButtonStatus {
//  bool get isEnabled => this == ButtonStatus.enabled;
//  bool get isForbidden => this == ButtonStatus.forbidden;
//  bool get isLoading => this == ButtonStatus.loading;
//}

// loginState
enum AuthenticationStatus {
  unknown,
  authenticated,
}

extension LoginStateEnum on AuthenticationStatus {
  bool get isLogined => this == AuthenticationStatus.authenticated;
}

class AuthState extends Equatable {
  // logon state
  final AuthenticationStatus loginState;
  // 按钮状态
  //final ButtonStatus buttonState;

  final User? user;

  const AuthState({
    //required this.buttonState,
    required this.loginState,
    required this.user,
  });

  factory AuthState.initial() {
    return const AuthState(
      //buttonState: ButtonStatus.enabled,
      loginState: AuthenticationStatus.authenticated,
      user: null,
    );
  }

  AuthState copyWith({
    //ButtonStatus? buttonState,
    AuthenticationStatus? loginState,
    User? user,
  }) {
    return AuthState(
      //buttonState: buttonState ?? this.buttonState,
      loginState: loginState ?? this.loginState,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        //buttonState,
        loginState,
        user,
      ];
}
