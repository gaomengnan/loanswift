import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/upload.dart';
import 'package:loanswift/features/data/models/upload_model.dart';
import 'package:loanswift/features/domain/repos/upload.dart';

class UploadRepositry implements IUpload {
  final IUploadDataSource uploadDataSource;

  UploadRepositry({required this.uploadDataSource});
  @override
  ResultFuture<UploadModel> fileUpload({required String path}) async {
    final resp = await uploadDataSource.fileUpload(filePath: path);

    return resp.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }
}
