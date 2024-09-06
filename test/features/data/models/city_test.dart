import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:loanswift/features/data/models/city_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  setUp((){});

  final atJson = fixture('city.json');

  final List<dynamic> tMap = jsonDecode(atJson);

  fetchCities(tMap);
  
}
