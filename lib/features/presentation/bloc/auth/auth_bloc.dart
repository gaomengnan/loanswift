import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

import '../../../domain/entity/entity.dart';

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
    //on<EnabledButtonStateEvent>(enabledButton);
    //on<DisabledButtonStateEvent>(disabledButton);
    // on<LoadAuthTokenEvent>(loadToken);
  }

  // 加载token
  // void loadToken(AuthEvent event, Emitter<AuthState> emit) {
  //   final token = _authRepo.getAuthToken();
  //   final AuthenticationStatus loginState;
  //   if (token.isNotEmpty) {
  //     loginState = AuthenticationStatus.authenticated;
  //   } else {
  //     // TODO 修改回idel状态
  //     loginState = AuthenticationStatus.unknown;
  //   }
  //   emit(state.copyWith(
  //     loginState: loginState,
  //   ));
  // }

  // 解禁按钮状态
  //void enabledButton(AuthEvent event, Emitter<AuthState> emit) {
  //  emit(state.copyWith(
  //    buttonState: ButtonStatus.enabled,
  //  ));
  //}

  //void disabledButton(AuthEvent event, Emitter<AuthState> emit) {
  //  emit(
  //    state.copyWith(
  //      buttonState: ButtonStatus.forbidden,
  //    ),
  //  );
  //}
}
