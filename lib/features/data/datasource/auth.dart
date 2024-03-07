import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/services/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  final SharedPreferences sharedPreferences;

  final DioClient dioClient;

  const AuthDataSource({
    required this.sharedPreferences,
    required this.dioClient,
  });


  String getAuthToken() {
    final token = sharedPreferences.getString(AppContant.token,);
    return token ?? "";
  }

}
