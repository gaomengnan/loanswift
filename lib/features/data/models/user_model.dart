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

  const UserModel.empty()
      : this(
          id: 1,
          userId: 1,
          appForm: 'unknown.appForm',
          idCardFront: 'unknown.idCardFront',
          idCardBack: 'unknown.idCardBack',
          sex: -1,
          education: -1,
          homePhone: 'unknown.homePhone',
          homeCity: 'unknown.homeCity',
          createdAt: 'unknown.createdAt',
          updatedAt: 'unknown.updatedAt',
        );

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

  UserModel copyWith({
    int? id,
    int? userId,
    String? appForm,
    String? idCardFront,
    String? idCardBack,
    int? sex,
    int? education,
    String? homePhone,
    String? homeCity,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      appForm: appForm ?? this.appForm,
      idCardFront: idCardFront ?? this.idCardFront,
      idCardBack: idCardBack ?? this.idCardBack,
      sex: sex ?? this.sex,
      education: education ?? this.education,
      homePhone: homePhone ?? this.homePhone,
      homeCity: homeCity ?? this.homeCity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
