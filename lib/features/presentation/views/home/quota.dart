import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/features/domain/entity/home/rules.dart';
import 'package:loanswift/features/domain/entity/products/main_products.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/features/presentation/views/person/bind_bank.dart';
import 'package:loanswift/features/presentation/views/widgets/order_confirm_dialog.dart';
import 'package:loanswift/features/presentation/views/widgets/permission.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../theme/theme.dart';

class BuildMainEntry extends StatelessWidget {
  final MainProducts mainProducts;
  final Rules rule;
  const BuildMainEntry({
    super.key,
    required this.mainProducts,
    required this.rule,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> districtFirst = [
      {
        "title": S.current.title200,
        "icon_text": "30",
        "subtitle": "",
      },
      {
        "title": S.current.title300,
        "icon_text": "%",
        "subtitle": mainProducts.productLimit.serviceRate,
      },
      {
        "title": S.current.title400,
        "icon_text": "5",
        "subtitle": "",
      },
    ];

    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
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
    final serviceRate = mainProducts.productLimit.serviceRate;
    final desc = S.current.maximun_load_sub_text;
    final String fullText = desc.replaceAll('#rate#', serviceRate);

    final int countIndex = fullText.indexOf(serviceRate);

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
            RText(
              text: mainProducts.copywriterInfo.productDesc.title,
              // color: Pallete.whiteColor,
              size: 13.sp,
            ),
            UI.kHeight5(),
            RText(
              text: mainProducts.productAmount,
              size: 33.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),

              child: RichText(
                text: TextSpan(
                    text: fullText.substring(0, countIndex),
                    style: const TextStyle(
                      color: Pallete.greyColor,
                    ),
                    children: [
                      TextSpan(
                        text: serviceRate,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
              //child: AppText(
              //
              //  maxLines: 10,
              //  text: S.current.maximun_load_sub_text,
              //  size: 10.sp,
              //  color: Pallete.greyColor,
              //  // fontWeight: FontWeight.bold,
              //),
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
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10.h,
                                  bottom: 5.h,
                                  left: 5.h,
                                  right: 5.h),
                              child: Center(
                                child: RText(
                                  text: mainProducts.copywriterInfo.productDesc
                                      .mainPositionDesc,
                                  size: 13.sp,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(districtFirst.length,
                                    (index) {
                                  final item = districtFirst[index];
                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom: 5.h,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 20.w,
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
                                                color:
                                                    Pallete.thirdColor, // 阴影颜色
                                                offset: Offset(5.w,
                                                    2.h), // 阴影偏移量 (x方向5, y方向0)
                                                blurRadius: 2, // 模糊半径
                                                spreadRadius: 1, // 扩散半径
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: Center(
                                            child: RText(
                                              text: item["icon_text"],
                                              fontWeight: FontWeight.w900,
                                              color: Pallete.whiteColor,
                                            ),
                                          ),
                                        ),
                                        UI.kWidth10(),
                                        Expanded(
                                          child: RichText(
                                              text: TextSpan(
                                                  text: item['title'],
                                                  style: TextStyle(
                                                    color: Pallete.blackColor,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  children: [
                                                TextSpan(
                                                  text: " ${item['subtitle']}",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                              ])),
                                          //child: AppText(
                                          //  textAlign: TextAlign.start,
                                          //  text: item["title"],
                                          //  fontWeight: FontWeight.w500,
                                          //),
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
                                if (!rule.certifyCompleted) {
                                  //Navigator.of(context).pushNamed(
                                  //    VerifyPage.routerName,
                                  //    arguments: {
                                  //      'productId': mainProducts.productId,
                                  //    });
                                  showPermissionDialog(
                                      context, mainProducts.productId);
                                } else if (rule.certifyCompleted &&
                                    !rule.isBindCard) {
                                  Navigator.of(context).pushNamed(
                                    BindBank.routerName,
                                    arguments: {
                                      'productId': mainProducts.productId,
                                    },
                                  );
                                } else {
                                  final startTime = DateTime.now();

                                  showOrderConfirmDialog(context,
                                      productId: mainProducts.productId, onOK: (
                                    ctx,
                                  ) {
                                    bus.fire(
                                      TargetPointEvent(
                                        startTime,
                                        DateTime.now(),
                                        SceneType.applyPage,
                                        productCode: mainProducts.productId.toString(),
                                      ),
                                    );

                                    Navigator.pop(ctx);
                                    context
                                        .read<HomeBloc>()
                                        .add(HomeRefreshEvent());
                                  }, onCancel: () {
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              child: Center(
                                child: Text(
                                  mainProducts.copywriterInfo.button.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  //color: Pallete.whiteColor,
                                  //size: 16.sp,
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
            child: CachedNetworkImage(
              width: 30.w,
              height: 30.h,
              imageUrl: mainProducts.copywriterInfo.productDesc.logo,
            ),
          ),
          //UI.kWidth20(),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RText(
                  text: mainProducts.productName,
                  color: Pallete.whiteColor,
                  fontWeight: FontWeight.w900,
                  size: 13.sp,
                  //fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                ),
                //),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: mainProducts.copywriterInfo.productDesc.tags,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily:
                          Theme.of(context).textTheme.bodySmall?.fontFamily,
                    ),
                    //children: [
                    //  //WidgetSpan(
                    //  //child: UI.kWidth5(),
                    //  //),
                    //  TextSpan(
                    //    text: "${S.current.free_concession} · ",
                    //    children: [
                    //      TextSpan(
                    //        text: S.current.quick_deposit,
                    //      ),
                    //      //TextSpan(
                    //      //  text: S.current.quick_deposit,
                    //      //),
                    //    ],
                    //  ),
                    //],
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
