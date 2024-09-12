import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() async {
  setUp(() {});

  final base64String = fixture('base64.txt');

  // 清理 Base64 字符串中的换行符和空格
  String cleanedBase64String = base64String.replaceAll(RegExp(r'\s+'), '');

  var bytes = base64Decode(cleanedBase64String);

  final http = Dio(BaseOptions(baseUrl: "http://8.215.17.71:8089", headers: {
    "Authorization": "tj_F7f2gZr1irgtpomtEMlYdZMSPJuPkT3R32pHRHdA7wsbcf1YkCk2fvhY35xTCb2h-SMd3BUQdpQTwBwkSmB1sREAHWMVDRqWWi8FR22ph3udl2ILvbbbf",
  }));

  final formData = FormData.fromMap({
    'file': MultipartFile.fromBytes(
      bytes,
      filename: "face.jpg",
    ),
    'filename': 'image.jpg',
  });

  await http.post('/middle/upload/index', data: formData,);
}
