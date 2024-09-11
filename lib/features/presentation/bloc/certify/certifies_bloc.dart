import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/features/data/models/city_model.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/domain/usecases/authenticated/commit_certify.dart';
import 'package:loanswift/features/domain/usecases/authenticated/get_certifies.dart';
import 'package:loanswift/features/domain/usecases/common/get_cities.dart';

part 'certifies_event.dart';
part 'certifies_state.dart';

class CertifiesBloc extends Bloc<CertifiesEvent, CertifiesState> {
  final CommitCertify commitCertify;
  final GetCertifies getCertifies;
  final GetCities getCities;
  CertifiesBloc({
    required this.getCertifies,
    required this.commitCertify,
    required this.getCities,
  }) : super(CertifiesState.initial()) {
    on<CertifiesSettingsLoadEvent>(_certifiesLoadHandler);
    on<CertifyStepContinue>(_stepContinueHandler);
    on<CertifyStepBack>(_stepBackHander);
    on<CertifyStepRequest>(_stepRequestHander);
    on<CertifyCommitEvent>(_certifyCommitHandler);
    on<LoadCitiesEvent>(_loadCitiesHandler);
  }

  void _loadCitiesHandler(
      LoadCitiesEvent event, Emitter<CertifiesState> emit) async {
    final resp = await getCities();

    resp.fold(
        (l) => emit(CertifiesSettingLoadFailure(
            error: CustomError(message: l.message))), (r) {
      emit(CitiesState(
        cities: r,
        cerfityStep: state.cerfityStep,
        identifyInfo: state.identifyInfo,
        emergencyInfo: state.emergencyInfo,
        personalInfo: state.personalInfo,
        workInfo: state.workInfo,
      ));
    });
  }

  /*   BUILD IdentifyInfoCertifyCommitEvent   */
  void _certifyCommitHandler(
      CertifyCommitEvent event, Emitter<CertifiesState> emit) async {
    final resp = await commitCertify(CommitCertifyRequest(
        certifyId: event.certifyId, certifyResult: event.certifyResult));

    List<Info> currentData = [];

    switch (state.cerfityStep) {
      case StepperEnum.first:
        currentData = state.identifyInfo;
      case StepperEnum.second:
        currentData = state.personalInfo;
      case StepperEnum.third:
        currentData = state.emergencyInfo;
      default:
        currentData = state.workInfo;
    }

    resp.fold((l) {}, (r) {
      if (r.code == AppContant.apiSuccessCode) {
        final updated = currentData.map((e) {
          if (e.certifyId == event.certifyId) {
            return e.copyWith(
                certifyStatus: 1, certifyResult: event.certifyResult);
          }
          return e;
        }).toList();

        switch (state.cerfityStep) {
          case StepperEnum.first:
            emit(
              state.copyWith(identify: updated),
            );
          case StepperEnum.second:
            emit(
              state.copyWith(personal: updated),
            );

          case StepperEnum.third:
            emit(
              state.copyWith(emerge: updated),
            );

          case StepperEnum.fourth:
            emit(
              state.copyWith(work: updated),
            );

          default:
            emit(
              state.copyWith(personal: updated),
            );
        }
        //emit(
        //  state.copyWith(identify: updated),
        //);
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
      workInfo: state.workInfo,
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
            workInfo: l.jobInfo,
          ),
        );
      },
    );
  }
}
