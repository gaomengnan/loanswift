import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/failure.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class AuthRepository implements AuthRepo {
  final AuthDataSource _authDataSource;
  final InternetConnectionChecker _connectionChecker;
  const AuthRepository(
    this._authDataSource,
    this._connectionChecker,
  );

  @override
  ResultVoid achievePhoneCode({required String phone}) async {
    final InternetConnectionStatus connected = await _connectionChecker.connectionStatus;
    if (connected == InternetConnectionStatus.connected) {
      try {
        await _authDataSource.achievePhoneCode(
          phone: phone,
        );
        return right(null);
      } on DioException catch (e) {
        return left(
          ServerFailure(
            message: e.message ?? "",
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      }
    } else {
      return left(
        const ConnectionFailure(),
      );
    }
  }

  @override
  String getAuthToken() {
    return _authDataSource.getAuthToken();
  }

  @override
  ResultFuture<void> login({required String phone, required String code}) {
    throw UnimplementedError();
  }
}
