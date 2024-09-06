part of 'certifies_bloc.dart';

enum StepperEnum {
  first,
  second,
  third,
  fourth,
}

extension StepperEnumExt on StepperEnum {
  StepperEnum get previousStep {
    switch (this) {
      case StepperEnum.first:
        return StepperEnum.first;
      case StepperEnum.second:
        return StepperEnum.first;
      case StepperEnum.third:
        return StepperEnum.second;
      case StepperEnum.fourth:
        return StepperEnum.third;
    }
  }

  StepperEnum get nextStep {
    switch (this) {
      case StepperEnum.first:
        return StepperEnum.second;
      case StepperEnum.second:
        return StepperEnum.third;
      case StepperEnum.third:
        return StepperEnum.fourth;
      case StepperEnum.fourth:
        return StepperEnum.first;
    }
  }

  bool get isFirstStep => this == StepperEnum.first;

  int get value {
    switch (this) {
      case StepperEnum.first:
        return 0;
      case StepperEnum.second:
        return 1;
      case StepperEnum.third:
        return 2;
      case StepperEnum.fourth:
        return 3;
    }
  }
}

class CertifiesState {
  final StepperEnum cerfityStep;
  //final CertifiesModel settings;

  final List<Info> identifyInfo;
  final List<Info> emergencyInfo;

  const CertifiesState({
    required this.cerfityStep,
    //required this.settings,
    required this.identifyInfo,
    required this.emergencyInfo,
  });

  CertifiesState.initial()
      : this(
          cerfityStep: StepperEnum.first,
          //settings: CertifiesModel.empty(),
          identifyInfo: List<Info>.empty(),
          emergencyInfo: List<Info>.empty(),
        );

  CertifiesState copyWith({
    StepperEnum? step,
    //CertifiesModel? certifies,
    List<Info>? identify,
    List<Info>? emerge,
  }) =>
      CertifiesState(
        cerfityStep: step ?? cerfityStep,
        //settings: certifies ?? settings,
        identifyInfo: identify ?? identifyInfo,
        emergencyInfo: emerge ?? emergencyInfo,
      );

  //@override
  //List<Object?> get props => [cerfityStep, settings];
}

class CertifiesInitial extends CertifiesState {
  CertifiesInitial.initial() : super.initial();
}

class CertifiesSettingsLoading extends CertifiesState {
  CertifiesSettingsLoading() : super.initial();
}

class CertifiesSettingLoadFailure extends CertifiesState {
  final CustomError error;

  CertifiesSettingLoadFailure({required this.error}) : super.initial();
  //@override
  //List<Object?> get props => [error];
}

class CertifiesSettingsLoadSuccess extends CertifiesState {
  const CertifiesSettingsLoadSuccess({
    //required super.settings,
    required super.cerfityStep,
    required super.identifyInfo,
    required super.emergencyInfo,
  });
}

class CertifiesRequestState extends CertifiesState {
  const CertifiesRequestState({
    required super.cerfityStep,
    //required super.settings,
    required super.identifyInfo,
    required super.emergencyInfo,
  });

  //@override
  //List<Object?> get props => [];
}
