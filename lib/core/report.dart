import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/core/firebase_api.dart';
import 'package:loanswift/features/domain/usecases/common/report_fcm.dart';
import 'package:loanswift/features/domain/usecases/common/report_gps.dart';
import 'package:loanswift/firebase_options.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class ReportService {
  final DeviceInfoPlugin deviceInfoPlg = DeviceInfoPlugin();

  final SmsQuery telephony = SmsQuery();

  final network = NetworkInfo();

  Future<PackageInfo> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo;

    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    //String version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;
  }

  void fcmTokenReport() async {
    try {
      /*  是否上报完成*/
      await FirebaseApi().initNotifications();
      final reported = GetStorage().hasData(AppContant.fcmTokenReportInitial);

      if (!reported) {
        String? fcm;

        fcm = GetStorage().read<String>(AppContant.fcmToken);

        if (fcm == null) {
          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );

          fcm = await FirebaseApi().getToken();

          GetStorage().write(AppContant.fcmToken, fcm);
        }

        if (fcm != null && fcm.isNotEmpty) {
          final deviceId = await getDeviceId();

          final ReportFcm fcmSer = sl();
          final reportResp = await fcmSer
              .call(ReportFcmParams(token: fcm, deviceId: deviceId));
          reportResp.fold((l) {}, (r) {
            GetStorage().write(AppContant.fcmTokenReportInitial, 1);
          });
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> gpsReport() async {
    LocationPermission permission;
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }

      if (permission == LocationPermission.deniedForever) {
        // 权限被永久拒绝
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      //// 获取当前位置信息
      final resp = await Geolocator.getCurrentPosition();

      // 获取 deviceId
      final deviceInf = await getDeviceDetails();

      // package info

      final packageInfo = await getPackageInfo();
      Dio dio = Dio(BaseOptions(baseUrl: Environment.baseUrl));
      dio.interceptors.add(DioInterceptor());

      /* GEOENCODING */
      String? address = "";
      try {
        final marks =
            await placemarkFromCoordinates(resp.latitude, resp.longitude);
        if (marks.isNotEmpty) {
          Placemark place = marks[0];
          // 拼接详细地址信息
          address = '${place.street}, '
              '${place.locality}, '
              '${place.administrativeArea}, '
              '${place.country}, '
              '${place.postalCode}';
        }
      } catch (_) {}

      ///*   DO HTT PREPORT */
      final params = ReportgpsParams(
        latitude: resp.latitude,
        longitude: resp.longitude,
        addressDistinct: address ?? '',
        clientType: "android",
        appVersion: packageInfo.version,
        deviceId: deviceInf['deviceId'] ?? '',
        deviceName: deviceInf['model'] ?? '',
        osVersion: deviceInf['osVersion'] ?? '',
        appName: packageInfo.appName,
        packageId: packageInfo.packageName,
      );
      final Reportgps reportgps = sl();
      final response = await reportgps.call(params);

      return response.fold(
        (l) {
          return Future.value(false);
        },
        (r) => Future.value(true),
      );
      //return right(resp);
    }

    return Future.value(false);

    //return Future.error(
    //'Location permissions are permanently denied, we cannot request permissions.');
  }

  //void postDeviceInfo() async {
  //  final details = await getDeviceDetails();
  //  reportRepo.postDeviceInfo(
  //    data: {
  //      "data": details,
  //      "type": "1001",
  //    },
  //  );
  //}

  Future<void> readSMS() async {
    if (Platform.isAndroid) {
      final iG = await Permission.sms.request();

      if (iG.isGranted) {
        List<SmsMessage> messages = await telephony.getAllSms;
        if (messages.isNotEmpty) {
          for (var element in messages) {
            debugPrint('SMS from ${element.sender}: ${element.body}');
          }
        }
      } else {}
    }
  }

  Future<String> getDeviceId() async {
    if (GetStorage().hasData(AppContant.deviceUUIDKy)) {
      final deviceId = GetStorage().read<String>(AppContant.deviceUUIDKy);
      return Future.value(deviceId);
    }

    final deviceInfo = await getDeviceDetails();

    GetStorage().write(AppContant.deviceUUIDKy, deviceInfo['deviceId']);

    return Future.value(deviceInfo['deviceId']);
  }

  Future<Map<String, dynamic>> getDeviceDetails() async {
    var deviceData = <String, dynamic>{};
    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlg.webBrowserInfo);
      } else {
        //await Permission.storage.request();
        deviceData = switch (defaultTargetPlatform) {
          TargetPlatform.android =>
            _readAndroidBuildData(await deviceInfoPlg.androidInfo),
          TargetPlatform.iOS => _readIosDeviceInfo(await deviceInfoPlg.iosInfo),
          TargetPlatform.linux => <String, dynamic>{
              'Error:': 'Fuchsia platform isn\'t supported'
            },
          TargetPlatform.windows => <String, dynamic>{
              'Error:': 'Fuchsia platform isn\'t supported'
            },
          TargetPlatform.macOS => <String, dynamic>{
              'Error:': 'Fuchsia platform isn\'t supported'
            },
          TargetPlatform.fuchsia => <String, dynamic>{
              'Error:': 'Fuchsia platform isn\'t supported'
            },
        };
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    GetStorage().write(AppContant.deviceInfoKey, deviceData);
    return Future.value(deviceData);
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'osVersion': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'deviceId': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'serialNumber': build.serialNumber,
      'isLowRamDevice': build.isLowRamDevice,
    };
  }

  static Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': data.browserName.name,
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'osVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'deviceId': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname': data.utsname.sysname,
      'utsname.nodename': data.utsname.nodename,
      'utsname.release': data.utsname.release,
      'utsname.version': data.utsname.version,
      'utsname.machine': data.utsname.machine,
    };
  }
  // 上报fcmtoken
}
