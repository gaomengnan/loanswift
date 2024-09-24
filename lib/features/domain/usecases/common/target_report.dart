import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/report.dart';

class TargetReport extends UsecaseParams<void, DataMap> {
  final ReportRepo repo;

  TargetReport({required this.repo});
  @override
  ResultFuture<void> call(DataMap params) => repo.targetReport(params);
}
