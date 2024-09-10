import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/report.dart';

class Reportgps extends UsecaseParams<void, ReportgpsParams> {
  final ReportRepo reportRepo;

  Reportgps({required this.reportRepo});

  @override
  ResultFuture<void> call(ReportgpsParams params) => reportRepo.gpsReport(params);
  
}

class ReportgpsParams {
  final double latitude;
  final double longitude;
  final String addressDistinct;
  final String clientType;
  final String appVersion;
  final String deviceId;
  final String deviceName;
  final String osVersion;
  final String appName;
  final String packageId;

  ReportgpsParams({
    required this.latitude,
    required this.longitude,
    required this.addressDistinct,
    required this.clientType,
    required this.appVersion,
    required this.deviceId,
    required this.deviceName,
    required this.osVersion,
    required this.appName,
    required this.packageId,
  });

  // 将对象转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address_distinct': addressDistinct,
      'clientType': clientType,
      'appVersion': appVersion,
      'deviceId': deviceId,
      'deviceName': deviceName,
      'osVersion': osVersion,
      'appName': appName,
      'packageId': packageId,
    };
  }
}
