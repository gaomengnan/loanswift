import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';




part 'phone_sender_event.dart';
part 'phone_sender_state.dart';

class PhoneSenderBloc extends Bloc<PhoneSenderEvent, PhoneSenderState> {
  final Ticker _ticker;
  static const _duration = 0;

  StreamSubscription<int>? _tickerSubscription;

  PhoneSenderBloc({required Ticker ticker})
      : _ticker = ticker,
        super(
          const PhoneSenderInitial(
            _duration,
            "",
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

  void _onStarted(PhoneSenderStarted event, Emitter<PhoneSenderState> emit) {
    _tickerSubscription?.cancel();

    emit(PhoneSenderRunInProgress(
      event.duration,
      event.phone,
    ));

    _tickerSubscription = _ticker.tick(ticks: event.duration).listen(
          (duration) => add(
            PhoneSenderTicked(
              duration,
              event.phone,
            ),
          ),
        );
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
    if (event.duration <= 0 ) {
      _tickerSubscription?.cancel();
    }
    emit(event.duration > 0
        ? PhoneSenderRunInProgress(
            event.duration,
            event.phone,
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
    ));
  }

  void _onResumed(PhoneSenderResumed event, Emitter<PhoneSenderState> emit) {
    _tickerSubscription?.resume();
    emit(PhoneSenderRunInProgress(
      event.duration,
      state.phone,
    ));
  }

  void _onReset(PhoneSenderReset event, Emitter<PhoneSenderState> emit) {
    _tickerSubscription?.cancel();
    emit(
      const PhoneSenderInitial(
        _duration,
        "",
      ),
    );
  }
}
