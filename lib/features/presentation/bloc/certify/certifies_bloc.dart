import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/report.dart';
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

  final ReportService reportService;

  CertifiesBloc({
    required this.getCertifies,
    required this.commitCertify,
    required this.getCities,
    required this.reportService,
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
        certifies: state.certifies,
        isDone: false,
      ));
    });
  }

  /*   BUILD IdentifyInfoCertifyCommitEvent   */
  void _certifyCommitHandler(
      CertifyCommitEvent event, Emitter<CertifiesState> emit) async {
    final resp = await commitCertify(CommitCertifyRequest(
        certifyId: event.certifyId, certifyResult: event.certifyResult));

    List<Info> currentData = [];

    final certifies = state.certifies;

    currentData = certifies[state.cerfityStep.value];

    resp.fold((l) {
      emit(
        CertifyFailure(CustomError(message: l.message),
            cerfityStep: state.cerfityStep, certifies: state.certifies),
      );
    }, (r) {
      if (r.code == AppContant.apiSuccessCode) {
        final updated = currentData.map((e) {
          if (e.certifyId == event.certifyId) {
            return e.copyWith(
                certifyStatus: 1, certifyResult: event.certifyResult);
          }
          return e;
        }).toList();

        certifies[state.cerfityStep.value] = updated;

        emit(
          state.copyWith(certifies: certifies),
        );
      }
    });
  }

  /*  NEST STEP REQUEST  */

  void _stepRequestHander(
      CertifyStepRequest event, Emitter<CertifiesState> emit) {
    // 检查当前是否完成

    final currenStepData = state.getCurrentStepData();

    if (currenStepData.any((e) => !e.isCertify() && e.isMust())) {
      return;
    }

    emit(CertifiesRequestState(
      cerfityStep: state.cerfityStep,
      certifies: state.certifies,
      isDone: state.cerfityStep.isLastStep,
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
    bool isDone = false;
    if (state.cerfityStep.isLastStep) {
      isDone = true;
    }

    // 计算步骤使用时间
    const key = "step_start_time";
    // 第二步个人信息
    // 计算第二部开始时间
    DateTime? startTime;

    if (!state.cerfityStep.isFirstStep) {
      final st = GetStorage().read<String>(key);
      if (st != null) {
        startTime = DateTime.fromMillisecondsSinceEpoch(int.parse(st) * 1000);
      }
      //sceneType = SceneType.personalInfo;
    }

    // 如果当前存在当前开始时间
    // 并且下一步未完成

    if (startTime != null) {
      final stepKey = "step_${state.cerfityStep.value}_finish";
      //final nextStepData = state.certifies[nextStep.value];
      final isFinished = GetStorage().read<bool>(stepKey);
      if (isFinished == null) {
        bus.fire(TargetPointEvent(
          startTime,
          DateTime.now(),
          state.cerfityStep.point,
        ));
        GetStorage().write(stepKey, true);
      }
    }

    GetStorage().write(
        key, (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());

    emit(state.copyWith(
      step: state.cerfityStep.nextStep,
      isDone: isDone,
    ));
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

        List<List<Info>> data = [];
        data.add(l.identityInfo);
        data.add(l.personalInfo);
        data.add(l.emergencyInfo);
        data.add(l.jobInfo);

        for (var item in data) {
          if (item
              .every((element) => element.isCertify() && element.isMust())) {
            currentStep = currentStep.nextStep;

            continue;
          }
          break;
        }

        emit(
          CertifiesSettingsLoadSuccess(
            isDone: false,
            cerfityStep: currentStep,
            certifies: data,
          ),
        );
      },
    );
  }
}
