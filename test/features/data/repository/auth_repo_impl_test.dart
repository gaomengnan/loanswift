import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/exceptions.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepoImpl extends Mock implements AuthDataSource {}

void main() {
  /*   Auth remote data source   */
  late AuthDataSource remoteDataSource;

/*   auth repo impl   */
  late AuthRepository repo;

  setUp(() {
    remoteDataSource = MockAuthRepoImpl();
    repo = AuthRepository(remoteDataSource);
  });

  const tExecption = ServerException(
    message: 'Unknown error',
    statusCode: 500,
  );

  /*      Unit case  * sendPhonCode      */

  group("sendPhoneCode", () {
    /*  
        should call the [RemoteDataSource.sendPhoneCode]
      
    */

    test( 'should call the [RemoteDataSource.sendPhoneCode] '
        'and completre successfully  when the call ato the remote source is successful',
        () async {
      /* arrange */

      when(
        () => remoteDataSource.sendPhoneCode(
          phone: any(named: 'phone'),
        ),
      ).thenAnswer((_) async => const Right(
            null,
          ));

      const phone = 'unknown.phone';

      /*   act */

      final res = await repo.sendPhoneCode(phone: phone);

      /*  assert */

      expect(
        res,
        equals(
          const Right(null),
        ),
      );

      verify(
        () => remoteDataSource.sendPhoneCode(
          phone: phone,
        ),
      ).called(1);

      verifyNoMoreInteractions(
        remoteDataSource,
      );
    });

    /*  end */

    test(
        'should return a [ServerFailure] when the call to the remote source is unsuccessful',
        () async {
      /* arrange */

      when(
        () => remoteDataSource.sendPhoneCode(
          phone: any(named: 'phone'),
        ),
      ).thenThrow(tExecption);

      const phone = 'unknown.phone';

      /*   act */

      final res = await repo.sendPhoneCode(phone: phone);

      /*  assert */

      expect(
        res,
        equals(
          Left(
            ServerFailure(
              statusCode: tExecption.statusCode,
              message: tExecption.message,
            ),
          ),
        ),
      );

      verify(
        () => remoteDataSource.sendPhoneCode(
          phone: phone,
        ),
      ).called(1);

      verifyNoMoreInteractions(
        remoteDataSource,
      );
    });
  });


  /*      Unit case  * verifyCode      */

}
