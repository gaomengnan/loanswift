import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/data/models/configure_model.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class GetConfigureUseCase extends Usecase {
  final ICommonService commonService;

  GetConfigureUseCase({required this.commonService});
  @override
  ResultFuture<ConfigureModel> call() => commonService.getConfigure();
}
