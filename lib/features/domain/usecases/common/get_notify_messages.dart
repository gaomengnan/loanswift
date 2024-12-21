import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/common/messages.dart';
import 'package:loanswift/features/domain/repos/common.dart';

import '../../../../core/usecase.dart';

class GetNotifyMessages extends Usecase {
  final ICommonService commonService;

  GetNotifyMessages({required this.commonService});
  @override
  ResultFuture<List<MessagesEntity>> call() =>
      commonService.getNotifyMessages();
}
