import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class GetCities extends Usecase {
  final ICommonService commonService;

  GetCities({required this.commonService});
  @override
  ResultFuture call() => commonService.getCities();
}
