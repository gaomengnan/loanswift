import 'package:loanswift/core/core.dart';

abstract class AuthRepo {
  const AuthRepo();
  ResultFuture<void> login({
    required String phone,
    required String code,
  });

  ResultFuture<void> achievePhoneCode({
    required String phone,
  });
}
