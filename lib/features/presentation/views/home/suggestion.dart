import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

import '../../../../core/core.dart';
import '../../../../theme/theme.dart';

class BuildSuggestion extends StatelessWidget {
  const BuildSuggestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
        if (index == 0) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 0.h,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 0,
              ),
              title: AppText(
                text: "建议",
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w600,
                size: 16.sp,
              ),
              trailing: const Icon(
                IconlyBold.moreCircle,
                //color: Pallete.whiteColor,
              ),
            ),
          );
        }
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: index == 1 ? 0 : 10.h,
          ),
          //padding: EdgeInsets.symmetric(horizontal: 20.w,),
          //height: 100,
          decoration: BoxDecoration(
            color: Pallete.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              /*        Application Name row        */
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Pallete.primaryColor.withOpacity(0.2),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 0,
                  ),
                  leading: const CircleAvatar(
                    child: Icon(
                      IconlyBold.activity,
                    ),
                  ),
                  title: AppText(
                    textAlign: TextAlign.start,
                    text: "应用程序1",
                    fontWeight: FontWeight.w700,
                    size: 11.sp,
                  ),
                  //subtitle: const Text(""),
                  trailing: ElevatedButton(
                    onPressed: () {
                      //if (isButnDisabled) {
                      //  return;
                      //}
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0.w, 20.h),
                      elevation: 0,
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(
                          0.1,
                        ),
                      ),
                      backgroundColor: Pallete.primaryColor,
                    ).copyWith(
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Pallete.primaryColor,
                      ), // 设置字体颜色
                    ),
                    child: AppText(
                      text: S.current.lijishengqing,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor,
                      //size: 8.sp,
                    ),
                  ),
                ),
              ),

              /*  Application Desc    */

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        AppText(
                          text: "60,000",
                          size: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Space(
                          height: 5.h,
                          width: 0,
                        ),
                        AppText(text: "最高贷款额"),
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          text: "91天贷款",
                          fontWeight: FontWeight.w800,
                          size: 14.sp,
                        ),
                        Space(
                          height: 5.h,
                          width: 0,
                        ),
                        AppText(
                          text: "中间损失率0.08%/天",
                          size: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
