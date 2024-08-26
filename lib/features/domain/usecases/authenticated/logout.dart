import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class LogoutUsecase extends Usecase {
  final AuthRepo _authRepo;

  LogoutUsecase(this._authRepo);

  @override
  ResultFuture call() => _authRepo.logout();
}
