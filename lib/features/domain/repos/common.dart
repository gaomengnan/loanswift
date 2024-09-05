import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/upload_model.dart';

abstract class ICommonService {
  ResultFuture<UploadModel> fileUpload({required String path});
  ResultFuture<DataMap> ocr({required String objectKey});
}
