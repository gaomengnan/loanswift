class ConfigureEntity {
  final Permissions permissions;
  final String currentVersion;
  final AdvertiseEntity advertise;
  ConfigureEntity({
    required this.permissions,
    required this.currentVersion,
    required this.advertise,
  });
}

class AdvertiseEntity {
  final String id;
  final String expire;
  final List<AdvertiseItem> list;

  AdvertiseEntity({
    required this.id,
    required this.expire,
    required this.list,
  });

  // 初始状态
  static AdvertiseEntity? initial() {
    return null; // 初始值为 0
  }

  factory AdvertiseEntity.fromMap(Map<String, dynamic> map) {
    return AdvertiseEntity(
      id: map['id'] ?? "",
      expire: map['expire'] ?? "",
      list: (map['list'] as List?)
              ?.map((item) => AdvertiseItem.fromMap(item))
              .toList() ??
          [],
    );
  }

  // add toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expire': expire,
      'list': list.map((item) => item.toMap()).toList(),
    };
  }
}

class AdvertiseItem {
  final String title;
  final String imageUrl;

  AdvertiseItem({
    required this.title,
    required this.imageUrl,
  });

  // fromMap factory method
  factory AdvertiseItem.fromMap(Map<String, dynamic> map) {
    return AdvertiseItem(
      title: map['title'] ?? "",
      imageUrl: map['image_url'] ?? "",
    );
  }
  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image_url': imageUrl,
    };
  }
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
