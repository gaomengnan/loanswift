
import 'package:loanswift/features/domain/usecases/common/report_gps.dart';

import '../../../core/core.dart';

abstract class ReportRepo {
  ResultFuture<void> dataReport({
    required Map<String, dynamic> data,
  });

  ResultFuture<void> fcm({
    required String fcm,
    required String deviceId,
  });

  ResultVoid gpsReport(ReportgpsParams data);

  ResultVoid targetReport(DataMap data);
}
