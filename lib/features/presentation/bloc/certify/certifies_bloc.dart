import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/usecases/authenticated/get_certifies.dart';

part 'certifies_event.dart';
part 'certifies_state.dart';

class CertifiesBloc extends Bloc<CertifiesEvent, CertifiesState> {
  final GetCertifies getCertifies;
  CertifiesBloc({
    required this.getCertifies,
  }) : super(CertifiesInitial()) {
    on<CertifiesLoadEvent>(_certifiesLoadHandler);
  }

  void _certifiesLoadHandler(
      CertifiesEvent event, Emitter<CertifiesState> emit) async {
    final resp = await getCertifies();

    resp.fold(
      (l) => emit(
        CertifiesFailure(
          error: CustomError(message: l.message),
        ),
      ),
      (l) => emit(
        CertifiesSuccess(data: l),
      ),
    );
  }
}