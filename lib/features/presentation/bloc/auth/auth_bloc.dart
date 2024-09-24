import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/core/storage.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/usecases/authenticated/login.dart';
import 'package:loanswift/features/domain/usecases/authenticated/logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _useCase;
  final LogoutUseCase _logoutUseCase;

  late final StreamSubscription<void> _subscription;

  DateTime? startTime;
  DateTime? endTime;

  AuthBloc({
    required LoginUseCase useCase,
    required LogoutUseCase logoutUseCase,
  })  : _useCase = useCase,
        _logoutUseCase = logoutUseCase,
        super(
          const AuthInitial(),
        ) {
    on<UserLoginEvent>(_userLoginHandler);
    on<AppStarupEvent>(_appStartUpHandler);
    on<UserLogoutEvent>(_userLogoutHandler);
    on<UserTokenExpiredEvent>(_userTokenExpiredHandler);
    on<UserLoginLogTime>(_userLoginLogTime);

    //_subscription = bus.stream.listen((_) {
    //  add(UserTokenExpiredEvent());
    //});

    _subscription = bus.on<LoginExpireEvent>().listen((e) {
      add(UserTokenExpiredEvent());
    });
  }

  void _userLoginLogTime(UserLoginLogTime event, Emitter<AuthState> emit) {
    if (event.startTime != null) {
      startTime = event.startTime;
    }

    if (event.endTime != null) {
      endTime = event.endTime;
    }

    if (startTime != null && endTime != null) {
      bus.fire(
        TargetPointEvent(
          startTime!,
          endTime!,
          SceneType.register,
        ),
      );
    }
  }

  void _userTokenExpiredHandler(
      UserTokenExpiredEvent event, Emitter<AuthState> emit) {
    Storage.removeToekn();

    emit(
      const LogoutSuccess(),
    );
  }

  void _userLogoutHandler(
      UserLogoutEvent event, Emitter<AuthState> emit) async {
    emit(
      LogoutLoading(
        authenticationStatus: state.authenticationStatus,
      ),
    );

    final res = await _logoutUseCase();

    res.fold((l) {
      emit(LogoutFailure(
        error: CustomError(
          message: l.message,
        ),
        authStatus: state.authenticationStatus,
      ));
    }, (r) {
      Storage.removeToekn();
      //GetStorage().remove(
      //  AppContant.tokenKey,
      //);

      emit(
        const LogoutSuccess(),
      );
    });
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

    final res = await _useCase(
      LoginRequest(
        phone: event.phone,
        code: event.code,
      ),
    );
    res.fold(
      (l) => emit(
        AuthFailure(
          error: CustomError(
            message: l.message,
          ),
        ),
      ),
      (r) {
        add(
          UserLoginLogTime(
            endTime: DateTime.now(),
          ),
        );

        final box = r.toMap();
        box['phone'] = event.phone;

        /*保存token 信息 本地*/
        GetStorage().write(
          AppContant.tokenKey,
          box,
        );

        emit(const AuthSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
