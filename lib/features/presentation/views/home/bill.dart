import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

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
                              child: CachedNetworkImage(
                                imageUrl: order.relationProduct.productLogo,
                                placeholder: (context, url) => Center(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      //margin: EdgeInsets.symmetric(
                                      //    horizontal: 10.h),
                                      //width: double.infinity,
                                      //height: 200.0,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              //child: Image(
                              //  image: CachedNetworkImageProvider(
                              //    order.relationProduct.productLogo,
                              //    errorListener: (p0) {},
                              //  ),
                              //),
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
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed('/order_detail', arguments: {
                            'order_no': order.orderNo,
                          }),
                          child: Icon(
                            IconlyBold.arrowRightCircle,
                            color: Theme.of(context).primaryColor,
                          ),
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
  }
}
