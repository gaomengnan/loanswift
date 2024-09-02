part of 'certifies_bloc.dart';

@immutable
sealed class CertifiesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CertifiesInitial extends CertifiesState {}

class CertifiesFailure extends CertifiesState {
  final CustomError error;

  CertifiesFailure({required this.error});
  @override
  List<Object?> get props => [error];
}

class CertifiesSuccess extends CertifiesState {
  final CertifiesModel data;

  CertifiesSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}
