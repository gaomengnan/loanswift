/*

   UserModel Unit Test File

*/

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/user_model.dart';
import 'package:loanswift/features/domain/entity/user/user.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  const tModel = UserModel.empty();

  test("should a subclass of [User] entity", () {
    /*  Arrange  */
    /*   Act  */
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');

  final tMap = jsonDecode(tJson) as DataMap;

  group("fromMap", () {
    /*

       should return a USerModel

    */

    test("shoud return a [UserModel]  with the  right data", () {
      /* Arrange */

      final res = UserModel.fromMap(tMap);

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

    test("should return a new [UserModel] with updated data", () {
      /* Arrange */
      final res = tModel.copyWith(
        id: 1,
        userId: 1,
        appForm: 'john.doe@example.com',
      );

      /* Act */

      expect(res.id, equals(1));
      expect(res.userId, equals(1));
      expect(res.appForm, equals("john.doe@example.com"));

      /* Assert */
    });
  });
}
