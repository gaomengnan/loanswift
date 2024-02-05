import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/common/widgets/app_text.dart';
import 'package:loanswift/common/widgets/slide_cuts_painter.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/generated/l10n.dart';
import 'package:loanswift/theme/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     stops: [0.0, 0.5],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: Pallete.gradientColors,
          //   ),
          // ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leadingWidth: 80.w,
                elevation: 0,
                toolbarHeight: 50.h,
                backgroundColor: Pallete.backgroundColor,
                // foregroundColor: Pallete.primaryColor,
                expandedHeight: 65.0.h,
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
                    SizedBox(
                      width: 20.w,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        Assets.userAvatar,
                      ),
                      // backgroundColor: Pallete.redColor,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
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
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(8).r,
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
                            AppText(
                              text: S.current.maximun_load_sub_text,
                              size: 10.sp,
                              color: Pallete.greyColor,
                              // fontWeight: FontWeight.bold,
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
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            Center(
                                              child: AppText(
                                                text: S.current.title100,
                                                color: Pallete.greyColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 20.h,
                                                        width: 25.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5.r,
                                                          ),
                                                          color: Pallete
                                                              .orangeColor,
                                                        ),
                                                        child: Center(
                                                          child: AppText(
                                                            text: "30",
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
                                                      AppText(
                                                        text:
                                                            S.current.title200,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 20.h,
                                                        width: 25.w,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          // borderRadius:
                                                          //     BorderRadius
                                                          //         .circular(
                                                          //             5.r),
                                                          color: Pallete
                                                              .orangeColor,
                                                        ),
                                                        child: Center(
                                                          child: AppText(
                                                            text: "%",
                                                            color: Pallete
                                                                .whiteColor,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      AppText(
                                                        text:
                                                            S.current.title300,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 20.h,
                                                        width: 25.w,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Pallete
                                                              .orangeColor,
                                                        ),
                                                        child: Center(
                                                          child: AppText(
                                                            color: Pallete
                                                                .whiteColor,
                                                            text: "5",
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      AppText(
                                                        text:
                                                            S.current.title400,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 14.h,
                                            ),
                                            // 按钮
                                            Container(
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
                  ),
                ),
              ),

              // 借钱攻略

              SliverToBoxAdapter(
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
                              SizedBox(
                                height: 10.h,
                              ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // icon
                                          const Icon(
                                            IconlyBold.tickSquare,
                                            color: Pallete.primaryColor,
                                          ),
                      
                                          SizedBox(
                                            height: 5.h,
                                          ),
                      
                                          AppText(
                                            text: "3分钟申请",
                                            size: 13.sp,
                                          ),
                                          // title
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // icon
                                          const Icon(
                                            IconlyBold.activity,
                                            color: Pallete.primaryColor,
                                          ),
                      
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          AppText(
                                            text: "5分钟放贷",
                                            size: 13.sp,
                                          ),
                                          // title
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // icon
                                          const Icon(
                                            IconlyBold.wallet,
                                            color: Pallete.primaryColor,
                                          ),
                      
                                          SizedBox(
                                            height: 5.h,
                                          ),
                      
                                          AppText(
                                            text: "灵活借还",
                                            size: 13.sp,
                                          ),
                                          // title
                                        ],
                                      ),
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
              ),

              // SliverList(
              //   delegate: SliverChildBuilderDelegatk(
              //     (BuildContext context, int index) {
              //       return ListTile(
              //         title: Text('Item $index'),
              //       );
              //     },
              //     childCount: 50, // 为了演示，创建了50个列表项
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
