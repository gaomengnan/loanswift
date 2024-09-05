import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';

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

  // 获取认证字段

  ResultFuture<CertifiesModel> getCertifies();

  // 提交认证

  ResultFuture<ApiResponse> commitCertify({required DataMap data});
}
