import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/theme/theme.dart';

class BuildBill extends StatelessWidget {
  final List<UserOrder> userOrder;
  const BuildBill({super.key, required this.userOrder});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        final order = userOrder[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            width: ScreenUtil().screenWidth,
            height: 140.h,
            decoration: const BoxDecoration(
              //color: Colors.redAccent,
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                  //Pallete.secondaryColor
                  //Pallete.redColor,
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image(
                                image: CachedNetworkImageProvider(
                                  order.relationProduct.productLogo,
                                ),
                              ),
                            ),
                            UI.kWidth10(),
                            RText(
                              textAlign: TextAlign.start,
                              text: order.relationProduct.productName,
                              color: Pallete.blackColor,
                              size: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        Icon(
                          IconlyBold.arrowRightCircle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                //UI.kHeight10(),
                Expanded(
                  flex: 2,
                  //flex: 8,
                  child: Container(
                    margin: EdgeInsets.only(
                      //top: 5.h,
                      bottom: 10.h,
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
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // 垂直居中
                              crossAxisAlignment:
                                  CrossAxisAlignment.center, // 水平居中
                              children: [
                                RText(
                                  text: order.orderAmount,
                                  size: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                UI.kHeight10(),
                                RText(
                                  text: order.copywriterInfo.orderStatusText,
                                  size: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),

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
                            crossAxisAlignment:
                                CrossAxisAlignment.center, // 水平居中
                            children: [
                              RText(
                                text: order.showTime,
                                size: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              UI.kHeight10(),
                              RText(
                                maxLines: 1,
                                text: order.copywriterInfo.dateText,
                                size: 12.sp,
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
        );
      },
      childCount: userOrder.length,
    ));
    //return SliverPadding(
    //  padding: EdgeInsets.only(
    //    left: 20.w,
    //    right: 20.w,
    //    top: 10.h,
    //    //vertical: 10.h,
    //  ),
    //  sliver: SliverToBoxAdapter(
    //    child: Container(
    //      padding: EdgeInsets.symmetric(
    //        horizontal: 20.w,
    //      ),
    //      width: ScreenUtil().screenWidth,
    //      height: 160.h,
    //      decoration: const BoxDecoration(
    //        //color: Colors.redAccent,
    //        gradient: LinearGradient(
    //          colors: [
    //            Colors.white,
    //            Colors.white,
    //            //Pallete.redColor,
    //          ],
    //          begin: Alignment.bottomCenter,
    //          end: Alignment.topCenter,
    //        ),
    //        borderRadius: BorderRadius.all(
    //          Radius.circular(10.0),
    //        ),
    //      ),
    //      child: Column(
    //        children: [
    //          Flexible(
    //            child: ListTile(
    //              titleTextStyle: Theme.of(context)
    //                  .listTileTheme
    //                  .titleTextStyle
    //                  ?.copyWith(height: 0.0),
    //              contentPadding:
    //                  const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    //              leading: Icon(
    //                IconlyBold.wallet,
    //                color: Theme.of(context).primaryColor,
    //                size: 20.sp,
    //              ),
    //              title: AppText(
    //                textAlign: TextAlign.start,
    //                text: S.current.soon_pay,
    //                color: Pallete.blackColor,
    //                size: 13.sp,
    //                fontWeight: FontWeight.w700,
    //              ),
    //              //subtitle: Text(''),
    //              trailing: Icon(
    //                IconlyBold.arrowRightCircle,
    //                color: Theme.of(context).primaryColor,
    //              ),
    //            ),
    //          ),
    //          UI.kHeight10(),
    //          Flexible(
    //            flex: 4,
    //            child: Container(
    //              margin: EdgeInsets.only(
    //                top: 5.h,
    //                bottom: 10.h,
    //              ),
    //              padding: EdgeInsets.symmetric(
    //                vertical: 10.h,
    //                horizontal: 10.h,
    //              ),
    //              width: ScreenUtil().screenWidth,
    //              height: double.infinity,
    //              decoration: const BoxDecoration(
    //                color: Pallete.backgroundColor,
    //                borderRadius: BorderRadius.all(
    //                  Radius.circular(10.0),
    //                ),
    //              ),
    //              child: Row(
    //                children: [
    //                  /*   left amount */
    //
    //                  Expanded(
    //                    child: Center(
    //                      child: Column(
    //                        mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
    //                        crossAxisAlignment:
    //                            CrossAxisAlignment.center, // 水平居中
    //                        children: [
    //                          AppText(
    //                            text: "R20，000",
    //                            size: 18.sp,
    //                            fontWeight: FontWeight.bold,
    //                          ),
    //                          UI.kHeight10(),
    //                          AppText(
    //                            text: S.current.bill_amount,
    //                            size: 12.sp,
    //                            fontWeight: FontWeight.bold,
    //                          ),
    //                        ],
    //                      ),
    //                    ),
    //                  ),
    //
    //                  /*  Divider */
    //
    //                  SizedBox(
    //                    height: 50.h,
    //                    child: const VerticalDivider(),
    //                  ),
    //                  /*  dateline  */
    //
    //                  Expanded(
    //                      child: Center(
    //                    child: Column(
    //                      mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
    //                      crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
    //                      children: [
    //                        AppText(
    //                          text: "06-08-2024",
    //                          size: 18.sp,
    //                          fontWeight: FontWeight.bold,
    //                        ),
    //                        UI.kHeight10(),
    //                        AppText(
    //                          maxLines: 1,
    //                          text: S.current.due_date,
    //                          size: 12.sp,
    //                          fontWeight: FontWeight.bold,
    //                        ),
    //                      ],
    //                    ),
    //                  )),
    //                ],
    //              ),
    //            ),
    //          )
    //        ],
    //      ),
    //    ),
    //  ),
    //);
  }
}
