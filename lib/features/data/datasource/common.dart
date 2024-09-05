import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/features/data/models/upload_model.dart';

import '../../../core/typedefs.dart';

abstract class ICommonDataSource {
  ResultFuture<ApiResponse<UploadModel>> fileUpload({required String filePath});
  ResultFuture<ApiResponse<DataMap>> ocr({required String objectKey});
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
}
