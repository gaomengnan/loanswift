import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/report.dart';

class ReportFcm extends UsecaseParams<void, ReportFcmParams> {
  final ReportRepo reportRepo;

  ReportFcm({required this.reportRepo});

  @override
  ResultFuture<void> call(ReportFcmParams params) =>
      reportRepo.fcm(fcm: params.token, deviceId: params.deviceId);
}

class ReportFcmParams {
  final String token;
  final String deviceId;

  ReportFcmParams({required this.token, required this.deviceId});
}
