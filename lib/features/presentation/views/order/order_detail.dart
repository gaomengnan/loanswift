import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/loading_page.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              RText(
                maxLines: 2,
                //size: 15.sp,
                color: Pallete.blackColor,
                fontWeight: FontWeight.bold,
                text: v,
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
      //bottomNavigationBar: BottomAppBar(
      //  color: Colors.transparent,
      //  height: 65.h,
      //  child: Column(
      //    mainAxisAlignment: MainAxisAlignment.spaceAround,
      //    children: [
      //      Expanded(
      //        child: FilledButton(
      //          style: FilledButton.styleFrom(
      //              minimumSize: Size(ScreenUtil().screenWidth * 0.5, 25.h)),
      //          onPressed: () {},
      //          child: const Text(
      //            "偿还",
      //            style: TextStyle(
      //              color: Pallete.whiteColor,
      //            ),
      //          ),
      //        ),
      //      ),
      //      UI.kHeight5(),
      //      Expanded(
      //        child: OutlinedButton(
      //          style: OutlinedButton.styleFrom(
      //            minimumSize: Size.fromWidth(ScreenUtil().screenWidth * 0.5),
      //            //backgroundColor: Colors.redAccent
      //          ),
      //          onPressed: () {},
      //          child: const Text(
      //            "差别分还",
      //            style: TextStyle(color: Pallete.blackColor),
      //          ),
      //        ),
      //      ),
      //    ],
      //  ),
      //),
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
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: SizedBox(
                      height: 100.h,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.0.h,
                          left: 10.w,
                          right: 10.w,
                          bottom: 10.h,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: RText(
                                color: Colors.red,
                                text: succeed.orderDetail.noticeStatusText,
                                size: 20.sp,
                              ),
                            ),
                            Expanded(
                              child: RText(
                                text: succeed.orderDetail.noticeDesText,
                                size: 13.sp,
                                color: Pallete.greyColor,
                              ),
                            ),
                            /*  再次申请按钮 */
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                  ScreenUtil().screenWidth * 0.5 ,
                                  0
                                )),
                                onPressed: () {},
                                child: const Text(
                                  "偿还",
                                  style: TextStyle(
                                    color: Pallete.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            //UI.kHeight5(),
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
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
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
                        children: [
                          ...List.generate(bestDesc.length, (index) {
                            final data = bestDesc[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  //if (bestDesc.isEmpty) Placeholder(),
                ],
              );
            }

            return const LoadingPage();
          }),
    );
  }
}
