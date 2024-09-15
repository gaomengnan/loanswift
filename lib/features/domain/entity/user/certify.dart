class Certifies {
  final List<Info> _identityInfo;
  final List<Info> _emergencyInfo;
  final List<Info> _jobInfo;
  final List<Info> _personalInfo;

  Certifies({
    required List<Info> identityInfo,
    required List<Info> emergencyInfo,
    required List<Info> jobInfo,
    required List<Info> personalInfo,
  })  : _identityInfo = identityInfo,
        _emergencyInfo = emergencyInfo,
        _jobInfo = jobInfo,
        _personalInfo = personalInfo;

  List<Info> get identityInfo => _identityInfo;
  List<Info> get emergencyInfo => _emergencyInfo;
  List<Info> get jobInfo => _jobInfo;
  List<Info> get personalInfo => _personalInfo;
}

class CertifyResult {
  final int? _firstRelation;
  final String? _firstName;
  final String? _firstPhone;
  final int? _secondRelation;
  final String? _secondName;
  final String? _secondPhone;
  final int? _thirdRelation;
  final String? _thirdName;
  final String? _thirdPhone;
  final int? _fourthRelation;
  final String? _fourthName;
  final String? _fourthPhone;
  final int? _fifthRelation;
  final String? _fifthName;
  final String? _fifthPhone;

  CertifyResult({
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
  })  : _firstRelation = firstRelation,
        _firstName = firstName,
        _firstPhone = firstPhone,
        _secondRelation = secondRelation,
        _secondName = secondName,
        _secondPhone = secondPhone,
        _thirdRelation = thirdRelation,
        _thirdName = thirdName,
        _thirdPhone = thirdPhone,
        _fourthRelation = fourthRelation,
        _fourthName = fourthName,
        _fourthPhone = fourthPhone,
        _fifthRelation = fifthRelation,
        _fifthName = fifthName,
        _fifthPhone = fifthPhone;

  // Getter methods with default values
  int get firstRelation => _firstRelation ?? 0;
  String get firstName => _firstName ?? '';
  String get firstPhone => _firstPhone ?? '';
  int get secondRelation => _secondRelation ?? 0;
  String get secondName => _secondName ?? '';
  String get secondPhone => _secondPhone ?? '';
  int get thirdRelation => _thirdRelation ?? 0;
  String get thirdName => _thirdName ?? '';
  String get thirdPhone => _thirdPhone ?? '';
  int get fourthRelation => _fourthRelation ?? 0;
  String get fourthName => _fourthName ?? '';
  String get fourthPhone => _fourthPhone ?? '';
  int get fifthRelation => _fifthRelation ?? 0;
  String get fifthName => _fifthName ?? '';
  String get fifthPhone => _fifthPhone ?? '';

  // From Map
  factory CertifyResult.fromMap(Map<String, dynamic> map) {
    return CertifyResult(
      firstRelation: map['first_relation'],
      firstName: map['first_name'],
      firstPhone: map['first_phone'],
      secondRelation: map['second_relation'],
      secondName: map['second_name'],
      secondPhone: map['second_phone'],
      thirdRelation: map['third_relation'],
      thirdName: map['third_name'],
      thirdPhone: map['third_phone'],
      fourthRelation: map['fourth_relation'],
      fourthName: map['fourth_name'],
      fourthPhone: map['fourth_phone'],
      fifthRelation: map['fifth_relation'],
      fifthName: map['fifth_name'],
      fifthPhone: map['fifth_phone'],
    );
  }

  // Copy with method
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
  final int? _certifyId;
  final String? _certifyCode;
  final String? _certifyFieldsCate;
  final String? _certifyFieldName;
  final int? _certifyIsMust;
  final String? _promptSubtitle;
  final dynamic _note;
  final dynamic _certifyResult;
  final int? _certifyStatus;

  Info({
    int? certifyId,
    String? certifyCode,
    String? certifyFieldsCate,
    String? certifyFieldName,
    int? certifyIsMust,
    String? promptSubtitle,
    dynamic note,
    dynamic certifyResult,
    int? certifyStatus,
  })  : _certifyId = certifyId,
        _certifyCode = certifyCode,
        _certifyFieldsCate = certifyFieldsCate,
        _certifyFieldName = certifyFieldName,
        _certifyIsMust = certifyIsMust,
        _promptSubtitle = promptSubtitle,
        _note = note,
        _certifyResult = certifyResult,
        _certifyStatus = certifyStatus;

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

  // Getter methods with default values
  int get certifyId => _certifyId ?? 0;
  String get certifyCode => _certifyCode ?? '';
  String get certifyFieldsCate => _certifyFieldsCate ?? '';
  String get certifyFieldName => _certifyFieldName ?? '';
  int get certifyIsMust => _certifyIsMust ?? 0;
  String get promptSubtitle => _promptSubtitle ?? '';
  dynamic get note => _note;
  dynamic get certifyResult => _certifyResult;
  int get certifyStatus => _certifyStatus ?? 0;

  bool isCertify() {
    return certifyStatus == 1;
  }

  bool isMust() {
    return certifyIsMust == 1;
  }

  // From Map
  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      certifyId: map['certify_id'],
      certifyCode: map['certify_code'],
      certifyFieldsCate: map['certify_fields_cate'],
      certifyFieldName: map['certify_field_name'],
      certifyIsMust: map['certify_is_must'],
      promptSubtitle: map['prompt_subtitle'],
      note: map['note'],
      certifyResult: map['certify_result'],
      certifyStatus: map['certify_status'],
    );
  }

  // Convert Info instance to Map
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

  // Copy with method
  Info copyWith({
    int? certifyId,
    String? certifyCode,
    String? certifyFieldsCate,
    String? certifyFieldName,
    int? certifyIsMust,
    String? promptSubtitle,
    dynamic note,
    dynamic certifyResult,
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
