import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/report.dart';
import 'package:loanswift/features/domain/repos/report.dart';
import 'package:loanswift/features/domain/usecases/common/report_gps.dart';

class ReportRepository implements ReportRepo {
  final ReportDataSource _deviceDataSource;
  const ReportRepository(
    this._deviceDataSource,
  );

  @override
  ResultVoid postDeviceInfo({required Map<String, dynamic> data}) async {
    return await _deviceDataSource.postDeviceInfo(
      data: data,
    );
  }

  @override
  ResultFuture<void> fcm(
      {required String fcm, required String deviceId}) async {
    return await _deviceDataSource.fcmTokenReport(
        fcmToken: fcm, deviceId: deviceId);
  }

  @override
  ResultVoid gpsReport(ReportgpsParams data) async {
    return await _deviceDataSource.gpsReport(data);
  }
}