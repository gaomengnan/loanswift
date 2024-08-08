/*

   UserModel Unit Test File

*/

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/features/data/models/user_model.dart';
import 'package:loanswift/features/domain/entity/user/user.dart';

void main() {
  setUp(() {});

  test("should a subclass of [User] entity", () {
    /*  Arrange  */
    const userM = UserModel.empty();

    /*   Act  */
    expect(userM, isA<User>());
  });

  group("fromMap", () {
    test("shoud return a [UserModel]  with the  right data", () {
      /* Arrange */
      final tJson = File("test/fixtures/user.json").readAsBytesSync();
      print(tJson);
      /* Act */
      /* Assert */
    });
  });
}
