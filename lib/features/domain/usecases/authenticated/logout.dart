import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class LogoutUseCase extends Usecase {
  final AuthRepo _authRepo;

  LogoutUseCase(this._authRepo);

  @override
  ResultFuture call() => _authRepo.logout();
}
