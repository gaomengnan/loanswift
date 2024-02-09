part of 'phone_sender_bloc.dart';

abstract class PhoneSenderState extends Equatable {
  final int duration;

  final String phone;

  const PhoneSenderState(
    this.duration,
    this.phone,
  );
  @override

  /// state instants compare each other by duration
  List<Object> get props => [phone, duration];
}

class PhoneSenderInitial extends PhoneSenderState {
  const PhoneSenderInitial(duration, phone)
      : super(
          duration,
          phone,
        );
}

class PhoneSenderRunInProgress extends PhoneSenderState {
  const PhoneSenderRunInProgress(
    int duration,
    String phone,
  ) : super(
          duration,
          phone,
        );
}

class PhoneSenderRunPause extends PhoneSenderState {
  const PhoneSenderRunPause(
    int duration,
    String phone,
  ) : super(
          duration,
          phone,
        );
}

class PhoneSenderRunComplete extends PhoneSenderState {
  /// at this state, PhoneSender's value is 0
  const PhoneSenderRunComplete(
    String phone,
  ) : super(
          0,
          phone,
        );
}
