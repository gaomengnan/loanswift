part of 'certifies_bloc.dart';

@immutable
sealed class CertifiesEvent {}

class CertifiesSettingsLoadEvent extends CertifiesEvent {}

class CertifyStepContinue extends CertifiesEvent {
  final String? productId;

  CertifyStepContinue({this.productId});
}

class CertifyStepBack extends CertifiesEvent {}

class CertifyStepRequest extends CertifiesEvent {}

class CertifyLastStepRequest extends CertifiesEvent {}

class CertifyCommitEvent extends CertifiesEvent {
  final int certifyId;
  final dynamic certifyResult;

  CertifyCommitEvent({required this.certifyId, required this.certifyResult});
}

class LoadCitiesEvent extends CertifiesEvent {}
