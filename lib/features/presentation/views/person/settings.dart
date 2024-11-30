import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/theme/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const routerName = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        title: const Text("账号设置"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
                children: [
        Container(
          decoration: const BoxDecoration(
            //border: Border(
            //  bottom: BorderSide(
            //    color: Colors.grey.shade300, // 边框颜色
            //    width: 1.0, // 边框宽度
            //  ),
            //),
            color: Colors.white,
          ),
          child: Column(
            children: [
              //Row(
              //  children: [
              //    RText(
              //      textAlign: TextAlign.start,
              //      text: "关于Pintek",
              //      fontWeight: FontWeight.w600,
              //      size: 14.sp,
              //    ),
              //    const Icon(
              //      Icons.arrow_right_rounded,
              //    ),
              //  ],
              //),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  //vertical: 0
                ),
                title: RText(
                  textAlign: TextAlign.start,
                  text: "清理缓存",
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                ),
                trailing: SizedBox(
                  width: 200.w,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Container(
                      //  padding: EdgeInsets.all(5.sp),
                      //  decoration: BoxDecoration(
                      //    borderRadius: BorderRadius.circular(20),
                      //    color: Pallete.redDeepColor,
                      //  ),
                      //  child: RText(
                      //    text: "发现新版本",
                      //    color: Pallete.whiteColor,
                      //    //size: 8,
                      //    //style: TextStyle(
                      //    //    fontSize: 8.sp, color: Pallete.whiteColor),
                      //  ),
                      //),
                      //RText(
                      //  textAlign: TextAlign.start,
                      //  text: "版本 1.0.8",
                      //),
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
            //border: Border(
            //  bottom: BorderSide(
            //    color: Colors.grey.shade300, // 边框颜色
            //    width: 1.0, // 边框宽度
            //  ),
            //),
            color: Colors.white,
          ),
          child: Column(
            children: [
              //Row(
              //  children: [
              //    RText(
              //      textAlign: TextAlign.start,
              //      text: "关于Pintek",
              //      fontWeight: FontWeight.w600,
              //      size: 14.sp,
              //    ),
              //    const Icon(
              //      Icons.arrow_right_rounded,
              //    ),
              //  ],
              //),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                title: RText(
                  textAlign: TextAlign.start,
                  text: "关于Pintek",
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                ),
                trailing: SizedBox(
                  width: 200.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Container(
                      //  padding: EdgeInsets.all(5.sp),
                      //  decoration: BoxDecoration(
                      //    borderRadius: BorderRadius.circular(20),
                      //    color: Pallete.redDeepColor,
                      //  ),
                      //  child: RText(
                      //    text: "发现新版本",
                      //    color: Pallete.whiteColor,
                      //    //size: 8,
                      //    //style: TextStyle(
                      //    //    fontSize: 8.sp, color: Pallete.whiteColor),
                      //  ),
                      //),
                      RText(
                        textAlign: TextAlign.start,
                        text: "版本 1.0.8",
                      ),
                      const Icon(
                        Icons.arrow_right_rounded,
                      ),
                    ],
                  ),
                ),
              ),
              //Padding(
              //  padding: EdgeInsets.symmetric(
              //    horizontal: 10.w,
              //  ),
              //  child: Divider(
              //    color: Colors.grey[200],
              //  ),
              //),
            ],
          ),
        ),
                ],
              ),
      ),
    );
  }
}
