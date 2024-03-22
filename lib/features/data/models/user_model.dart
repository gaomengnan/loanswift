import 'package:loanswift/features/domain/entity/entity.dart';

class UserModel extends User {
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    appForm = json['app_form'];
    idCardFront = json['id_card_front'];
    idCardBack = json['id_card_back'];
    // faceRecognition = json['face_recognition'];
    sex = json['sex'];
    education = json['education'];
    homePhone = json['home_phone'];
    homeCity = json['home_city'];
    // livenessId = json['liveness_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['app_form'] = appForm;
    data['id_card_front'] = idCardFront;
    data['id_card_back'] = idCardBack;
    data['sex'] = sex;
    data['education'] = education;
    data['home_phone'] = homePhone;
    data['home_city'] = homeCity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
