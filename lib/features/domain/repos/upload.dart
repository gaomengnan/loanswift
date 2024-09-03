import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/upload_model.dart';

abstract class IUpload {
  ResultFuture<UploadModel> fileUpload({required String path});
}
