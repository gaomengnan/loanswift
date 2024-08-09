import 'package:dartz/dartz.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/exceptions.dart';
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
    try {
      await _authDataSource.sendPhoneCode(
        phone: phone,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  String getAuthToken() {
    return _authDataSource.getAuthToken();
  }

  @override
  ResultFuture<AuthTokenModel> login({
    required String phone,
    required String code,
  }) async {
    try {
      final resp = await _authDataSource.login(phone: phone, code: code);

      return resp.fold((l) {
        return left(l);
      }, (r) {
        return right(
          r.data!,
        );
      });
    } on ServerException catch (e) {
      return left(
        ServerFailure.fromException(e),
      );
    }
  }
}
