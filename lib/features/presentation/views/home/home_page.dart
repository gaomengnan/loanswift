import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/app_theme.dart';
import 'package:loanswift/theme/pallete.dart';

import '../person/identity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(
      () {
        final p = _pageController.page!;
        setState(() {
          _currentIndex = p.round();
        });
      },
    );
    super.initState();
  }

  Widget _buildBanner(int index) {
    final imageUrl = Assets.banners[index];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      //height: ScreenUtil().screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Pallete.primaryColor,
                  Pallete.primaryColor,
                  Pallete.backgroundColor,
                ]),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: [
              // Appbar
              const BuildSliverAppBar(),
              // banner
              SliverPadding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  right: 10.h,
                  bottom: 5.h,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().screenHeight * 0.2,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: Assets.banners.length,
                          itemBuilder: (context, index) {
                            return _buildBanner(index);
                          },
                        ),
                      ),
                      Space(height: 5.h, width: 0),
                      SizedBox(
                        height: 10,
                        child: Wrap(
                          spacing: 10,
                          children: [
                            ...List.generate(Assets.banners.length, (index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.h, vertical: 40.h),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 查看额度
              const BuildCheckLimitedSliver(),
              // 借钱攻略
              const BuildLoanSliver(),
            ],
          )),
    );
  }
}

class BuildLoanSliver extends StatelessWidget {
  const BuildLoanSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> loanGuide = [
      {
        "title": S.current.title700,
        "icon": IconlyBold.tickSquare,
      },
      {
        "title": S.current.title800,
        "icon": IconlyBold.activity,
      },
      {
        "title": S.current.title900,
        "icon": IconlyBold.wallet,
      },
    ];
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
                                              color: Pallete.primaryColor,
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

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: ScreenUtil().screenWidth,
      elevation: 0,
      toolbarHeight: 50.h,
      backgroundColor: Pallete.whiteColor,
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
      actions: [
        const Icon(
          IconlyBold.message,
        ),
        UI.kWidth20(),
      ],
      leading: Row(
        children: [
          UI.kWidth20(),
          AppText(
            text: "Hi~ 欢迎你",
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
