import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/features/data/models/bank_card.dart';
import 'package:loanswift/features/data/models/city_model.dart';
import 'package:loanswift/features/data/models/configure_model.dart';
import 'package:loanswift/features/data/models/upload_model.dart';
import 'package:loanswift/features/domain/entity/common/messages.dart';

import '../../../core/typedefs.dart';

abstract class ICommonDataSource {
  ResultFuture<ApiResponse<UploadModel>> fileUpload({required String filePath});
  ResultFuture<ApiResponse<DataMap>> ocr({required String objectKey});
  ResultFuture<ApiResponse<List<CityModel>>> getCities();
  ResultFuture<ApiResponse<List<BankCardModel>>> getBanks();
  ResultFuture<ApiResponse<ConfigureModel>> getConfigure();
  ResultFuture<ApiResponse<List<MessagesEntity>>> getNotifyMessages();
}

class CommonDataSource extends ICommonDataSource {
  final DioClient http;

  CommonDataSource({required DioClient dio}) : http = dio;

  @override
  ResultFuture<ApiResponse<UploadModel>> fileUpload(
      {required String filePath}) async {
    final fileResouce = await MultipartFile.fromFile(filePath);
    final res = await http.post(
        path: '/middle/upload/index',
        data: {
          'file': fileResouce,
        },
        pt: 'form');

    return res.fold((l) {
      return left(l);
    }, (r) {
      return Right(
        ApiResponse.fromJson(
          r.data,
          (om) => UploadModel.fromMap(om),
        ),
      );
    });
  }

  @override
  ResultFuture<ApiResponse<DataMap>> ocr({required String objectKey}) async {
    final resp = await http.post(path: '/middle/api/ocr', data: {
      'img_front': objectKey,
    });

    return resp.fold((l) => left(l), (r) {
      return right(
        ApiResponse.fromJson(
          r.data,
          (om) => DataMapExtensions.fromMap(om),
        ),
      );
    });
  }

  @override
  ResultFuture<ApiResponse<List<CityModel>>> getCities() async {
    final resp = await http.get(path: '/middle/identity/get-city');

    return resp.fold((l) => left(l), (r) {
      return right(
        ApiResponse.fromJson(
          r.data,
          (om) => fetchCities(om),
        ),
      );
    });
  }

  @override
  ResultFuture<ApiResponse<List<BankCardModel>>> getBanks() async {
    final resp = await http.get(path: "/middle/identity/bank-list");

    return resp.fold((l) => left(l), (r) {
      return right(
        ApiResponse.fromJson(
          r.data,
          (om) => bankCardsDataFromList(om),
        ),
      );
    });
  }

  @override
  ResultFuture<ApiResponse<ConfigureModel>> getConfigure() async {
    final resp = await http.get(path: "/app/configure");

    return resp.fold((l) => left(l), (r) {
      return right(
        ApiResponse.fromJson(
          r.data,
          (om) => ConfigureModel.fromMap(om),
        ),
      );
    });
  }

  @override
  ResultFuture<ApiResponse<List<MessagesEntity>>> getNotifyMessages() async {
    final resp = await http.get(path: "/middle/market/apply-logs");
    return resp.fold((l) => left(l), (r) {
      return right(
        ApiResponse.fromJson(
          r.data,
          (om) => messagesDataFromList(om),
        ),
      );
    });
  }
}
