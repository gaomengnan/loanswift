import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/usecases/authenticated/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginer;

  AuthBloc({
    required LoginUsecase loginer,
  })  : _loginer = loginer,
        super(
          const AuthInitial(),
        ) {
    on<UserLoginEvent>(_userLoginHandler);
    on<AppStarupEvent>(_appStartUpHandler);
    on<UserLogoutEvent>(_userLogoutHandler);
  }

  void _userLogoutHandler(UserLogoutEvent event, Emitter<AuthState> emit) {
    GetStorage().remove(
      AppContant.tokenKey,
    );

    emit(
      const AuthInitial(),
    );
  }

  void _appStartUpHandler(AppStarupEvent event, Emitter<AuthState> emit) {
    final token = GetStorage()
        .read<DataMap>(AppContant.tokenKey); /* 假设本地有token，如果没有，使用初始值 */
    debugPrint('本地token：$token');
    if (token != null) {
      emit(
        const AuthSuccess(),
      );
    }
  }

  void _userLoginHandler(UserLoginEvent event, Emitter<AuthState> emit) async {
    /*  LOADING */
    emit(
      const AuthLoading(),
    );
    /**/

    final res = await _loginer(
      LoginRequest(
        phone: event.phone,
        code: event.code,
      ),
    );
    res.fold(
      (l) => emit(
        AuthFailure(
          error: CustomError(
            error: l.message,
          ),
        ),
      ),
      (r) {
        /*  设置登陆状态 */
        emit(
          const AuthSuccess(),
        );

        final box = r.toMap();

        box['phone'] = event.phone;

        /*保存token 信息 本地*/
        GetStorage().write(
          AppContant.tokenKey,
          box,
        );
      },
    );
  }
}
