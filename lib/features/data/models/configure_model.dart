import 'package:loanswift/features/domain/entity/common/configure.dart';

class ConfigureModel extends ConfigureEntity {
  ConfigureModel({
    required super.permissions,
    required super.currentVersion,
    required super.advertise,
  });

  // fromMap factory method
  factory ConfigureModel.fromMap(Map<String, dynamic> map) {
    return ConfigureModel(
      permissions: Permissions.fromMap(map['permission'] ?? {}),
      currentVersion: map['current_version'] ?? '',
      advertise: AdvertiseEntity.fromMap(map['advertise'] ?? {}),
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'permission': permissions.toMap(),
      'current_version': currentVersion,
      'advertise': advertise.toMap()
    };
  }

  // fromJson factory method (JSON -> ConfigureModel)
  factory ConfigureModel.fromJson(Map<String, dynamic> json) {
    return ConfigureModel(
      permissions: Permissions.fromJson(json['permission'] ?? {}),
      currentVersion: json['current_version'] ?? '',
      advertise: json['advertise'] ?? {},
    );
  }

  // toJson method (ConfigureModel -> JSON)
  Map<String, dynamic> toJson() {
    return {
      'permission': permissions.toJson(),
      'current_version': currentVersion,
    };
  }
}
