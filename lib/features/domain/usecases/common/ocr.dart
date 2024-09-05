import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class Ocr extends UsecaseParams<void, OcrParams> {
  final ICommonService commonService;
  Ocr({required this.commonService});
  @override
  ResultFuture<DataMap> call(params) =>
      commonService.ocr(objectKey: params.objectKey);
}

class OcrParams {
  final String objectKey;

  OcrParams({required this.objectKey});
}
