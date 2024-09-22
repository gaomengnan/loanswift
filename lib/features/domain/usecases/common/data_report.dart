import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/report.dart';

class DataReport extends UsecaseParams<void, DataMap> {
  final ReportRepo reportRepo;

  DataReport({required this.reportRepo});
  @override
  ResultFuture<void> call(DataMap params) =>
      reportRepo.dataReport(data: params);
}
