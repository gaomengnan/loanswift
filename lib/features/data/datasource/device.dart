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
    return ResultVoid.value(null);
  }
}
