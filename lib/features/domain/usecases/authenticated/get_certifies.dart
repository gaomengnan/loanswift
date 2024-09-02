import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class GetCertifies extends Usecase {
  final AuthRepo authRepo;

  GetCertifies({required this.authRepo});

  @override
  ResultFuture<CertifiesModel> call() => authRepo.getCertifies();
}
