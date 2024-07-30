import '../../../core/core.dart';

abstract class DeviceRepo {
  ResultFuture<void> postDeviceInfo({
    required Map<String, dynamic> data,
  });
}
