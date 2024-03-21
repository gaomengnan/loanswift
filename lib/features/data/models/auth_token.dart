import 'package:loanswift/features/domain/entity/user/auth_token.dart';

class AuthTokenModel extends AuthToken {
  AuthTokenModel({
    required super.token,
    required super.expire,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      token: json['token'],
      expire: json['expire'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expire': expire,
    };
  }
}
