import 'package:equatable/equatable.dart';


class User extends Equatable {
  final int? _id;
  final int? _userId;
  final String? _appForm;
  final String? _idCardFront;
  final String? _idCardBack;
  final int? _sex;
  final int? _education;
  final String? _homePhone;
  final String? _homeCity;
  final String? _createdAt;
  final String? _updatedAt;

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
  })  : _id = id,
        _userId = userId,
        _appForm = appForm,
        _idCardFront = idCardFront,
        _idCardBack = idCardBack,
        _sex = sex,
        _education = education,
        _homePhone = homePhone,
        _homeCity = homeCity,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // Getter methods to provide default values if null
  int get id => _id ?? 0;
  int get userId => _userId ?? 0;
  String get appForm => _appForm ?? '';
  String get idCardFront => _idCardFront ?? '';
  String get idCardBack => _idCardBack ?? '';
  int get sex => _sex ?? 0;
  int get education => _education ?? 0;
  String get homePhone => _homePhone ?? '';
  String get homeCity => _homeCity ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

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
