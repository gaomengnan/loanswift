import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/config_manager.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  static const String routerName = "/about_us";

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late String appVersiion = "";

  @override
  void initState() {
    super.initState();
    _checkAppVersion();
  }

  void _checkAppVersion() async {
    ReportService reportService = sl();
    final packageInfo = await reportService.getPackageInfo();

    setState(() {
      appVersiion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${S.current.about} Pintek",
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                child: Image.asset(
                  Assets.pintekLogo,
                  fit: BoxFit.cover,
                  //width: 50,
                  height: 100.h,
                ),
              ),
              Ui.kHeight10(),
              RText(
                text: "v$appVersiion",
                color: Pallete.primaryColor,
                size: 15.sp,
              ),
              Ui.kHeight20(),
              GestureDetector(
                onTap: () async {
                  ConfigManager cm = sl();
                  final upgradeLink = await cm.getUpgradeLink();
                  final url = Uri.parse(upgradeLink);
                  try {
                    if (await canLaunchUrl(
                      url,
                    )) {
                      if (!await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      )) {}
                    }
                  } catch (e) {
                    if (context.mounted) {
                      Ui.showError(context, "Error");
                    }
                  }
                },
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    splashColor: Colors.black,
                    trailing: const Icon(
                      Icons.arrow_right_rounded,
                    ),
                    title: RText(
                      textAlign: TextAlign.start,
                      text: S.current.check_for_updates,
                      color: Colors.black,
                      size: 13.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
