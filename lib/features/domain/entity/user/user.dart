import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final int userId;
  final String appForm;
  final String idCardFront;
  final String idCardBack;
  final int sex;
  final int education;
  final String homePhone;
  final String homeCity;
  final String createdAt;
  final String updatedAt;

  const User.empty()
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

  const User({
    required this.id,
    required this.userId,
    required this.appForm,
    required this.idCardFront,
    required this.idCardBack,
    required this.sex,
    required this.education,
    required this.homePhone,
    required this.homeCity,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        appForm,
        idCardFront,
        idCardBack,
        sex,
        education,
        homePhone,
        homeCity,
        createdAt,
        updatedAt,
      ];
}
