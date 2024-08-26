import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/auth_token.dart';

abstract class AuthRepo {
  const AuthRepo();
  ResultFuture<AuthTokenModel> login({
    required String phone,
    required String code,
  });

  ResultVoid sendPhoneCode({
    required String phone,
  });

  /* 退出 */
  ResultVoid logout();

  String getAuthToken();
}
