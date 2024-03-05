part of 'phone_sender_bloc.dart';
enum CountdownState {
  idle,
  running,
}

abstract class PhoneSenderState extends Equatable {
  final int duration;

  final String phone;

  final CountdownState countdownState;

  const PhoneSenderState(
    this.duration,
    this.phone,
    this.countdownState,
  );
  @override

  /// state instants compare each other by duration
  List<Object> get props => [phone, duration, countdownState,];
}

class PhoneSenderInitial extends PhoneSenderState {
  const PhoneSenderInitial(duration, phone, countdownState)
      : super(
          duration,
          phone,
          countdownState,
        );
}

class PhoneSenderRunInProgress extends PhoneSenderState {
  const PhoneSenderRunInProgress(
    int duration,
    String phone,
    CountdownState countdownState,
  ) : super(
          duration,
          phone,
          countdownState,
        );
}

class PhoneSenderRunPause extends PhoneSenderState {
  const PhoneSenderRunPause(
    int duration,
    String phone,
    CountdownState countdownState,
  ) : super(
          duration,
          phone,
          countdownState,
        );
}

class PhoneSenderRunComplete extends PhoneSenderState {
  /// at this state, PhoneSender's value is 0
  const PhoneSenderRunComplete(
    String phone,
  ) : super(
          0,
          phone,
          CountdownState.idle,
        );
}
