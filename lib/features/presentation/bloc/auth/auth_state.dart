part of 'auth_bloc.dart';

// 按钮状态
enum ButtonState {
  loading,
  forbidden,
  enabled,
}

extension ButtonStateEnum on ButtonState {
  bool get isEnabled => this == ButtonState.enabled;
  bool get isForbidden => this == ButtonState.forbidden;
  bool get isLoading => this == ButtonState.loading;
}

// loginState
enum LoginState {
  idel,
  logined,
}

extension LoginStateEnum on LoginState {
  bool get isLogined => this == LoginState.logined;
}

class AuthState extends Equatable {
  // token
  final String token;
  // logon state
  final LoginState loginState;
  // 按钮状态
  final ButtonState buttonState;

  const AuthState({
    required this.buttonState,
    required this.loginState,
    this.token = "",
  });

  factory AuthState.initial() {
    return const AuthState(
      buttonState: ButtonState.forbidden,
      loginState: LoginState.idel,
    );
  }

  AuthState copyWith({
    ButtonState? buttonState,
    LoginState? loginState,
    String? token,
  }) {
    return AuthState(
      buttonState: buttonState ?? this.buttonState,
      loginState: loginState ?? this.loginState,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [
        buttonState,
        loginState,
        token,
      ];
}
