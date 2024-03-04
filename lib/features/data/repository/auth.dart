import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class AuthRepository implements AuthRepo {
  @override
  ResultFuture<void> achievePhoneCode({required String phone}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> login({required String phone, required String code}) {
    throw UnimplementedError();
  }

}
