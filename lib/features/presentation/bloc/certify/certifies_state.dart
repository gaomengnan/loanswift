part of 'certifies_bloc.dart';

class CertifiesState {
  final int cerfityStep;
  final CertifiesModel settings;

  const CertifiesState({
    required this.cerfityStep,
    required this.settings,
  });

  CertifiesState.initial()
      : this(
          cerfityStep: 0,
          settings: CertifiesModel.empty(),
        );

  CertifiesState copyWith({int? step, CertifiesModel? certifies}) =>
      CertifiesState(
        cerfityStep: step ?? cerfityStep,
        settings: certifies ?? settings,
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
  const CertifiesSettingsLoadSuccess(
      {required super.settings, required super.cerfityStep});
}

class CertifiesRequestState extends CertifiesState {
  const CertifiesRequestState(
      {required super.cerfityStep, required super.settings});

  //@override
  //List<Object?> get props => [];
}
