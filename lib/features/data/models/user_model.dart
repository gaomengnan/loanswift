import 'package:loanswift/core/core.dart';
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
          id: 0,
          userId: 0,
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

  factory UserModel.fromMap(DataMap json) {
    return UserModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      appForm: json['app_form'],
      idCardFront: json['id_card_front'],
      idCardBack: json['id_card_back'],
      sex: json['sex'] as int,
      education: json['education'] as int,
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

  DataMap toJson() {
    final DataMap data = {};
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

  // toMap method
  DataMap toMap() {
    return {
      'id': id,
      'user_id': userId,
      'app_form': appForm,
      'id_card_front': idCardFront,
      'id_card_back': idCardBack,
      'sex': sex,
      'education': education,
      'home_phone': homePhone,
      'home_city': homeCity,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
