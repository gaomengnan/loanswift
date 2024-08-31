import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeShimmer extends StatelessWidget {
  final double bannerHeight;
  final double quotaHeight;
  final double billHeight;
  final double suggestionHeight;

  const HomeShimmer({
    super.key,
    this.bannerHeight = 200,
    this.quotaHeight = 200.0,
    this.billHeight = 160.0,
    this.suggestionHeight = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            // BuildBanner 占位
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: bannerHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20.h), // 间隔

            // BuildQuota 占位
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: quotaHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 150,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: double.infinity,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 20,
                        width: 100,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: Container(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h), // 间隔

            // BuildBill 占位
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                height: billHeight,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 0),
                        leading: Icon(
                          Icons.account_balance_wallet,
                          color: Theme.of(context).primaryColor,
                          size: 20.sp,
                        ),
                        title: Container(
                          height: 10.h,
                          color: Colors.grey.shade400,
                          width: 100.w,
                        ),
                        trailing: Icon(
                          Icons.arrow_right,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Flexible(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            // Left amount placeholder
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 50.w,
                                    color: Colors.grey.shade400,
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 15.h,
                                    width: 70.w,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                            ),
                            // Divider
                            SizedBox(
                              height: 50.h,
                              child:
                                  VerticalDivider(color: Colors.grey.shade400),
                            ),
                            // Due date placeholder
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 80.w,
                                    color: Colors.grey.shade400,
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 15.h,
                                    width: 70.w,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
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
            SizedBox(height: 20.h), // 间隔

            // BuildSuggestion 占位
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
                    title: Container(
                      height: 10.h,
                      width: 100.w,
                      color: Colors.grey.shade400,
                    ),
                    trailing:
                        Icon(Icons.more_horiz, color: Colors.grey.shade400),
                  ),
                  SizedBox(
                    height: suggestionHeight,
                    child: PageView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: index == 4 ? 0 : 10.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey.shade400,
                                    child: Icon(Icons.star,
                                        color: Colors.grey.shade100),
                                  ),
                                  title: Container(
                                    height: 10.h,
                                    color: Colors.grey.shade400,
                                    width: 70.w,
                                  ),
                                  trailing: Container(
                                    height: 20.h,
                                    width: 60.w,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 15.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 20.h,
                                            width: 40.w,
                                            color: Colors.grey.shade400,
                                          ),
                                          SizedBox(height: 5.h),
                                          Container(
                                            height: 15.h,
                                            width: 70.w,
                                            color: Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: 20.h,
                                            width: 50.w,
                                            color: Colors.grey.shade400,
                                          ),
                                          SizedBox(height: 5.h),
                                          Container(
                                            height: 15.h,
                                            width: 90.w,
                                            color: Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
