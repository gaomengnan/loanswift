import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionEntity {
  String? permissionName;
  Icon? icon;
  String? title;
  String? description;

  PermissionEntity(
      {this.permissionName, this.icon, this.title, this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['permission_name'] = permissionName;
    data['icon'] = icon;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

List<Permission> controllerPermissions = [
  Permission.contacts,
  if (Platform.isAndroid) Permission.requestInstallPackages,
  if (Platform.isAndroid) Permission.sms,
  Permission.location,
  Permission.notification,
];
