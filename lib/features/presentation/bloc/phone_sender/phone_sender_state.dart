part of 'phone_sender_bloc.dart';

enum CountdownState {
  idle,
  processing,
  running,
}

extension CountdownStateEnum on CountdownState {
  bool get isRunning => this == CountdownState.running;
}

abstract class PhoneSenderState extends Equatable {
  final CustomError error;
  // final String error;

  final int duration;

  final String phone;

  final CountdownState countdownState;

  const PhoneSenderState(
    this.duration,
    this.phone,
    this.countdownState,
    this.error,
  );

  @override
  List<Object> get props => [
        phone,
        duration,
        countdownState,
        error,
      ];
}

class PhoneSenderInitial extends PhoneSenderState {
  PhoneSenderInitial(duration, phone, countdownState)
      : super(
          duration,
          phone,
          countdownState,
          CustomError(message: ""),
        );
}

class PhoneSenderRunInProgress extends PhoneSenderState {
  PhoneSenderRunInProgress(
    int duration,
    String phone,
    CountdownState countdownState,
  ) : super(
          duration,
          phone,
          countdownState,
          CustomError(message: ""),
        );
}

class PhoneSenderRunPause extends PhoneSenderState {
  PhoneSenderRunPause(
    int duration,
    String phone,
    CountdownState countdownState,
  ) : super(duration, phone, countdownState, CustomError(message: ""));
}

class PhoneSenderRunComplete extends PhoneSenderState {
  /// at this state, PhoneSender's value is 0
  PhoneSenderRunComplete(
    String phone,
  ) : super(
          0,
          phone,
          CountdownState.idle,
          CustomError(message: ""),
        );
}

class PhoneSenderErrorState extends PhoneSenderState {
  PhoneSenderErrorState(String error, String phone, CountdownState countState)
      : super(
          0,
          phone,
          countState,
          CustomError(message: error),
        );

  @override
  List<Object> get props => [
        phone,
        //duration,
        //countdownState,
        //error,
      ];
}

class PhoneSenderVerifyState extends PhoneSenderState {
  PhoneSenderVerifyState()
      : super(
          0,
          "",
          CountdownState.running,
          CustomError(message: ""),
        );
}

class PhoneSenderLoadingState extends PhoneSenderState {
  const PhoneSenderLoadingState(
      super.duration, super.phone, super.countdownState, super.error);
}

class PhoneSenderSuccessState extends PhoneSenderState {
  const PhoneSenderSuccessState(
      super.duration, super.phone, super.countdownState, super.error);

  @override
  List<Object> get props => [
        phone,
        //duration,
        //countdownState,
        //error,
      ];
}
