import 'package:dartz/dartz.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/services/dio_client.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';

abstract class AuthDataSource {
  const AuthDataSource();
  String getAuthToken();
  Future<void> achievePhoneCode({required String phone});
  ResultFuture<ApiResponse<AuthTokenModel>> login({
    required String phone,
    required String code,
  });
}

class AuthDataSourceImpl extends AuthDataSource {
  final SharedPreferences _sharedPreferences;
  final DioClient _dioClient;

  const AuthDataSourceImpl({
    required SharedPreferences sharedPreferences,
    required DioClient dioClient,
  })  : _sharedPreferences = sharedPreferences,
        _dioClient = dioClient;

  @override
  String getAuthToken() {
    final token = _sharedPreferences.getString(
      AppContant.token,
    );
    return token ?? "";
  }

  @override
  Future<void> achievePhoneCode({required String phone}) async {
    await _dioClient.dio.post(
      "/middle/user/code",
    );
  }

  @override
  ResultFuture<ApiResponse<AuthTokenModel>> login(
      {required String phone, required String code}) async {
    Map<String, dynamic> postData = {
      'phone': phone,
      'code': code,
    };
    final response = await _dioClient.post(
      "/middle/user/login",
      postData,
    );

    return response.fold((l) {
      return left(l);
    }, (r) {
      return right(ApiResponse.fromJson(
        r.data,
        (json) => AuthTokenModel.fromJson(json),
      ));
    });
  }
}
