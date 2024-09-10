import 'package:dartz/dartz.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';
import 'package:loanswift/features/data/models/user_model.dart';

import '../../../core/core.dart';
import '../../../core/dio_client.dart';

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

  // 退出登陆

  ResultVoid logout();

  // 获取认证项
  ResultFuture<ApiResponse<CertifiesModel>> getCertificates();

  // 提交认证项

  ResultFuture<ApiResponse> commitCertify({required DataMap data});

  ResultVoid bindBank({required DataMap data});
}

class AuthDataSourceImpl extends AuthDataSource {
  //final SharedPreferences _sharedPreferences;
  final DioClient http;

  const AuthDataSourceImpl({
    required this.http,
  });

  @override
  String getAuthToken() {
    //final token = GetStorage().read<AuthToken>(
    //  AppContant.tokenKey,
    //);
    return "";
  }

  @override
  ResultVoid sendPhoneCode({required String phone}) async {
    final resp = await http.post(
      path: "/middle/user/code",
      data: {
        'phone': phone,
      },
      pt: "form",
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
    final response = await http.post(
      path: "/middle/user/login",
      data: postData,
    );

    return response.fold((l) {
      return left(l);
    }, (r) {
      return right(ApiResponse.fromJson(
        r.data,
        (json) => AuthTokenModel.fromMap(json),
      ));
    });
  }

  @override
  ResultFuture<ApiResponse<UserModel>> getUserInfo() async {
    final resp = await http.get(
      path: "/middle/identity/personal",
    );
    return resp.fold((l) {
      return left(l);
    }, (r) {
      return right(ApiResponse.fromJson(
        r.data,
        (json) => UserModel.fromMap(json),
      ));
    });
  }

  @override
  ResultVoid logout() async {
    final resp = await http.get(path: '/middle/user/login-out');
    return resp;
  }

  @override
  ResultFuture<ApiResponse<CertifiesModel>> getCertificates() async {
    final resp = await http.get(path: '/middle/certify/list');

    return resp.fold((l) => left(l), (l) {
      return Right(
        ApiResponse.fromJson(
          l.data,
          (json) {
            Map<String, dynamic> mergedMap = {};
            for (var map in json) {
              if (map.isNotEmpty) {
                var firstEntry = map.entries.first;
                mergedMap[firstEntry.key] = firstEntry.value;
              }
            }
            return CertifiesModel.fromMap(mergedMap);
          },
        ),
      );
    });
  }

  @override
  ResultFuture<ApiResponse> commitCertify({required DataMap data}) async {
    final resp = await http.post(path: '/middle/certify/add', data: data);

    return resp.fold((l) => left(l), (r) {
      return right(
          ApiResponse.fromJson(r.data, (j) => DataMapExtensions.fromMap(j)));
    });
  }

  @override
  ResultVoid bindBank({required DataMap data}) async {
    final resp =
        await http.post(path: "/middle/identity/bind-bank", data: data);
    return resp;
  }
}
