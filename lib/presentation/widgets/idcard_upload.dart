import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/constants/assets.dart';

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
      elevation: 3,
      // color: Pallete.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // 调整此值以设置圆角的大小
        // side: BorderSide(
        //   color: Colors.grey.withOpacity(0.3),
        //   width: 2,
        // ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 20.sp,
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
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    // width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color(0xffFAFAFA),
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
                        AppText(
                          text: "asdasdsadasdassdad",
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Container(
                    // width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   // fit: BoxFit.cover,
                      //   image: AssetImage(
                      //     Assets.idcardReverse,
                      //   ),
                      // ),
                      color: Color(0xffFAFAFA),
                    ),
                    child: Padding(
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
