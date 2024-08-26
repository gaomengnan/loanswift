/*



    Send Phone Code Unit Test Case

    * Answer AuthRepo
    * Answer Use Mocktail's APIs


*/

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:loanswift/features/domain/usecases/authenticated/send_phone_code.dart';
import 'package:mocktail/mocktail.dart';

import 'repositroy.mock.dart';

//class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late SendPhoneCodeUseCase usecase;
  late AuthRepo repository;
  setUpAll(() {
    repository = MockAuthRepo();
    usecase = SendPhoneCodeUseCase(repository);
  });
  const params = SendPhoneCodeRequest.empty();
  test(
    "should call the [Repo.sendPhoneCode]",
    () async {
      /*    Arrange    */

      when(
        () => repository.sendPhoneCode(
          phone: any(named: "phone"),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      /*    Act   */

      final res = await usecase(params);

      /*    Assert   */

      expect(res, equals(const Right<dynamic, void>(null)));

      verify(() => repository.sendPhoneCode(phone: params.phone)).called(1);

      /* Make sure has no more interactions*/

      verifyNoMoreInteractions(repository);
    },
  );
}
