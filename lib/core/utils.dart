import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  Utils._();
  static void showSnakebar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Pallete.redDeepColor,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 100,
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.chat),
                            Text(
                              " 发生问题了",
                              style: TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          content,
                          style: const TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showInfo(BuildContext context, String message) {
    Flushbar(
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      flushbarStyle: FlushbarStyle.GROUNDED,
      borderRadius: BorderRadius.circular(20),
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: const Duration(seconds: 4),
    ).show(context);
  }

  void checkPermission() async {
    final needPermissions = Permission.values
        .where((permission) {
          if (Platform.isIOS) {
            return permission != Permission.unknown;
          } else {
            return permission == Permission.contacts || // 联系人
                permission == Permission.requestInstallPackages ||
                permission == Permission.sms ||
                permission == Permission.camera ||
                permission == Permission.photos ||
                permission == Permission.location ||
                permission == Permission.locationWhenInUse ||
                permission == Permission.locationAlways ||
                permission == Permission.notification ||
                permission == Permission.accessNotificationPolicy;
          }
        })
        .map(
          (Permission e) => e.status,
        )
        .toList();

    for (Future<PermissionStatus> permissionFuture in needPermissions) {
      PermissionStatus status = await permissionFuture;

      switch (status) {
        case PermissionStatus.granted:
          break;
        case PermissionStatus.denied:
          break;
        case PermissionStatus.permanentlyDenied:
          break;
        case PermissionStatus.restricted:
          break;
        default:
      }
    }
  }

  static Future<bool> checkCameraPermission() async {
    PermissionStatus cameraStatus = await  Permission.camera.status;
    return cameraStatus == PermissionStatus.granted;
  }

  static void pickerImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(
      source: ImageSource.gallery,
    );
  }

  static void pickerImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(
      source: ImageSource.camera,
    );
  }
}
