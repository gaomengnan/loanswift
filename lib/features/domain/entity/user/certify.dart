class Certifies {
  final List<Info> identityInfo;
  final List<Info> emergencyInfo;
  final List<Info> jobInfo;
  final List<Info> personalInfo;

  Certifies({
    required this.identityInfo,
    required this.emergencyInfo,
    required this.jobInfo,
    required this.personalInfo,
  });
}

//class EmergencyInfo {
//  final int certifyId;
//  final String certifyCode;
//  final String certifyFieldsCate;
//  final String certifyFieldName;
//  final int certifyIsMust;
//  final String promptSubtitle;
//  final dynamic note;
//  final CertifyResult certifyResult;
//  final int certifyStatus;
//
//  EmergencyInfo({
//    required this.certifyId,
//    required this.certifyCode,
//    required this.certifyFieldsCate,
//    required this.certifyFieldName,
//    required this.certifyIsMust,
//    required this.promptSubtitle,
//    required this.note,
//    required this.certifyResult,
//    required this.certifyStatus,
//  });
//  factory EmergencyInfo.fromMap(Map<String, dynamic> map) {
//    return EmergencyInfo(
//      certifyId: map['certify_id'] ?? 0,
//      certifyCode: map['certify_code'] ?? '',
//      certifyFieldsCate: map['certify_fields_cate'] ?? '',
//      certifyFieldName: map['certify_field_name'] ?? '',
//      certifyIsMust: map['certify_is_must'] ?? 0,
//      promptSubtitle: map['prompt_subtitle'] ?? '',
//      note: map['note'],
//      certifyResult: CertifyResult.fromMap(map['certify_result'] ?? {}),
//      certifyStatus: map['certify_status'] ?? 0,
//    );
//  }
//
//  EmergencyInfo copyWith({
//    int? certifyId,
//    String? certifyCode,
//    String? certifyFieldsCate,
//    String? certifyFieldName,
//    int? certifyIsMust,
//    String? promptSubtitle,
//    dynamic note,
//    CertifyResult? certifyResult,
//    int? certifyStatus,
//  }) =>
//      EmergencyInfo(
//        certifyId: certifyId ?? this.certifyId,
//        certifyCode: certifyCode ?? this.certifyCode,
//        certifyFieldsCate: certifyFieldsCate ?? this.certifyFieldsCate,
//        certifyFieldName: certifyFieldName ?? this.certifyFieldName,
//        certifyIsMust: certifyIsMust ?? this.certifyIsMust,
//        promptSubtitle: promptSubtitle ?? this.promptSubtitle,
//        note: note ?? this.note,
//        certifyResult: certifyResult ?? this.certifyResult,
//        certifyStatus: certifyStatus ?? this.certifyStatus,
//      );
//}

class CertifyResult {
  final int firstRelation;
  final String firstName;
  final String firstPhone;
  final int secondRelation;
  final String secondName;
  final String secondPhone;
  final int thirdRelation;
  final String thirdName;
  final String thirdPhone;
  final int fourthRelation;
  final String fourthName;
  final String fourthPhone;
  final int fifthRelation;
  final String fifthName;
  final String fifthPhone;

  CertifyResult({
    required this.firstRelation,
    required this.firstName,
    required this.firstPhone,
    required this.secondRelation,
    required this.secondName,
    required this.secondPhone,
    required this.thirdRelation,
    required this.thirdName,
    required this.thirdPhone,
    required this.fourthRelation,
    required this.fourthName,
    required this.fourthPhone,
    required this.fifthRelation,
    required this.fifthName,
    required this.fifthPhone,
  });

  // 从 Map 创建 CertifyResult 实例
  factory CertifyResult.fromMap(Map<String, dynamic> map) {
    return CertifyResult(
      firstRelation: map['first_relation'] ?? 0,
      firstName: map['first_name'] ?? '',
      firstPhone: map['first_phone'] ?? '',
      secondRelation: map['second_relation'] ?? 0,
      secondName: map['second_name'] ?? '',
      secondPhone: map['second_phone'] ?? '',
      thirdRelation: map['third_relation'] ?? 0,
      thirdName: map['third_name'] ?? '',
      thirdPhone: map['third_phone'] ?? '',
      fourthRelation: map['fourth_relation'] ?? 0,
      fourthName: map['fourth_name'] ?? '',
      fourthPhone: map['fourth_phone'] ?? '',
      fifthRelation: map['fifth_relation'] ?? 0,
      fifthName: map['fifth_name'] ?? '',
      fifthPhone: map['fifth_phone'] ?? '',
    );
  }

  CertifyResult copyWith({
    int? firstRelation,
    String? firstName,
    String? firstPhone,
    int? secondRelation,
    String? secondName,
    String? secondPhone,
    int? thirdRelation,
    String? thirdName,
    String? thirdPhone,
    int? fourthRelation,
    String? fourthName,
    String? fourthPhone,
    int? fifthRelation,
    String? fifthName,
    String? fifthPhone,
  }) =>
      CertifyResult(
        firstRelation: firstRelation ?? this.firstRelation,
        firstName: firstName ?? this.firstName,
        firstPhone: firstPhone ?? this.firstPhone,
        secondRelation: secondRelation ?? this.secondRelation,
        secondName: secondName ?? this.secondName,
        secondPhone: secondPhone ?? this.secondPhone,
        thirdRelation: thirdRelation ?? this.thirdRelation,
        thirdName: thirdName ?? this.thirdName,
        thirdPhone: thirdPhone ?? this.thirdPhone,
        fourthRelation: fourthRelation ?? this.fourthRelation,
        fourthName: fourthName ?? this.fourthName,
        fourthPhone: fourthPhone ?? this.fourthPhone,
        fifthRelation: fifthRelation ?? this.fifthRelation,
        fifthName: fifthName ?? this.fifthName,
        fifthPhone: fifthPhone ?? this.fifthPhone,
      );
}

class Info {
  final int certifyId;
  final String certifyCode;
  final String certifyFieldsCate;
  final String certifyFieldName;
  final int certifyIsMust;
  final String promptSubtitle;
  final dynamic note;
  final dynamic certifyResult;
  final int certifyStatus;

  Info({
    required this.certifyId,
    required this.certifyCode,
    required this.certifyFieldsCate,
    required this.certifyFieldName,
    required this.certifyIsMust,
    required this.promptSubtitle,
    required this.note,
    required this.certifyResult,
    required this.certifyStatus,
  });

  Info.empty()
      : this(
          certifyId: 0,
          certifyCode: '',
          certifyFieldsCate: '',
          certifyFieldName: '',
          certifyIsMust: 0,
          promptSubtitle: '',
          note: null,
          certifyResult: null,
          certifyStatus: 0,
        );


  bool isCertify() {
    return certifyStatus == 1;
  }




  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      certifyId: map['certify_id'] ?? 0,
      certifyCode: map['certify_code'] ?? '',
      certifyFieldsCate: map['certify_fields_cate'] ?? '',
      certifyFieldName: map['certify_field_name'] ?? '',
      certifyIsMust: map['certify_is_must'] ?? 0,
      promptSubtitle: map['prompt_subtitle'] ?? '',
      note: map['note'],
      //certifyResult: map['certify_result'] ?? '',
      certifyResult: map['certify_result'],
      certifyStatus: map['certify_status'] ?? 0,
    );
  }

  // 将 Info 实例转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'certify_id': certifyId,
      'certify_code': certifyCode,
      'certify_fields_cate': certifyFieldsCate,
      'certify_field_name': certifyFieldName,
      'certify_is_must': certifyIsMust,
      'prompt_subtitle': promptSubtitle,
      'note': note,
      'certify_result': certifyResult,
      'certify_status': certifyStatus,
    };
  }

  Info copyWith({
    int? certifyId,
    String? certifyCode,
    String? certifyFieldsCate,
    String? certifyFieldName,
    int? certifyIsMust,
    String? promptSubtitle,
    dynamic note,
    List<CertifyResult>? certifyResult,
    int? certifyStatus,
  }) =>
      Info(
        certifyId: certifyId ?? this.certifyId,
        certifyCode: certifyCode ?? this.certifyCode,
        certifyFieldsCate: certifyFieldsCate ?? this.certifyFieldsCate,
        certifyFieldName: certifyFieldName ?? this.certifyFieldName,
        certifyIsMust: certifyIsMust ?? this.certifyIsMust,
        promptSubtitle: promptSubtitle ?? this.promptSubtitle,
        note: note ?? this.note,
        certifyResult: certifyResult ?? this.certifyResult,
        certifyStatus: certifyStatus ?? this.certifyStatus,
      );
}

//class PersonalInfo {
//  final int certifyId;
//  final String certifyCode;
//  final String certifyFieldsCate;
//  final String certifyFieldName;
//  final int certifyIsMust;
//  final String promptSubtitle;
//  final dynamic note;
//  final int certifyResult;
//  final int certifyStatus;
//
//  PersonalInfo({
//    required this.certifyId,
//    required this.certifyCode,
//    required this.certifyFieldsCate,
//    required this.certifyFieldName,
//    required this.certifyIsMust,
//    required this.promptSubtitle,
//    required this.note,
//    required this.certifyResult,
//    required this.certifyStatus,
//  });
//
//  // 从 Map 创建 PersonalInfo 实例
//  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
//    return PersonalInfo(
//      certifyId: map['certify_id'] ?? 0,
//      certifyCode: map['certify_code'] ?? '',
//      certifyFieldsCate:
//          map['certify_fields_cate'] ?? '', // 假设 CertifyFieldsCate 有 fromMap 方法
//
//      certifyFieldName: map['certify_field_name'] ?? '',
//      certifyIsMust: map['certify_is_must'] ?? 0,
//      promptSubtitle: map['prompt_subtitle'] ?? '',
//      note: map['note'], // 根据实际类型处理
//      certifyResult: map['certify_result'] ?? 0,
//      certifyStatus: map['certify_status'] ?? 0,
//    );
//  }
//
//  // 将 PersonalInfo 实例转换为 Map
//  Map<String, dynamic> toMap() {
//    return {
//      'certify_id': certifyId,
//      'certify_code': certifyCode,
//      'certify_fields_cate':
//          certifyFieldsCate, // 假设 CertifyFieldsCate 有 toMap 方法
//      'certify_field_name': certifyFieldName,
//      'certify_is_must': certifyIsMust,
//      'prompt_subtitle': promptSubtitle,
//      'note': note, // 根据实际类型处理
//      'certify_result': certifyResult,
//      'certify_status': certifyStatus,
//    };
//  }
//
//  PersonalInfo copyWith({
//    int? certifyId,
//    String? certifyCode,
//    String? certifyFieldsCate,
//    String? certifyFieldName,
//    int? certifyIsMust,
//    String? promptSubtitle,
//    DataMap? note,
//    int? certifyResult,
//    int? certifyStatus,
//  }) =>
//      PersonalInfo(
//        certifyId: certifyId ?? this.certifyId,
//        certifyCode: certifyCode ?? this.certifyCode,
//        certifyFieldsCate: certifyFieldsCate ?? this.certifyFieldsCate,
//        certifyFieldName: certifyFieldName ?? this.certifyFieldName,
//        certifyIsMust: certifyIsMust ?? this.certifyIsMust,
//        promptSubtitle: promptSubtitle ?? this.promptSubtitle,
//        note: note ?? this.note,
//        certifyResult: certifyResult ?? this.certifyResult,
//        certifyStatus: certifyStatus ?? this.certifyStatus,
//      );
//}
