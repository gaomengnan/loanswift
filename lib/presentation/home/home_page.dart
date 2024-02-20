import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/common/widgets/app_text.dart';
import 'package:loanswift/common/widgets/slide_cuts_painter.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/data/home_district.dart';
import 'package:loanswift/generated/l10n.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../constants/ui.dart';
import '../person/identity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UI.showSignInAndUpBootomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Pallete.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const CustomScrollView(
          slivers: [
            // Appbar
            BuildSliverAppBar(),
            // 查看额度
            BuildCheckLimitedSliver(),
            // 借钱攻略
            BuildLoanSliver(),
          ],
        ),
      ),
    );
  }
}

class BuildLoanSliver extends StatelessWidget {
  const BuildLoanSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Pallete.backgroundColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    // color: Pallete.backgroundColor,
                    // color: Colors.orange,
                    // borderRadius: BorderRadius.circular(5),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: S.current.title600,
                      size: 16.sp,
                    ),
                    UI.kHeight10(),
                    Container(
                      width: double.infinity,
                      // height: 200,
                      decoration: BoxDecoration(
                        gradient: Pallete.loanGradient,
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                        ),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UI.kWidth10(),
                            ...List.generate(loanGuide.length, (index) {
                              final item = loanGuide[index];

                              return Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // icon
                                    Icon(
                                      item["icon"],
                                      color: Pallete.primaryColor,
                                    ),

                                    SizedBox(
                                      height: 5.h,
                                    ),

                                    AppText(
                                      text: item["title"],
                                      size: 12.sp,
                                    ),
                                    // title
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //  other
          ],
        ),
      ),
    );
  }
}

class BuildCheckLimitedSliver extends StatelessWidget {
  const BuildCheckLimitedSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Pallete.gradientColors,
          ),
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 10.h,
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
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              Identity.routerName,
                                            );
                                            // showPermissionDialog(
                                            //   context,
                                            // );
                                          },
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: AppText(
                                                text: S.current.title500,
                                                color: Pallete.whiteColor,
                                                size: 18.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 声明
                        Center(
                          child: AppText(
                            text: "贷款额度由小金小贷提供",
                            color: Pallete.greyColor,
                          ),
                        ),
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

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 80.w,
      elevation: 0,
      toolbarHeight: 50.h,
      backgroundColor: Pallete.whiteColor,
      // foregroundColor: Pallete.primaryColor,
      expandedHeight: 55.0.h,
      floating: false, //
      pinned: true, //
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            color: Pallete.primaryColor,
          ),
        ),
      ),
      leading: Row(
        children: [
          UI.kWidth20(),
          const CircleAvatar(
            backgroundImage: AssetImage(
              Assets.userAvatar,
            ),
            // backgroundColor: Pallete.redColor,
          ),
        ],
      ),
    );
  }
}
