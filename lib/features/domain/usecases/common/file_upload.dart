import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/upload.dart';

class FileUpload extends UsecaseParams<void, FileUploadParams> {
  final IUpload uploadRepo;

  FileUpload({required this.uploadRepo});
  @override
  ResultFuture<void> call(FileUploadParams params) =>
      uploadRepo.fileUpload(path: params.filePath);
}

class FileUploadParams {
  final String filePath;

  FileUploadParams({required this.filePath});
}
