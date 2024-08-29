import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';
import 'package:loanswift/features/domain/repos/home.dart';

class HomeDataUseCase extends Usecase {
  final IHomeRepo _repo;

  HomeDataUseCase({required IHomeRepo repo}) : _repo = repo;

  @override
  ResultFuture<HomeDataModel> call() => _repo.getHomeData();
}
