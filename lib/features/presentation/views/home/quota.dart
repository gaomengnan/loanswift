import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/person/identity.dart';

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
              color: const Color(
                0xffFFE9CE,
              ),
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UI.kWidth20(),
                      RichText(
                        text: TextSpan(
                          text: S.current.exclusive,
                          style: TextStyle(
                            color: const Color(0xff882E13),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            WidgetSpan(
                              child: UI.kWidth10(),
                            ),
                            TextSpan(
                              text: "${S.current.high_quality} · ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                TextSpan(
                                  text: "${S.current.free_concession} · ",
                                ),
                                TextSpan(
                                  text: S.current.quick_deposit,
                                ),
                              ],
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
                ),
                Container(
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                          ),
                          child: Divider(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        AppText(
                          text: "200,000",
                          size: 35.sp,
                          color: Pallete.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: AppText(
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
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              color: Pallete.secColor,
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
                                        UI.kHeight10(),
                                        Center(
                                          child: AppText(
                                            text: S.current.title100,
                                            color: Pallete.greyColor,
                                          ),
                                        ),
                                        UI.kHeight10(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                                districtFirst.length, (index) {
                                              final item = districtFirst[index];
                                              return Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 20.h,
                                                      width: 25.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          5.r,
                                                        ),
                                                        color:
                                                            Pallete.orangeColor,
                                                      ),
                                                      child: Center(
                                                        child: AppText(
                                                          text:
                                                              item["icon_text"],
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    // Text(S.current.title200, textAlign: TextAlign.center,),
                                                    AppText(
                                                      text: item["title"],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        // 按钮
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                              Identity.routerName,
                                            );
                                          },
                                          child: Center(
                                            child: AppText(
                                              text: S.current.title500,
                                              color: Pallete.whiteColor,
                                              size: 18.sp,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
