import 'package:loanswift/features/domain/entity/user/certify.dart';

class CertifiesModel extends Certifies {
  CertifiesModel({
    required super.identityInfo,
    required super.emergencyInfo,
    required super.jobInfo,
    required super.personalInfo,
  });

  // 从 Map 创建 Certifies 实例
  factory CertifiesModel.fromMap(Map<String, dynamic> map) {
    return CertifiesModel(
      identityInfo: List<Info>.from(
          map['identity_info']?.map((x) => Info.fromMap(x)) ?? []),
      emergencyInfo: List<Info>.from(
          map['emergency_info']?.map((x) => Info.fromMap(x)) ?? []),
      jobInfo:
          List<Info>.from(map['job_info']?.map((x) => Info.fromMap(x)) ?? []),
      personalInfo: List<Info>.from(
          map['personal_info']?.map((x) => Info.fromMap(x)) ?? []),
    );
  }

  CertifiesModel copyWith({
    List<Info>? identityInfo,
    List<Info>? emergencyInfo,
    List<Info>? jobInfo,
    List<Info>? personalInfo,
  }) =>
      CertifiesModel(
        identityInfo: identityInfo ?? this.identityInfo,
        emergencyInfo: emergencyInfo ?? this.emergencyInfo,
        jobInfo: jobInfo ?? this.jobInfo,
        personalInfo: personalInfo ?? this.personalInfo,
      );
}
