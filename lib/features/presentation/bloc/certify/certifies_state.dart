part of 'certifies_bloc.dart';

class CertifiesState extends Equatable {
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

  @override
  List<Object?> get props => [cerfityStep];
}

class CertifiesInitial extends CertifiesState {
  CertifiesInitial.initial() : super.initial();
}

class CertifiesSettingLoadFailure extends CertifiesState {
  final CustomError error;

  CertifiesSettingLoadFailure({required this.error}) : super.initial();
  @override
  List<Object?> get props => [error];
}

class CertifiesSettingsLoadSuccess extends CertifiesState {
  const CertifiesSettingsLoadSuccess(
      {required super.settings, required super.cerfityStep});
}
