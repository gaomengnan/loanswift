import 'package:dartz/dartz.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/services/dio_client.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:loanswift/features/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';

abstract class AuthDataSource {
  const AuthDataSource();
  // 获取  token
  String getAuthToken();

  // 发送验证码
  ResultVoid sendPhoneCode({required String phone});

  // 登录接口
  ResultFuture<ApiResponse<AuthTokenModel>> login({
    required String phone,
    required String code,
  });

  // 获取用户个人信息
  ResultFuture<ApiResponse<UserModel>> getUserInfo();
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
  ResultVoid sendPhoneCode({required String phone}) async {
    final resp = await _dioClient.post(
      path: "/middle/user/code",
    );
    return resp.fold(
      (l) => left(l),
      (r) => right(null),
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
      path: "/middle/user/login",
      data: postData,
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

  @override
  ResultFuture<ApiResponse<UserModel>> getUserInfo() async {
    final resp = await _dioClient.get(
      path: "/middle/identity/personal",
    );
    return resp.fold((l) {
      return left(l);
    }, (r) {
      return right(ApiResponse.fromJson(
        r.data,
        (json) => UserModel.fromJson(json),
      ));
    });
  }
}
