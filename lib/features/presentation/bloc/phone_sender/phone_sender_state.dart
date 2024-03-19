part of 'phone_sender_bloc.dart';

enum CountdownState {
  idle,
  running,
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
          CustomError(error: ""),
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
          CustomError(error: ""),
        );
}

class PhoneSenderRunPause extends PhoneSenderState {
  PhoneSenderRunPause(
    int duration,
    String phone,
    CountdownState countdownState,
  ) : super(
          duration,
          phone,
          countdownState,
          CustomError(error: "")
        );
}

class PhoneSenderRunComplete extends PhoneSenderState {
  /// at this state, PhoneSender's value is 0
  PhoneSenderRunComplete(
    String phone,
  ) : super(
          0,
          phone,
          CountdownState.idle,
          CustomError(error: ""),
        );
}

class PhoneSenderErrorState extends PhoneSenderState {
  PhoneSenderErrorState(String error)
      : super(
          0,
          "",
          CountdownState.idle,
          CustomError(error: error),
        );
}
