import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/usecases/authenticated/commit_certify.dart';
import 'package:loanswift/features/domain/usecases/authenticated/get_certifies.dart';

part 'certifies_event.dart';
part 'certifies_state.dart';

class CertifiesBloc extends Bloc<CertifiesEvent, CertifiesState> {
  final CommitCertify commitCertify;
  final GetCertifies getCertifies;
  CertifiesBloc({
    required this.getCertifies,
    required this.commitCertify,
  }) : super(CertifiesState.initial()) {
    on<CertifiesSettingsLoadEvent>(_certifiesLoadHandler);
    on<CertifyStepContinue>(_stepContinueHandler);
    on<CertifyStepBack>(_stepBackHander);
    on<CertifyStepRequest>(_stepRequestHander);
    on<CertifyCommitEvent>(_certifyCommitHandler);
  }

  void _certifyCommitHandler(
      CertifyCommitEvent event, Emitter<CertifiesState> emit) async {
    final resp = await commitCertify(CommitCertifyRequest(
        certifyId: event.certifyId, certifyResult: event.certifyResult));

    resp.fold((l) {}, (r) {
      if (r.code == AppContant.apiSuccessCode) {
        //add(CertifiesSettingsLoadEvent());
        //if (state.cerfityStep == 1) {
        //  state.settings.identityInfo.map((e) {
        //    if (e.certifyId == event.certifyId) {
        //      e.copyWith(certifyStatus: 1);
        //    }
        //  });
        //}
      }
    });
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
