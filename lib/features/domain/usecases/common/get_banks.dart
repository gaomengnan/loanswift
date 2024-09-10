import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/data/models/bank_card.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class GetBanks extends Usecase {
  final ICommonService commonService;

  GetBanks({required this.commonService});
  @override
  ResultFuture<List<BankCardModel>> call() => commonService.getBanks();
}
