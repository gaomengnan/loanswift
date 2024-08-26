import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/person/identity_page.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../theme/theme.dart';

class BuildQuota extends StatelessWidget {
  const BuildQuota({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> districtFirst = [
      {
        "title": S.current.title200,
        "icon_text": "30",
      },
      {
        "title": S.current.title300,
        "icon_text": "%",
      },
      {
        "title": S.current.title400,
        "icon_text": "5",
      },
    ];
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            //gradient: LinearGradient(
            //  begin: Alignment.topCenter,
            //  end: Alignment.bottomCenter,
            //  colors: Pallete.gradientColors,
            //),
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Container(
            decoration: BoxDecoration(
              //color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: Column(
              children: [
                buildBanner(context),
                buildBody(context, districtFirst),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(
      BuildContext context, List<Map<String, dynamic>> districtFirst) {
    return Container(
      decoration: BoxDecoration(
        color: Pallete.whiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.r),
          topLeft: Radius.circular(5.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ).h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text:
                  "${S.current.maximun_load_text}${S.current.maximun_load_text_unit}",
              // color: Pallete.whiteColor,
              size: 13.sp,
            ),
            UI.kHeight5(),
            //Padding(
            //  padding: EdgeInsets.symmetric(
            //    horizontal: 50.w,
            //  ),
            //  child: Divider(
            //    color: Colors.grey.withOpacity(0.2),
            //  ),
            //),
            AppText(
              text: "200,000",
              size: 33.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: AppText(
                maxLines: 10,
                text: S.current.maximun_load_sub_text,
                size: 10.sp,
                color: Pallete.greyColor,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 10.h,
              ).w,
              child: Container(
                decoration: BoxDecoration(
                  gradient: Pallete.quotaGradien,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  //color: Pallete.secColor,
                ),
                width: double.infinity,
                // height: 300,
                // color: Pallete.secColor,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: SlideCutsPainter(),
                      // clipper: AppClipper(),
                      child: SizedBox(
                        width: double.infinity,
                        // height: 100.h,
                        // decoration: const BoxDecoration(
                        //   color: Colors.orange,
                        // ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 5.h,
                              ),
                              child: Center(
                                child: AppText(
                                  text: S.current.title100,
                                  color: Pallete.blackColor,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                //vertical: 10.h
                              ),
                              child: const Divider(),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(districtFirst.length,
                                    (index) {
                                  final item = districtFirst[index];
                                  //return Center(
                                  //  child: Container(
                                  //    child: ListTile(
                                  //      contentPadding: EdgeInsets.symmetric(
                                  //        horizontal: 0,
                                  //        vertical: 0,
                                  //      ),
                                  //      title: Text(
                                  //        item["icon_text"],
                                  //        style: TextStyle(color: Colors.red),
                                  //      ),
                                  //      leading: Container(
                                  //        height: 20.h,
                                  //        width: 25.w,
                                  //        decoration: BoxDecoration(
                                  //          borderRadius: BorderRadius.circular(
                                  //            5.r,
                                  //          ),
                                  //          color:
                                  //              Theme.of(context).primaryColor,
                                  //        ),
                                  //        child: Center(
                                  //          child: AppText(
                                  //            text: item["icon_text"],
                                  //            fontWeight: FontWeight.w900,
                                  //            color: Pallete.whiteColor,
                                  //          ),
                                  //        ),
                                  //      ),
                                  //    ),
                                  //  ),
                                  //);
                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom: 5.h,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Pallete
                                                    .thirdColor, // 阴影颜色
                                                offset: Offset(5.w,
                                                    2.h), // 阴影偏移量 (x方向5, y方向0)
                                                blurRadius: 2, // 模糊半径
                                                spreadRadius: 1, // 扩散半径
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(
                                              5.r,
                                            ),
                                            color: Theme.of(context)
                                                .primaryColor,
                                          ),
                                          child: Center(
                                            child: AppText(
                                              text: item["icon_text"],
                                              fontWeight: FontWeight.w900,
                                              color: Pallete.whiteColor,
                                            ),
                                          ),
                                        ),
                                        UI.kWidth10(),
                                        Center(
                                          child: AppText(
                                            text: item["title"],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),

                            // 按钮
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  IdentityPage.routerName,
                                );
                              },
                              child: Center(
                                child: Text(
                                  S.current.title500,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  //color: Pallete.whiteColor,
                                  //size: 16.sp,
                                ),
                              ),
                            ),
                            //GestureDetector(
                            //  onTap: () {
                            //    Navigator.of(context).pushNamed(
                            //      Identity.routerName,
                            //    );
                            //    // showPermissionDialog(
                            //    //   context,
                            //    // );
                            //  },
                            //  child: Container(
                            //    height: 50,
                            //    width: double.infinity,
                            //    decoration: BoxDecoration(
                            //      color: Pallete.primaryColor,
                            //      borderRadius:
                            //          BorderRadius.circular(20),
                            //    ),
                            //    child: Center(
                            //      child: AppText(
                            //        text: S.current.title500,
                            //        color: Pallete.whiteColor,
                            //        size: 18.sp,
                            //      ),
                            //    ),
                            //  ),
                            //),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 声明
            // Center(
            //   child: AppText(
            //     text: "贷款额度由小金小贷提供",
            //     color: Pallete.greyColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildBanner(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      height: 40.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              width: 30.w,
              height: 30.h,
              image: const AssetImage(
                Assets.money,
              ),
            ),
          ),
          //UI.kWidth20(),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: S.current.exclusive,
                  color: Pallete.whiteColor,
                  fontWeight: FontWeight.w900,
                  size: 13.sp,
                  //fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                ),
                //),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: "${S.current.grab_go} · ",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily:
                          Theme.of(context).textTheme.bodySmall?.fontFamily,
                    ),
                    children: [
                      //WidgetSpan(
                      //child: UI.kWidth5(),
                      //),
                      TextSpan(
                        text: "${S.current.free_concession} · ",
                        children: [
                          TextSpan(
                            text: S.current.quick_deposit,
                          ),
                          //TextSpan(
                          //  text: S.current.quick_deposit,
                          //),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Icon(
          //   Icons.arrow_right,
          //   size: 14.sp,
          //   color: const Color(
          //     0xff882E13,
          //   ),
          // ),
        ],
      ),
    );
  }
}
