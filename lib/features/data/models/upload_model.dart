import 'package:loanswift/features/domain/entity/common/upload.dart';

class UploadModel extends UploadEntity {
  UploadModel({required super.object});

  factory UploadModel.fromMap(Map<String, dynamic> json) {
    return UploadModel(object: json['object'] ?? '');
  }
}
