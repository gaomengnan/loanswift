part of 'certifies_bloc.dart';

@immutable
sealed class CertifiesEvent {}

class CertifiesSettingsLoadEvent extends CertifiesEvent {}

class CertifyStepContinue extends CertifiesEvent {}
class CertifyStepBack extends CertifiesEvent {}
