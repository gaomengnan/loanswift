import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/domain/usecases/authenticated/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginer;

  AuthBloc({
    required LoginUsecase loginer,
  })  : _loginer = loginer,
        super(
          AuthInitial(),
        ) {
    on<UserLoginEvent>(_userLoginHandler);
  }

  void _userLoginHandler(UserLoginEvent event, Emitter<AuthState> emit) async {
    final res = await _loginer(
      LoginRequest(
        phone: event.phone,
        code: event.code,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => emit(AuthSuccess()),
    );
  }
}
