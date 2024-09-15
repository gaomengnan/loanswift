import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/person/verify_page.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/entity/entity.dart';

Future<bool> checkPermission() async {
  List<PermissionStatus> statuses = await Future.wait(
    controllerPermissions.map((e) => e.status),
  );

  if (statuses.every((e) => e == PermissionStatus.granted)) {
    return Future.value(true);
  }
  return Future.value(false);
}

Future<void> showPermissionDialog(context, int productId) async {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    //barrierColor: Colors.grey.shade200,
    builder: (context) {
      return FutureBuilder(
          future: checkPermission(),
          builder: (context, snap) {
            //if (snap.connectionState == ConnectionState.waiting) {
            //  //return const Center(child: CircularProgressIndicator());
            //}
            if (snap.connectionState == ConnectionState.done) {
              final allPerm = snap.data ?? false;
              if (allPerm) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacementNamed(
                    context,
                    VerifyPage.routerName,
                    arguments: {
                      'productId': productId,
                    },
                  );
                });
              } else {
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
                        //Row(
                        //  children: [
                        //    Checkbox(
                        //      fillColor: WidgetStateProperty.resolveWith<Color>(
                        //          (Set<WidgetState> states) {
                        //        if (states.contains(WidgetState.disabled)) {
                        //          return Pallete.primaryColor.withOpacity(.32);
                        //        }
                        //        return Pallete.primaryColor;
                        //      }),
                        //      value: true,
                        //      onChanged: (val) {},
                        //    ),
                        //    Text(
                        //      "${S.current.read_privacy} ${S.current.privacy}",
                        //    ),
                        //  ],
                        //),
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
                            if (statuses.entries.every((e) {
                              return e.value == PermissionStatus.granted;
                            })) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  VerifyPage.routerName,
                                  arguments: {
                                    'productId': productId,
                                  },
                                );
                              });
                            }
                            //statuses.forEach((permission, status) {
                            //  if (status == PermissionStatus.granted) {
                            //  } else {}
                            //});
                          },
                          child: Text(
                            S.current.agree_privacy,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            S.current.cancel,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          });
    },
  );
  //Navigator.pop(context);
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

class _BuildPermissionListState extends State<BuildPermissionList>
    {
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addObserver(this);
    _listenPermissionStatus();
  }

  @override
  void dispose() {
    //WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // 监听应用生命周期的变化
  //@override
  //void didChangeAppLifecycleState(AppLifecycleState state) {
  //  if (state == AppLifecycleState.resumed) {
  //    _listenPermissionStatus();
  //  }
  //}

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
          buildPermItem(widget.permission, S.current.contact),
        if (widget.permission == Permission.requestInstallPackages)
          buildPermItem(widget.permission, S.current.install_packages),
        if (widget.permission == Permission.sms)
          buildPermItem(widget.permission, S.current.sms),
        if (widget.permission == Permission.camera)
          buildPermItem(widget.permission, S.current.camera),
        if (widget.permission == Permission.location)
          buildPermItem(widget.permission, S.current.location),
        if (widget.permission == Permission.notification)
          buildPermItem(widget.permission, S.current.notification),
        const Divider(),
      ],
    );
  }

  Widget buildPermItem(Permission perm, String title) {
    return ListTile(
      leading: Icon(
        color: Pallete.primaryColor,
        size: 30.sp,
        Icons.contact_phone,
      ),
      title: Text(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        title,
      ),
      //subtitle: const Text(
      //  style: TextStyle(
      //    color: Pallete.greyColor,
      //  ),
      //  "联系人权限",
      //),
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
    );
  }
}
