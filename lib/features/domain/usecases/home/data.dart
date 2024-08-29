import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';
import 'package:loanswift/features/domain/repos/home.dart';

class GetHomeDataUseCase extends Usecase {
  final IHomeRepo _repo;

  GetHomeDataUseCase({required IHomeRepo repo}) : _repo = repo;

  @override
  ResultFuture<HomeDataModel> call() => _repo.getHomeData();
}
