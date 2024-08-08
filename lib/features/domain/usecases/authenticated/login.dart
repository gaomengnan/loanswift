import 'package:equatable/equatable.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/entity/user/auth_token.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class Login extends UsecaseParams<AuthToken, LoginRequest> {
  final AuthRepo repositroy;
  const Login(this.repositroy);
  @override
  ResultFuture<AuthToken> call(params) => repositroy.login(
        phone: params.phone,
        code: params.code,
      );
}

class LoginRequest extends Equatable {
  final String phone;
  final String code;

  const LoginRequest.empty()
      : this(
          phone: "unknown.phone",
          code: "unknown.code",
        );

  const LoginRequest({
    required this.phone,
    required this.code,
  });

  @override
  List<Object?> get props => [phone, code];
}
