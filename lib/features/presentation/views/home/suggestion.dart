import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/features/presentation/views/person/bind_bank.dart';
import 'package:loanswift/features/presentation/views/widgets/order_confirm_dialog.dart';
import 'package:loanswift/features/presentation/views/widgets/permission.dart';
import 'package:loanswift/theme/theme.dart';

class BuildSuggestion extends StatefulWidget {
  final List<MainProducts> apiProducts;

  final Rules rule;

  const BuildSuggestion({
    super.key,
    required this.apiProducts,
    required this.rule,
  });

  @override
  State<BuildSuggestion> createState() => _BuildSuggestionState();
}

class _BuildSuggestionState extends State<BuildSuggestion>
    with TickerProviderStateMixin {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 2, (context, index) {
        if (index == 0) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 0,
            ),
            title: RText(
              text: S.current.recommend,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w600,
              size: 16.sp,
            ),
            //trailing: const Icon(
            //  IconlyBold.moreCircle,
            //  //color: Pallete.whiteColor,
            //),
          );
        }

        return SizedBox(
          height: 130.h,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return buildProduct(index);
            },
            itemCount: widget.apiProducts.length,
          ),
        );
      }),
    );
  }

  Widget buildProduct(int index) {
    final product = widget.apiProducts[index];

    return Container(
      margin: EdgeInsets.only(
        right: (index == 4 || widget.apiProducts.length == 1) ? 0 : 10.w,
        //horizontal: 5.w,
        //vertical: index == 1 ? 0 : 10.h,
      ),
      //padding: EdgeInsets.symmetric(horizontal: 20.w,),
      //height: 100,
      decoration: const BoxDecoration(
        color: Pallete.whiteColor,
      ),
      child: Column(
        children: [
          /*        Application Name row        */
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 0.h,
              ),
              decoration: BoxDecoration(
                color: Pallete.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0.r),
                  bottomRight: Radius.circular(10.0.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*  BUILD THE PRODUCT NAME */

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          height: 35.h,
                          fit: BoxFit.cover,
                          width: 35.w,
                          imageUrl: product.copywriterInfo.productDesc.logo,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      UI.kWidth10(),
                      RText(
                        textAlign: TextAlign.start,
                        text: product.productName,
                        fontWeight: FontWeight.w700,
                        size: 11.sp,
                      ),
                    ],
                  ),

                  /*  BUILD THE PRODUCT BTN */
                  ElevatedButton(
                    onPressed: () {
                      if (!widget.rule.certifyCompleted) {
                        //Navigator.of(context).pushNamed(
                        //    VerifyPage.routerName,
                        //    arguments: {
                        //      'productId': mainProducts.productId,
                        //    });
                        showPermissionDialog(context, product.productId);
                      } else if (widget.rule.certifyCompleted &&
                          !widget.rule.isBindCard) {
                        Navigator.of(context).pushNamed(
                          BindBank.routerName,
                          arguments: {
                            'productId': product.productId,
                          },
                        );
                      } else {
                        final startTime = DateTime.now();

                        showOrderConfirmDialog(
                          context,
                          productId: product.productId,
                          onOK: (ctx) {
                            bus.fire(
                              TargetPointEvent(
                                startTime,
                                DateTime.now(),
                                SceneType.applyPage,
                                productCode: product.productId.toString(),
                              ),
                            );

                            Navigator.pop(ctx);
                            context.read<HomeBloc>().add(HomeRefreshEvent());
                          },
                          onCancel: () {
                            showRetainDialog(
                              context,
                              onOK: (context) {
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      }
                      //if (isButnDisabled) {
                      //  return;
                      //}
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0.w, 20.h),
                    ),
                    child: RText(
                      text: S.current.lijishengqing,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor,
                      size: 13.sp,
                      //size: 8.sp,
                    ),
                  ),
                ],
              ),
              //child: ListTile(

              //  contentPadding: EdgeInsets.symmetric(
              //    horizontal: 10.w,
              //    vertical: 0,
              //  ),
              //  leading: const CircleAvatar(
              //    child: Icon(
              //      IconlyBold.activity,
              //    ),
              //  ),
              //  title: AppText(
              //    textAlign: TextAlign.start,
              //    text: product.productName,
              //    fontWeight: FontWeight.w700,
              //    size: 11.sp,
              //  ),
              //  //subtitle: const Text(""),
              //  trailing: ElevatedButton(
              //    onPressed: () {
              //      //if (isButnDisabled) {
              //      //  return;
              //      //}
              //    },
              //    style: ElevatedButton.styleFrom(
              //      minimumSize: Size(0.w, 20.h),
              //    ),
              //    child: AppText(
              //      text: S.current.lijishengqing,
              //      fontWeight: FontWeight.bold,
              //      color: Pallete.whiteColor,
              //      size: 13.sp,
              //      //size: 8.sp,
              //    ),
              //  ),
              //),
            ),
          ),

          /*  Application Desc    */

          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 15.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RText(
                          text: product
                              .copywriterInfo.productDesc.mainPositionDesc,
                          size: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        //Space(
                        //  height: 5.h,
                        //  width: 0,
                        //),
                        //AppText(text: "最高贷款额"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RText(
                          text: product.copywriterInfo.productDesc.title,
                          //size: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        UI.kHeight5(),
                        RText(
                          text: product.productAmount,
                          fontWeight: FontWeight.w800,
                          size: 18.sp,
                        ),
                        //Space(
                        //  height: 5.h,
                        //  width: 0,
                        //),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
