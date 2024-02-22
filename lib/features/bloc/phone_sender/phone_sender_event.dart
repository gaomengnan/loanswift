part of 'phone_sender_bloc.dart';

abstract class PhoneSenderEvent extends Equatable {
  const PhoneSenderEvent();

  @override
  List<Object> get props => [];
}

class PhoneSenderStarted extends PhoneSenderEvent {
  final int duration;
  final String phone;
  const PhoneSenderStarted(
    this.duration,
    this.phone,
  );
}

class PhoneSenderReStarted extends PhoneSenderEvent {
  final int duration;
  const PhoneSenderReStarted(
    this.duration,
  );
}

class PhoneSenderPaused extends PhoneSenderEvent {
  const PhoneSenderPaused();
}

class PhoneSenderResumed extends PhoneSenderEvent {
  final int duration;
  const PhoneSenderResumed(this.duration);
}

class PhoneSenderReset extends PhoneSenderEvent {}

class PhoneSenderTicked extends PhoneSenderEvent {
  final int duration;
  final String phone;
  const PhoneSenderTicked(this.duration, this.phone);

  @override
  List<Object> get props => [duration];
}
