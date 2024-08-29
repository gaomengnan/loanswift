import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/home.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';
import 'package:loanswift/features/domain/repos/home.dart';

class HomeRepository extends IHomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepository({required HomeDataSource homeDataSource})
      : _homeDataSource = homeDataSource;

  @override
  ResultFuture<HomeDataModel> getHomeData() async {
    final response = await _homeDataSource.getHomeData();

    return response.fold(
      (l) => left(l),
      (r) => right(
        r.data!,
      ),
    );
  }
}
