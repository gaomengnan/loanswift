import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/theme/pallete.dart';

class IdentityVefification extends StatefulWidget {
  const IdentityVefification({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<IdentityVefification> createState() => _IdentityVefificationState();
}

class _IdentityVefificationState extends State<IdentityVefification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.secColor,
      appBar: AppBar(
        // elevation: 1,
        backgroundColor: Pallete.secColor,

        title: const Text(
          "实名认证",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 10.h,
        ),
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              // color: Colors.grey,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "申请额度",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                  text: "请本人实名认证   ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 60.h,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  width: double.infinity,
                  // height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white54,
                    // image: const DecorationImage(
                    //   image: AssetImage(Assets.idcard),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(
                          Assets.idcard,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      FilledButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.primaryColor,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.4,
                            36.h,
                          ), // 设置最小尺寸
                          // padding: const EdgeInsets.all(10), // 设置内边距
                        ),
                        onPressed: () {},
                        child: const Text(
                          "直接上传",
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      FilledButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.primaryColor,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.4,
                            36.h,
                          ), // 设置最小尺寸
                          // padding: const EdgeInsets.all(10), // 设置内边距
                        ),
                        onPressed: () {},
                        child: const Text(
                          "相机拍摄",
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  // child: const Text("asdsad"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
