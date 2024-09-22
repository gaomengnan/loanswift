import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/domain/usecases/common/report_gps.dart';

import '../../../core/core.dart';
import '../../../core/dio_client.dart';

abstract class ReportDataSource {
  const ReportDataSource();

  // 发送验证码
  ResultVoid dataReport({required Map<String, dynamic> data});

  ResultVoid fcmTokenReport({
    required String fcmToken,
    required String deviceId,
  });

  /*  GPS REPORT */

  ResultVoid gpsReport(ReportgpsParams data);
}

class ReportDataSourceImpl extends ReportDataSource {
  //final SharedPreferences _sharedPreferences;
  final DioClient _dioClient;

  const ReportDataSourceImpl({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  @override
  ResultVoid dataReport({required Map<String, dynamic> data}) async {
    final resp = await _dioClient.post(
      path: "/middle/data/report",
      data: data,
      pt: "json",
    );

    return resp;
  }

  @override
  ResultVoid fcmTokenReport(
      {required String fcmToken, required String deviceId}) async {
    final rep = await _dioClient.post(
        path: "/middle/data/token",
        data: {'fcm_token': fcmToken, 'gps_adid': deviceId});
    return rep;
  }

  @override
  ResultVoid gpsReport(ReportgpsParams data) async {
    return await _dioClient.post(path: "/middle/data/gps", data: data.toMap());
  }
}
