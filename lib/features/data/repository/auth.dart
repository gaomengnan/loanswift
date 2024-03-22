import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class AuthRepository implements AuthRepo {
  final AuthDataSource _authDataSource;
  const AuthRepository(
    this._authDataSource,
  );

  @override
  ResultVoid sendPhoneCode({required String phone}) async {
    return await _authDataSource.sendPhoneCode(
      phone: phone,
    );
  }

  @override
  String getAuthToken() {
    return _authDataSource.getAuthToken();
  }

  @override
  ResultFuture<AuthTokenModel?> login(
      {required String phone, required String code}) async {
    final resp = await _authDataSource.login(phone: phone, code: code);
    return resp.fold((l) {
      return left(l);
    }, (r) {
      return right(
        r.data,
      );
    });
  }
}
