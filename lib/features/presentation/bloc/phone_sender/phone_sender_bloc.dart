import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loanswift/core/failure.dart';
import 'package:loanswift/core/generated/l10n.dart';

import '../../../data/models/error.dart';
import '../../../data/models/models.dart';
import '../../../domain/repos/auth.dart';

part 'phone_sender_event.dart';
part 'phone_sender_state.dart';

class PhoneSenderBloc extends Bloc<PhoneSenderEvent, PhoneSenderState> {
  final Ticker _ticker;
  final AuthRepo _authRepo;
  static const _duration = 0;

  StreamSubscription<int>? _tickerSubscription;

  PhoneSenderBloc({
    required Ticker ticker,
    required AuthRepo authRepo,
  })  : _ticker = ticker,
        _authRepo = authRepo,
        super(
          PhoneSenderInitial(
            _duration,
            "",
            CountdownState.idle,
          ),
        ) {
    on<PhoneSenderStarted>(_onStarted);
    on<PhoneSenderReStarted>(_onReStarted);
    on<PhoneSenderTicked>(_onTicked);
    on<PhoneSenderPaused>(_onPaused);
    on<PhoneSenderResumed>(_onResumed);
    on<PhoneSenderReset>(_onReset);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(
    PhoneSenderStarted event,
    Emitter<PhoneSenderState> emit,
  ) async {
    if (state.countdownState.isRunning) {
      //emit(PhoneSenderVerifyState());
    } else {
      final res = await _authRepo.sendPhoneCode(
        phone: event.phone,
      );
      res.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              PhoneSenderErrorState(S.current.network_error),
            );
          }

          if (l is ServerFailure) {
            emit(
              PhoneSenderErrorState(S.current.service_error),
            );
          }

          if (l is ApiFailure) {}
        },
        (r) {
          _tickerSubscription?.cancel();
          // 验证框
          //emit(PhoneSenderVerifyState());
          // 触发倒计时
          emit(PhoneSenderRunInProgress(
            event.duration,
            event.phone,
            CountdownState.running,
          ));

          _tickerSubscription = _ticker.tick(ticks: event.duration).listen(
                (duration) => add(
                  PhoneSenderTicked(duration, event.phone),
                ),
              );
        },
      );
    }
  }

  void _onReStarted(
    PhoneSenderReStarted event,
    Emitter<PhoneSenderState> emit,
  ) {
    add(PhoneSenderStarted(
      event.duration,
      state.phone,
    ));
  }

  void _onTicked(PhoneSenderTicked event, Emitter<PhoneSenderState> emit) {
    if (event.duration <= 0) {
      _tickerSubscription?.cancel();
    }
    emit(event.duration > 0
        ? PhoneSenderRunInProgress(
            event.duration,
            event.phone,
            CountdownState.running,
          )
        : PhoneSenderRunComplete(
            state.phone,
          ));
  }

  void _onPaused(PhoneSenderPaused event, Emitter<PhoneSenderState> emit) {
    _tickerSubscription?.pause();
    emit(PhoneSenderRunPause(
      state.duration,
      state.phone,
      CountdownState.idle,
    ));
  }

  void _onResumed(PhoneSenderResumed event, Emitter<PhoneSenderState> emit) {
    _tickerSubscription?.resume();
    emit(PhoneSenderRunInProgress(
      event.duration,
      state.phone,
      CountdownState.running,
    ));
  }

  void _onReset(PhoneSenderReset event, Emitter<PhoneSenderState> emit) {
    _tickerSubscription?.cancel();
    emit(
      PhoneSenderInitial(
        _duration,
        "",
        CountdownState.idle,
      ),
    );
  }
}
