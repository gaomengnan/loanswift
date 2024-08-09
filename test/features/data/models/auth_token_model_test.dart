/*

   AuthTokenModel Unit Test File

*/

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/auth_token.dart';
import 'package:loanswift/features/domain/entity/user/auth_token.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  const tModel = AuthTokenModel.empty();

  test("should a subclass of [AuthToken] entity", () {
    /*  Arrange  */
    /*   Act  */
    expect(tModel, isA<AuthToken>());
  });

  final tJson = fixture('auth_token.json');

  final tMap = jsonDecode(tJson) as DataMap;

  group("fromMap", () {
    /*

       should return a AuthTokenModel

    */

    test("shoud return a [AuthTokenModel]  with the  right data", () {
      /* Arrange */

      final res = AuthTokenModel.fromMap(tMap);

      /* Act */

      expect(res, equals(tModel));

      /* Assert */
    });
  });

  group("toMap", () {
    /*

       should return a Map

    */

    test('should return a [Map] with right data', () {
      final res = tModel.toMap();

      /* Act */

      expect(res, equals(tMap));
    });
  });

  group("toJSON", () {
    test("should return a [JSON] with right data", () {
      /* Arrange */
      final res = tModel.toJson();

      /* Assert */
      expect(res, res);
    });
  });

  group("copyWith", () {
    /*

       should return a new UserModel with updated data

    */

    test("should return a new [AuthTokenModel] with updated data", () {
      /* Arrange */
      final res = tModel.copyWith(
        token: "new.token",
        expire: 100,
      );

      /* Act */

      expect(res.token, equals('new.token'));
      expect(res.expire, equals(100));

      /* Assert */
    });
  });
}
