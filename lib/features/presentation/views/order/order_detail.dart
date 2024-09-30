import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/loading_page.dart';
import 'package:loanswift/core/common/widgets/webview.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/bloc/order/order_bloc.dart';
import 'package:loanswift/features/presentation/views/order/event_card.dart';
import 'package:loanswift/theme/theme.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  static const routerName = "/order_detail";

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Widget buildTimeline() {
    return const Placeholder();
  }

  Widget buildListTile(String k, String v) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        //vertical: 5.h,
      ),
      child: Column(
        children: [
          UI.kHeight5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: RText(
                  size: 12.sp,
                  color: Colors.black54,
                  maxLines: 2,
                  //fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  text: k,
                ),
              ),
              Expanded(
                child: RText(
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  //size: 15.sp,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                  text: v,
                ),
              )
            ],
          ),
          UI.kHeight5(),
          Divider(
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: Text(
          S.current.orderDetails,
        ),
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OrderLoadDetailSuccess) {
              final succeed = state;
              final bestDesc = succeed.orderDetail.bestDesc;
              return Stack(
                children: [
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 1,
                        child: SizedBox(
                          //height: 70.h,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10.0.h,
                              left: 10.w,
                              right: 10.w,
                              bottom: 10.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RText(
                                  color: Colors.red,
                                  text: succeed.orderDetail.noticeStatusText,
                                  size: 20.sp,
                                ),
                                UI.kHeight5(),
                                RText(
                                  text: succeed.orderDetail.noticeDesText,
                                  size: 13.sp,
                                  color: Pallete.greyColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Pallete.whiteColor,
                        elevation: 1,
                        child: Column(
                          children: [
                            /*  
                            Application Logo And Name Desc 
                        */

                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ),
                                leading: UI.squareContainer(
                                  Image(
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      succeed.orderDetail.productLogo,
                                      errorListener: (p0) {},
                                    ),
                                  ),
                                ),
                                title: RText(
                                  textAlign: TextAlign.start,
                                  text: succeed.orderDetail.productName,
                                  fontWeight: FontWeight.w600,
                                  size: 14.sp,
                                ),
                              ),
                            ),

                            /*
                           Application Detail Desc
                        */
                            ...succeed.orderDetail.userOrderDetail.detail
                                .map((e) => buildListTile(e.text, e.value)),
                            //buildListTile("贷款日期", "asdada"),
                          ],
                        ),
                      ),

                      /*   BUILD TIME LINE  */

                      if (bestDesc.isNotEmpty)
                        Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(bestDesc.length, (index) {
                                final data = bestDesc[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: MyTimeline(
                                    isFirst: index == 0,
                                    isLast: index == bestDesc.length - 1,
                                    isPast: data.isLock == 1,
                                    enchild: EventCard(
                                      isPast: data.isLock == 1,
                                      asset: const Icon(
                                        IconlyBold.notification,
                                      ),
                                      title: data.title,
                                      status: data.status,
                                      amount: data.amount,
                                      amountDesc: data.amountDesc,
                                    ),
                                  ),
                                );
                              }),
                              UI.kHeight20(),
                            ],
                          ),
                        ),

                      SizedBox(
                        height: 50.h,
                      ),

                      //if (bestDesc.isEmpty) Placeholder(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      width: ScreenUtil().screenWidth,
                      height: 50.h,
                      child: Wrap(
                        spacing: 10.w,
                        alignment: WrapAlignment.end,
                        children: [
                          //TextButton(onPressed: () {}, child: RText(text: "更多",)),
                          if (succeed.orderDetail.orderStatus > 151 &&
                              succeed.orderDetail.orderStatus != 999)
                            OutlinedButton(
                              style: UI.orderButtonStyle(),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewComponent(
                                      url: succeed.orderDetail.jumpPath
                                          .jumpByLoanContact,
                                      title: S.current.view_contract,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                S.current.view_contract,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8.sp),
                                //fontWeight: FontWeight.w500,
                                //color: Colors.black,
                              ),
                            ),
                          if (succeed.orderDetail.orderStatus > 151 &&
                              succeed.orderDetail.orderStatus != 999 &&
                              succeed.orderDetail.orderStatus != 200 &&
                              succeed.orderDetail.isDelay == 1)
                            OutlinedButton(
                              style: UI.orderButtonStyle(),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewComponent(
                                      url: succeed
                                          .orderDetail.jumpPath.jumpByDelay,
                                      title: S.current.installment_repayment,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                S.current.installment_repayment,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8.sp,
                                ),
                                //fontWeight: FontWeight.w500,
                                //color: Colors.black,
                              ),
                            ),
                          if (succeed.orderDetail.orderStatus > 151 &&
                              succeed.orderDetail.orderStatus != 999 &&
                              succeed.orderDetail.orderStatus != 200)
                            ElevatedButton(
                              style: UI.orderButtonStyle().copyWith(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      Colors.red,
                                    ),
                                  ),
                              onPressed: () {
                                // 处理按钮点击事件
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewComponent(
                                      url: succeed
                                          .orderDetail.jumpPath.jumpByNormal,
                                      title: S.current.normal_repayment,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                S.current.normal_repayment,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const LoadingPage();
          }),
    );
  }
}
