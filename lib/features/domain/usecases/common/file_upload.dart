import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class FileUpload extends UsecaseParams<void, FileUploadParams> {
  final ICommonService commonSer;

  FileUpload({required this.commonSer});
  @override
  ResultFuture<void> call(FileUploadParams params) =>
      commonSer.fileUpload(path: params.filePath);
}

class FileUploadParams {
  final String filePath;

  FileUploadParams({required this.filePath});
}
