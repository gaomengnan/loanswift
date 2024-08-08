import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/auth_token.dart';

abstract class AuthRepo {
  const AuthRepo();
  ResultFuture<AuthToken> login({
    required String phone,
    required String code,
  });

  ResultVoid sendPhoneCode({
    required String phone,
  });

  String getAuthToken();
}
