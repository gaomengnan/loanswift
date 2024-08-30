import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';
import 'package:loanswift/features/domain/entity/home/banner.dart';
import 'package:loanswift/features/domain/entity/home/home.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  /* READ JSON FILE */

  final tJson = fixture('home_data.json');

  final tMap = jsonDecode(tJson) as DataMap;

  final tModel = homeDataFromMap(tJson);

  test("should a subclass of [HomeData] entity", () {
    /*  Arrange  */
    /*   Act  */
    expect(tModel, isA<HomeData>());
  });

  //print(tMap);

  group("fromMap", () {
    /*  SHOULD RETURN HOMEDATAMODEL */

    test("shoud return a [HomeDataModel]  with the  right data", () {
      /* Arrange */

      HomeDataModel.fromMap(tMap);

      /* Act */

      expect(tModel, equals(tModel));

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

  group("copyWith", () {
    /*

       should return a new HomeDataModel with updated data

    */

    test("should return a new [HomeDataModel] with updated data", () {
      final banners = [BannerEntity.empty()];
      /* Arrange */
      final res = tModel.copyWith(
        banners: banners,
      );

      /* Act */

      expect(res.banners, equals(banners));

      /* Assert */
    });
  });
}
