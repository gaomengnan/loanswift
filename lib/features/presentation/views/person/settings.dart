import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/config_manager.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/core/webview_controller.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:loanswift/features/presentation/views/person/about_us.dart';
import 'package:loanswift/theme/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const routerName = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String version = "";
  late bool isUpgrade = false;
  @override
  void initState() {
    super.initState();
    _checkVersion();
  }

  _checkVersion() async {
    ConfigManager configManager = sl();
    ReportService reportService = sl();

    final nVersion = await configManager.getCurrentVersion();
    final packgeInfo = await reportService.getPackageInfo();
    final appVersion = packgeInfo.version;

    setState(() {
      version = appVersion;
    });

    if (nVersion != appVersion) {
      setState(() {
        isUpgrade = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        title: Text(
          S.current.account_settings,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            final webviewController =
                                MyWebviewController().controller;
                            await webviewController.clearCache();
                            await webviewController.clearLocalStorage();

                            if (context.mounted) {
                              Ui.showSuccess(context, S.current.cacheCleared);
                            }
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            //vertical: 0
                          ),
                          title: RText(
                            textAlign: TextAlign.start,
                            text: S.current.clear_cache,
                            fontWeight: FontWeight.w600,
                            size: 14.sp,
                          ),
                          trailing: SizedBox(
                            width: 200.w,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_right_rounded,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: Divider(
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AboutUs.routerName,
                            );
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          title: RText(
                            textAlign: TextAlign.start,
                            text: "${S.current.about} Pintek",
                            fontWeight: FontWeight.w600,
                            size: 14.sp,
                          ),
                          trailing: SizedBox(
                            width: 200.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (isUpgrade)
                                  Container(
                                    padding: EdgeInsets.all(5.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Pallete.redDeepColor,
                                    ),
                                    child: RText(
                                      text: S.current.discover_new_version,
                                      color: Pallete.whiteColor,
                                      //size: 8,
                                      //style: TextStyle(
                                      //    fontSize: 8.sp, color: Pallete.whiteColor),
                                    ),
                                  ),
                                if (!isUpgrade)
                                  RText(
                                    textAlign: TextAlign.start,
                                    text: "${S.current.version} $version",
                                  ),
                                const Icon(
                                  Icons.arrow_right_rounded,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.primaryColor,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.5,
                            36.h,
                          ), // 设置最小尺寸
                          // padding: const EdgeInsets.all(10), // 设置内边距
                        ),
                        onPressed: () {
                          Ui.showLogoutConfirmDialog(context, S.current.logout,
                              S.current.logoutConfirmation, () {
                            context.read<AuthBloc>().add(UserLogoutEvent());
                            Navigator.of(context).pop();
                          });
                        },
                        child: RText(
                          text: S.current.logout,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
