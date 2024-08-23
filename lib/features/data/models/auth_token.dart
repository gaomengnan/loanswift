import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/auth_token.dart';

class AuthTokenModel extends AuthToken {
  const AuthTokenModel({
    required super.token,
    required super.expire,
  });

  const AuthTokenModel.empty()
      : this(
          token: 'unknown',
          expire: 0,
        );

  factory AuthTokenModel.fromMap(DataMap? map) {
    if (map == null) {
      return const AuthTokenModel.empty();
    }
    return AuthTokenModel(
      token: map['token'] as String,
      expire: map['expire'] as int,
    );
  }

  AuthTokenModel copyWith({String? token, int? expire}) {
    return AuthTokenModel(
      token: token ?? this.token,
      expire: expire ?? this.expire,
    );
  }

  DataMap toJson() {
    return {
      'token': token,
      'expire': expire,
    };
  }

  // toMap method
  DataMap toMap() {
    return {
      'token': token,
      'expire': expire,
    };
  }
}
