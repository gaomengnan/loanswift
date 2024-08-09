import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/theme.dart';

class BuildBill extends StatelessWidget {
  const BuildBill({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 10.h,
        //vertical: 10.h,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          width: ScreenUtil().screenWidth,
          height: 160.h,
          decoration: const BoxDecoration(
            //color: Colors.redAccent,
            gradient: LinearGradient(
              colors: [
                Pallete.redColor,
                Colors.white,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              Flexible(
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  leading: const Icon(
                    Icons.payment,
                    color: Pallete.redColor,
                  ),
                  title: AppText(
                    text: S.current.soon_pay,
                    color: Pallete.redColor,
                    size: 13.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600,
                  ),
                  trailing: const Icon(
                    IconlyBold.arrowRightCircle,
                    color: Pallete.redColor,
                  ),
                ),
              ),
              UI.kHeight10(),
              Flexible(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.h,
                  ),
                  width: ScreenUtil().screenWidth,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Pallete.backgroundColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      /*   left amount */

                      Expanded(
                          child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
                          crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
                          children: [
                            AppText(
                              text: "R20，000",
                              size: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            UI.kHeight10(),
                            AppText(
                              text: S.current.bill_amount,
                              size: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )),

                      /*  Divider */

                      SizedBox(
                        height: 50.h,
                        child: const VerticalDivider(),
                      ),
                      /*  dateline  */

                      Expanded(
                          child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
                          crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
                          children: [
                            AppText(
                              text: "06-08-2024",
                              size: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            UI.kHeight10(),
                            AppText(
                              text: S.current.due_date,
                              size: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )),
                    ],
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
