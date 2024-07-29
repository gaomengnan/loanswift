import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/generated/l10n.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/entity/entity.dart';



void showPermissionDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Pallete.whiteColor,
          scrollable: true,
          title: Text(
            S.current.permission_title,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Container(
            // height: 200,
            decoration: const BoxDecoration(

                // color: Colors.red,
                ),
            child: Column(
              children: [
                const Divider(),
                ...controllerPermissions.map(
                  (Permission e) {
                    return BuildPermissionList(
                      permission: e,
                    );
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Pallete.primaryColor.withOpacity(.32);
                        }
                        return Pallete.primaryColor;
                      }),
                      value: true,
                      onChanged: (val) {},
                    ),
                    Text(
                      "${S.current.read_privacy} ${S.current.privacy}",
                    ),
                  ],
                ),
                FilledButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.primaryColor,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.6,
                      36.h,
                    ), // 设置最小尺寸
                    // padding: const EdgeInsets.all(10), // 设置内边距
                  ),
                  onPressed: () async {
                    var statuses =
                        await controllerPermissions.request();
                    statuses.forEach((permission, status) {
                      if (status == PermissionStatus.granted) {
                      } else {
                      }
                    });
                  },
                  child: Text(
                    S.current.agree_privacy,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

class BuildPermissionList extends StatefulWidget {
  final Permission permission;
  const BuildPermissionList({
    super.key,
    required this.permission,
  });

  @override
  State<BuildPermissionList> createState() => _BuildPermissionListState();
}

class _BuildPermissionListState extends State<BuildPermissionList> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  @override
  void initState() {
    super.initState();
    _listenPermissionStatus();
  }

  void _listenPermissionStatus() async {
    final status = await widget.permission.status;
    setState(
      () => _permissionStatus = status,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.permission == Permission.contacts)
          ListTile(
            leading: Icon(
              color: Pallete.primaryColor,
              size: 30.sp,
              Icons.contact_phone,
            ),
            title: Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              S.current.contact,
            ),
            subtitle: const Text(
              style: TextStyle(
                color: Pallete.greyColor,
              ),
              "Raycase 似乎不是一个通用的图像处理或文字识别库，可能是某个特定库、API 或者应用的名字",
            ),
            trailing: Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _permissionStatus == PermissionStatus.granted
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),
        if (widget.permission == Permission.requestInstallPackages)
          ListTile(
            trailing: Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _permissionStatus == PermissionStatus.granted
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            leading: Icon(
              color: Pallete.primaryColor,
              size: 30.sp,
              Icons.apps,
            ),
            title: Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              S.current.install_packages,
            ),
            subtitle: const Text(
                style: TextStyle(
                  color: Pallete.greyColor,
                ),
                "似乎不是一个通用的图像处理或文字识别库，可能是某个特定库、API 或者应用的名字。如果你是在询问关于文"),
          ),
        if (widget.permission == Permission.sms)
          ListTile(
            trailing: Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _permissionStatus == PermissionStatus.granted
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            leading: Icon(
              color: Pallete.primaryColor,
              size: 30.sp,
              Icons.sms,
            ),
            title: Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              S.current.sms,
            ),
            subtitle: const Text(
                style: TextStyle(
                  color: Pallete.greyColor,
                ),
                "似乎不是一个通用的图像处理或文字识别库，可能是某个特定库、API 或者应用的名字。如果你是在询问关于文"),
          ),
        if (widget.permission == Permission.camera)
          ListTile(
            trailing: Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _permissionStatus == PermissionStatus.granted
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            leading: Icon(
              color: Pallete.primaryColor,
              size: 30.sp,
              Icons.photo_camera,
            ),
            title: Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              S.current.camera,
            ),
            subtitle: const Text(
                style: TextStyle(
                  color: Pallete.greyColor,
                ),
                "似乎不是一个通用的图像处理或文字识别库，可能是某个特定库、API 或者应用的名字。如果你是在询问关于文"),
          ),
        if (widget.permission == Permission.location)
          ListTile(
            trailing: Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _permissionStatus == PermissionStatus.granted
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            leading: Icon(
              color: Pallete.primaryColor,
              size: 30.sp,
              Icons.location_on,
            ),
            title: Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              S.current.location,
            ),
            subtitle: const Text(
                style: TextStyle(
                  color: Pallete.greyColor,
                ),
                "似乎不是一个通用的图像处理或文字识别库，可能是某个特定库、API 或者应用的名字。如果你是在询问关于文"),
          ),
        if (widget.permission == Permission.notification)
          ListTile(
            trailing: Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _permissionStatus == PermissionStatus.granted
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            leading: Icon(
              color: Pallete.primaryColor,
              size: 30.sp,
              Icons.notifications,
            ),
            title: Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              S.current.notification,
            ),
            subtitle: const Text(
                style: TextStyle(
                  color: Pallete.greyColor,
                ),
                "似乎不是一个通用的图像处理或文字识别库，可能是某个特定库、API 或者应用的名字。如果你是在询问关于asadsadadaasd文"),
          ),
        const Divider(),
      ],
    );
  }
}
