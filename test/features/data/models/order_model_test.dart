import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/order_model.dart';
import 'package:loanswift/features/domain/entity/orders/order.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  //final tModel = OrderModel.empty();

  final tJson = fixture('order.json');

  final tModel = orderModelFromMap(tJson);


  final tMap = jsonDecode(tJson) as DataMap;

  final tJsonList = fixture('orders.json');
  //
  final tMaps = jsonDecode(tJsonList) as List<dynamic>;
  //
  //final tListMap = tMaps.map((e) => e as DataMap).toList();
  //print(tListMap);

  final tListMap = OrderModel.listFromMap(tMaps);

  test('should return List<OrderModel>', () {
      expect(tListMap[0].orderNo, '24080616373173657117');
  });

  test('should return a subclass of [Order] entity ', () {
    expect(tModel, isA<OrderEntity>());
  });

  group('fromMap', () {
    /*

       should return a USerModel

    */
    test("shoud return a [OrderModel]  with the  right data", () {
      /* Arrange */

      OrderModel.fromMap(tMap);

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
}
