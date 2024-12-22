import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  Utils._();
  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 4) {
      return phoneNumber; // 如果手机号长度小于4，直接返回
    }
    String masked = '*' * (phoneNumber.length - 4); // 前面的部分用 * 替代
    String lastFour = phoneNumber.substring(phoneNumber.length - 4); // 提取后四位
    return masked + lastFour;
  }

  static void showSnakebar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 80.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              size: 14.sp,
                              color: Colors.red,
                            ),
                            Ui.kWidth5(),
                            RText(
                              textAlign: TextAlign.start,
                              text: " 发生问题了",
                              color: Pallete.whiteColor,
                              size: 13.sp,
                              fontWeight: FontWeight.bold,
                              //style: TextStyle(
                              //  color: Pallete.whiteColor,
                              //  fontSize: 18,
                              //  fontWeight: FontWeight.bold,
                              //),
                            ),
                          ],
                        ),
                        Ui.kHeight5(),
                        //const Spacer(),
                        Expanded(
                          child: RText(
                            text: content,
                            color: Pallete.whiteColor,
                            size: 12.sp,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            // textAlign: TextAlign.center,
                          ),
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
    PermissionStatus cameraStatus = await Permission.camera.status;
    return cameraStatus == PermissionStatus.granted;
  }

  static Future<XFile?> pickerImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final resp = await picker.pickImage(
      source: ImageSource.gallery,
    );

    return resp;
  }

  static void pickerImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(
      source: ImageSource.camera,
    );
  }

  static ResultFuture<Response> uploadImageFromBytes(
      Uint8List bytes, String? code) async {
    final resp = await sl<DioClient>().post(
      path: AppContant.uploadUri,
      data: {
        "file": MultipartFile.fromBytes(
          bytes,
          filename: "face.jpg",
        ),
        'type': code,
      },
      pt: 'form',
    );

    return resp;
  }

  static ResultFuture<Response> uploadImage(String path, String? code) async {
    final resp = await sl<DioClient>().post(
      path: AppContant.uploadUri,
      data: {
        "file": await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        ),
        'type': code,
      },
      pt: 'form',
    );

    return resp;
  }
}
