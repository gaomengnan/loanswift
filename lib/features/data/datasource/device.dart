import 'package:loanswift/core/typedefs.dart';

import '../../../core/core.dart';
import '../../../core/dio_client.dart';

abstract class DeviceDataSource {
  const DeviceDataSource();

  // 发送验证码
  ResultVoid postDeviceInfo({required Map<String, dynamic> data});
}

class DeviceDataSourceImpl extends DeviceDataSource {
  //final SharedPreferences _sharedPreferences;
  final DioClient _dioClient;

  const DeviceDataSourceImpl({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  @override
  ResultVoid postDeviceInfo({required Map<String, dynamic> data}) async {
    final resp = await _dioClient.post(
      path: "/middle/data/report",
      data: data,
      pt: "form",
    );

    return resp;

    //return resp.fold((l) {
    //  return left(l);
    //}, (r) {
    //  return right(
    //    null,
    //  );
    //});
  }
}
