/*

   Login Unit Test


*/
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:loanswift/features/domain/entity/user/auth_token.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:loanswift/features/domain/usecases/authenticated/login.dart';
import 'package:mocktail/mocktail.dart';

import 'repositroy.mock.dart';

void main() {
  late AuthRepo repositroy;

  late LoginUseCase usecase;

  setUp(() {
    repositroy = MockAuthRepo();
    usecase = LoginUseCase(repositroy);
  });

  const param = LoginRequest.empty();

  const response = AuthTokenModel.empty();

  test("should call the [Repo.login] and return authToken", () async {
    /*    Arrange */
    when(() => repositroy.login(
          phone: param.phone,
          code: param.code,
        )).thenAnswer(
      (_) async => const Right(
        response,
      ),
    );

    /*  Act  */

    final res = await usecase(param);

    expect(
      res,
      equals(const Right<dynamic, AuthToken>(response)),
    );

    /*  Assert  */

    verify(
      () => repositroy.login(phone: param.phone, code: param.code),
    ).called(1);

    verifyNoMoreInteractions(repositroy);
  });
}
