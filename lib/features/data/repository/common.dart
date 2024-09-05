import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/common.dart';
import 'package:loanswift/features/data/models/upload_model.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class CommonRepositry implements ICommonService {
  final ICommonDataSource uploadDataSource;

  CommonRepositry({required this.uploadDataSource});
  @override
  ResultFuture<UploadModel> fileUpload({required String path}) async {
    final resp = await uploadDataSource.fileUpload(filePath: path);

    return resp.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }

  @override
  ResultFuture<DataMap> ocr({required String objectKey}) async {
    final rep = await uploadDataSource.ocr(objectKey: objectKey);
    return rep.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }
}
