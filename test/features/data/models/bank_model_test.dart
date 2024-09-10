import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/features/data/models/bank_card.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp(() {});

  final atJson = fixture('bank.json');

  final List<dynamic> tMap = jsonDecode(atJson);

  final resp = bankCardsDataFromList(tMap);

  debugPrint(resp.toString());
}
