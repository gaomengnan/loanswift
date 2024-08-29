import 'package:dartz/dartz.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';

abstract class HomeDataSource {
  ResultFuture<ApiResponse<HomeDataModel>> getHomeData();
}

class HomeDataImpl extends HomeDataSource {
  final DioClient _dio;

  HomeDataImpl({required DioClient dio}) : _dio = dio;

  @override
  ResultFuture<ApiResponse<HomeDataModel>> getHomeData() async {
    final resp = await _dio.get(path: "/middle/home/index");
    return resp.fold((l) {
      return left(l);
    }, (r) {
      return right(
        ApiResponse.fromJson(
          r.data,
          (json) => HomeDataModel.fromMap(json),
        ),
      );
    });
  }
}
