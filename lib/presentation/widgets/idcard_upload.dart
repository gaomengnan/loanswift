import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/constants/ui.dart';

import '../../common/widgets/app_text.dart';

class IDCardUpload extends StatefulWidget {
  const IDCardUpload({super.key});

  @override
  State<IDCardUpload> createState() => _IDCardUploadState();
}

class _IDCardUploadState extends State<IDCardUpload> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      // color: Pallete.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // 调整此值以设置圆角的大小
        side: const BorderSide(
          color: Colors.white70,
          // width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 10.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              size: 15.sp,
              fontWeight: FontWeight.bold,
              text: "身份证照片",
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            UI.kHeight10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    // width: double.infinity,
                    height: 130.h,
                    decoration: BoxDecoration(
                      // color: Color(0xffFAFAFA),
                      color: Colors.grey.withOpacity(0.1),
                      // image: DecorationImage(
                      //   // fit: BoxFit.cover,
                      //   image: AssetImage(
                      //     Assets.idcardFront,
                      //   ),
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(
                                Assets.idcardFront,
                              ),
                            ),
                          ),
                        ),
                        UI.kHeight10(),
                        AppText(
                          text: "Fotografia frontal de la identificacion",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                UI.kWidth10(),
                Expanded(
                  child: Container(
                    // width: double.infinity,
                    height: 130.h,
                    decoration: BoxDecoration(
                      // color: Color(0xffFAFAFA),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(
                                Assets.idcardReverse,
                              ),
                            ),
                          ),
                        ),
                        UI.kHeight10(),
                        AppText(
                          text: "Fotografia frontal de la identificacion",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
