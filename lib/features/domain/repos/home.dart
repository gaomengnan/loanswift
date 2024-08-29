import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';

abstract class IHomeRepo {
  ResultFuture<HomeDataModel> getHomeData();
}
