import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class AuthRepository implements AuthRepo {
  final AuthDataSource _authDataSource;
  const AuthRepository(this._authDataSource);

  @override
  ResultFuture<void> achievePhoneCode({required String phone}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> login({required String phone, required String code}) {
    throw UnimplementedError();
  }

  @override
  String getAuthToken() {
    return _authDataSource.getAuthToken();
  }
}
