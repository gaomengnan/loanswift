import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/usecases/authenticated/get_certifies.dart';

part 'certifies_event.dart';
part 'certifies_state.dart';

class CertifiesBloc extends Bloc<CertifiesEvent, CertifiesState> {
  final GetCertifies getCertifies;
  CertifiesBloc({
    required this.getCertifies,
  }) : super(CertifiesState.initial()) {
    on<CertifiesSettingsLoadEvent>(_certifiesLoadHandler);
    on<CertifyStepContinue>(_stepContinueHandler);
    on<CertifyStepBack>(_stepBackHander);
    on<CertifyStepRequest>(_stepRequestHander);
  }

  void _stepRequestHander(
      CertifyStepRequest event, Emitter<CertifiesState> emit) {
    emit(CertifiesRequestState(
        cerfityStep: state.cerfityStep, settings: state.settings));
  }

  void _stepBackHander(CertifyStepBack event, Emitter<CertifiesState> emit) {
    final step = state.cerfityStep;
    if (step == 0) {
      return;
    }
    emit(state.copyWith(step: step - 1));
  }

  void _stepContinueHandler(
      CertifyStepContinue event, Emitter<CertifiesState> emit) async {
    final step = state.cerfityStep;
    emit(state.copyWith(step: step + 1));
  }

  void _certifiesLoadHandler(
      CertifiesEvent event, Emitter<CertifiesState> emit) async {
    emit(CertifiesSettingsLoading());
    final resp = await getCertifies();

    resp.fold(
      (l) => emit(
        CertifiesSettingLoadFailure(
          error: CustomError(message: l.message),
        ),
      ),
      (l) => emit(
        CertifiesSettingsLoadSuccess(
            cerfityStep: state.cerfityStep, settings: l),
      ),
    );
  }
}
