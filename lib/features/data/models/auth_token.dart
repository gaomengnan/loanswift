import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/auth_token.dart';

class AuthTokenModel extends AuthToken {
  AuthTokenModel({
    required super.token,
    required super.expire,
  });

  factory AuthTokenModel.fromMap(DataMap map) {
    return AuthTokenModel(
      token: map['token'] as String,
      expire: map['expire'] as int,
    );
  }

  DataMap toJson() {
    return {
      'token': token,
      'expire': expire,
    };
  }
}
