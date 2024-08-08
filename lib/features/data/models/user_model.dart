import 'package:loanswift/features/domain/entity/entity.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userId,
    required super.appForm,
    required super.idCardFront,
    required super.idCardBack,
    required super.sex,
    required super.education,
    required super.homePhone,
    required super.homeCity,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      appForm: json['app_form'],
      idCardFront: json['id_card_front'],
      idCardBack: json['id_card_back'],
      sex: (json['sex'] as num).toInt(),
      education: (json['education'] as num).toInt(),
      homePhone: json['home_phone'],
      homeCity: json['home_city'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
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
