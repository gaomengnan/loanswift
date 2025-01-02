import 'package:loanswift/core/core.dart';

MessagesEntity messageDataFromMap(DataMap e) => MessagesEntity.fromMap(e);

List<MessagesEntity> messagesDataFromList(List<dynamic> data) =>
    data.map((item) => messageDataFromMap(item)).toList();

class MessagesEntity {
  String name;
  String phone;
  String notice;
  String money;
  String time;

  // Constructor
  MessagesEntity({
    required this.name,
    required this.phone,
    required this.notice,
    required this.money,
    required this.time,
  });

  // Factory method to create an Entity object from a JSON map
  factory MessagesEntity.fromJson(Map<String, dynamic> json) {
    return MessagesEntity(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      notice: json['notice'] ?? '',
      money: json['money'] ?? '',
      time: json['time'] ?? '',
    );
  }

  // Method to create an Entity object from a Map (alternative to fromJson)
  factory MessagesEntity.fromMap(Map<String, dynamic> map) {
    return MessagesEntity(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      notice: map['notice'] ?? '',
      money: map['money'] ?? '',
      time: map['time'] ?? '',
    );
  }

  // Method to convert the Entity object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'notice': notice,
      'money': money,
      'time': time,
    };
  }

  // Method to convert the Entity object to a Map (alternative to toJson)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'notice': notice,
      'money': money,
      'time': time,
    };
  }
}
