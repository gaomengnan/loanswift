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

class AuthState extends Equatable {
  // 按钮状态
  final ButtonState buttonState;
  const AuthState({
    required this.buttonState,
  });

  factory AuthState.initial() {
    return const AuthState(
      buttonState: ButtonState.forbidden,
    );
  }

  AuthState copyWith(
    buttonState,
  ) {
    return AuthState(
      buttonState: buttonState,
    );
  }

  @override
  List<Object> get props => [buttonState];
}
