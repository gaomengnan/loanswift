class ConfigureEntity {
  final Permissions permissions;
  final String currentVersion;
  ConfigureEntity({
    required this.permissions,
    required this.currentVersion,
  });
}

class Permissions {
  final int gps;
  final int contacts;
  final int sms;

  Permissions({
    required this.gps,
    required this.contacts,
    required this.sms,
  });

  // fromMap factory method
  factory Permissions.fromMap(Map<String, dynamic> map) {
    return Permissions(
      gps: map['Permission.location'] ?? 0,
      contacts: map['Permission.contacts'] ?? 0,
      sms: map['Permission.sms'] ?? 0,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'Permission.location': gps,
      'Permission.contacts': contacts,
      'Permission.sms': sms,
    };
  }

  // fromJson factory method (JSON -> Permissions)
  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      gps: json['Permission.location'] ?? 0,
      contacts: json['Permission.contacts'] ?? 0,
      sms: json['Permission.sms'] ?? 0,
    );
  }

  // toJson method (Permissions -> JSON)
  Map<String, dynamic> toJson() {
    return {
      'Permission.location': gps,
      'Permission.contacts': contacts,
      'Permission.sms': sms,
    };
  }
}
