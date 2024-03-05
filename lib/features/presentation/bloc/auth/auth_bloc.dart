import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          AuthState.initial(),
        ) {
    on<EnabledButtonStateEvent>(enabledButton);
    on<DisabledButtonStateEvent>(disabledButton);
  }

  // 解禁按钮状态
  void enabledButton(AuthEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      ButtonState.enabled,
    ));
  }

  void disabledButton(AuthEvent event, Emitter<AuthState> emit) {
    emit(const AuthState(
      buttonState: ButtonState.forbidden,
    ));
  }
}
