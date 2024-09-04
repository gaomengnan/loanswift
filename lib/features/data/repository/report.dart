import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/report.dart';
import 'package:loanswift/features/domain/repos/report.dart';

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
}
