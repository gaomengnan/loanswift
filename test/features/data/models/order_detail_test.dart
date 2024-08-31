import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/order_detail_model.dart';
import 'package:loanswift/features/domain/entity/orders/order_detail.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  final tModel = OrderDetailModel.empty();

  final tJson = fixture('order_detail.json');

  final tMap = jsonDecode(tJson) as DataMap;

  test("should a subclass of [OrderDetail] entity", () {
    /*  Arrange  */
    /*   Act  */
    expect(tModel, isA<OrderDetail>());
  });

  group('fromMap', () {
    test('should return right data', () {
      OrderDetailModel.fromMap(tMap);
    });
  });
}
