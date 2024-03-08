import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;

  AuthBloc({
    required AuthRepo authRepo,
  })  : _authRepo = authRepo,
        super(
          AuthState.initial(),
        ) {
    on<EnabledButtonStateEvent>(enabledButton);
    on<DisabledButtonStateEvent>(disabledButton);
    on<LoadAuthTokenEvent>(loadToken);
  }

  // 加载token
  void loadToken(AuthEvent event, Emitter<AuthState> emit) {
    final token = _authRepo.getAuthToken();
    final LoginState loginState;
    if (token.isNotEmpty) {
      loginState = LoginState.logined;
    } else {
      loginState = LoginState.idel;
    }
    emit(state.copyWith(
      loginState: loginState,
      token: token,
    ));
  }

  // 解禁按钮状态
  void enabledButton(AuthEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      buttonState: ButtonState.enabled,
    ));
  }

  void disabledButton(AuthEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        buttonState: ButtonState.forbidden,
      ),
    );
  }
}
