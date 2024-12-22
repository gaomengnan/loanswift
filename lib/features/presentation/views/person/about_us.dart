import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/theme/pallete.dart';

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
              Image.asset(
                Assets.pintekLogo,
                fit: BoxFit.cover,
                //width: 50,
                height: 100.h,
              ),
              Ui.kHeight10(),
              RText(
                text: "v$appVersiion",
                color: Pallete.primaryColor,
                size: 15.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
