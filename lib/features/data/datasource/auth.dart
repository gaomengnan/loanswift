import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/services/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  const AuthDataSource();
  String getAuthToken();
  Future<void> achievePhoneCode({required String phone});
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
}
