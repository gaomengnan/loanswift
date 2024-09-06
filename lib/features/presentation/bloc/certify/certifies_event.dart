part of 'certifies_bloc.dart';

@immutable
sealed class CertifiesEvent {}

class CertifiesSettingsLoadEvent extends CertifiesEvent {}

class CertifyStepContinue extends CertifiesEvent {}

class CertifyStepBack extends CertifiesEvent {}

class CertifyStepRequest extends CertifiesEvent {}

class IdentifyInfoCertifyCommitEvent extends CertifiesEvent {
  final int certifyId;
  final dynamic certifyResult;

  IdentifyInfoCertifyCommitEvent({required this.certifyId, required this.certifyResult});
}
