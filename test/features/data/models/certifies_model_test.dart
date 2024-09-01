import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/features/data/models/certifies_model.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  final atJson = fixture('certifies.json');

  final List<dynamic> tMap = jsonDecode(atJson);

// 合并每个 Map 的第一个键值对到一个新的 Map
  Map<String, dynamic> mergedMap = {};

  for (var map   in tMap) {
    if (map.isNotEmpty) {
      // 获取每个 Map 的第一个键值对
      var firstEntry = map.entries.first;
      mergedMap[firstEntry.key] = firstEntry.value;
    }
  }


  final toMap = CertifiesModel.fromMap(mergedMap);

  test('should a subclass of [certifies] Entity', () {
    expect(toMap, isA<Certifies>());
  });

}
