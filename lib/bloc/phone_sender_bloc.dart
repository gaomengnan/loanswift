import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phone_sender_event.dart';
part 'phone_sender_state.dart';

class PhoneSenderBloc extends Bloc<PhoneSenderEvent, PhoneSenderState> {
  PhoneSenderBloc() : super(PhoneSenderInitial()) {
    on<PhoneSenderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
