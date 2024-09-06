import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
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
    on<IdentifyInfoCertifyCommitEvent>(_indentifyInfoCertifyCommitHandler);
  }

  /*   BUILD IdentifyInfoCertifyCommitEvent   */
  void _indentifyInfoCertifyCommitHandler(IdentifyInfoCertifyCommitEvent event,
      Emitter<CertifiesState> emit) async {
    final resp = await commitCertify(CommitCertifyRequest(
        certifyId: event.certifyId, certifyResult: event.certifyResult));

    resp.fold((l) {}, (r) {
      if (r.code == AppContant.apiSuccessCode) {
        final updated = state.identifyInfo.map((e) {
          if (e.certifyId == event.certifyId) {
            return e.copyWith(
                certifyStatus: 1, certifyResult: event.certifyResult);
          }
          return e;
        }).toList();

        emit(
          state.copyWith(identify: updated),
        );
      }
    });
  }

  /*  NEST STEP REQUEST  */

  void _stepRequestHander(
      CertifyStepRequest event, Emitter<CertifiesState> emit) {
    // 检查当前是否完成

    //if (state.identifyInfo.any((e) => e.certifyStatus == 1)) {
    //  return;
    //}

    emit(CertifiesRequestState(
      cerfityStep: state.cerfityStep,
      identifyInfo: state.identifyInfo,
      emergencyInfo: state.emergencyInfo,
      personalInfo: state.personalInfo,
    ));
  }

  void _stepBackHander(CertifyStepBack event, Emitter<CertifiesState> emit) {
    final step = state.cerfityStep;
    if (step.isFirstStep) {
      return;
    }
    emit(state.copyWith(step: step.previousStep));
  }

  void _stepContinueHandler(
      CertifyStepContinue event, Emitter<CertifiesState> emit) async {
    //final step = state.cerfityStep;
    emit(state.copyWith(step: state.cerfityStep.nextStep));
  }

  // 加载认证项目
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
      (l) {
        StepperEnum currentStep = StepperEnum.first;

        if (l.identityInfo
            .every((element) => element.isCertify() && element.isMust())) {
          currentStep = currentStep.nextStep;
        }

        if (l.emergencyInfo
            .every((element) => element.isCertify() && element.isMust())) {
          currentStep = currentStep.nextStep;
        }

        emit(
          CertifiesSettingsLoadSuccess(
            cerfityStep: currentStep,
            //settings: l,
            identifyInfo: l.identityInfo,
            emergencyInfo: l.emergencyInfo,
            personalInfo: l.personalInfo,
          ),
        );
      },
    );
  }
}
