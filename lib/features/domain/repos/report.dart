import '../../../core/core.dart';

abstract class ReportRepo {
  ResultFuture<void> postDeviceInfo({
    required Map<String, dynamic> data,
  });
}
