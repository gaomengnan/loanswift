import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/device.dart';
import 'package:loanswift/features/domain/repos/device.dart';

class DeviceRepository implements DeviceRepo {
  final DeviceDataSource _deviceDataSource;
  const DeviceRepository(
    this._deviceDataSource,
  );

  @override
  ResultVoid postDeviceInfo({required Map<String, dynamic> data}) async {
    return await _deviceDataSource.postDeviceInfo(
      data: data,
    );
  }
}
