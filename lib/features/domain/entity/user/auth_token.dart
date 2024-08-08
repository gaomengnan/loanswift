import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final String token;
  final int expire;

  const AuthToken.empty()
      : this(
          token: 'unknown.token',
          expire: 0,
        );
  const AuthToken({
    required this.token,
    required this.expire,
  });

  @override
  List<Object?> get props => [
        token,
        expire,
      ];
}
