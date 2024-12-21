import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/placeholder_page.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/models.dart';
import 'package:loanswift/features/presentation/bloc/order/order_bloc.dart';
import 'package:loanswift/theme/theme.dart';

import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});
  static const routerName = "/my_order";

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with TickerProviderStateMixin {
  late TabController _tabController;

  //final RefreshController _refreshController = RefreshController();

  late AnimationController _anicontroller, _scaleController;

  late List<DataMap> tabs = [];

  @override
  void initState() {
    tabs = OrderStatus.values.map((e) {
      final refreshController = RefreshController(initialRefresh: false);
      return {
        "tab": Tab(
          text: e.desc,
        ),
        'controller': refreshController,
        'origin': e,
      };
    }).toList();

    _anicontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _scaleController = AnimationController(
      value: 0.0,
      vsync: this,
      upperBound: 1.0,
    );

    _tabController = TabController(vsync: this, length: tabs.length);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        final DataMap data = tabs[_tabController.index];
        context
            .read<OrderBloc>()
            .add(OrderLoadEvent(orderStatus: data['origin'] as OrderStatus));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabs.map((e) => e['controller'].dispose(recursive: true));
    //_refreshController.dispose();
    _anicontroller.dispose();
    _scaleController.dispose();
    Ui.hideLoading();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
        0.96,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          S.current.load_amount,
        ),
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          tabAlignment: TabAlignment.start,
          //labelPadding: EdgeInsets.all(0),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          indicator: const BoxDecoration(color: Colors.transparent),
          //indicatorColor: Pallete.primaryColor,
          labelColor: Pallete.blackColor,
          labelStyle: TextStyle(
            //color: Colors.red,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp,
          ),
          controller: _tabController,
          isScrollable: true,
          tabs: tabs.map((data) => data['tab'] as Tab).toList(),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: tabs
            .map(
              (data) => Scrollbar(
                child: _buildListItems(
                  data['origin'] as OrderStatus,
                  data['controller'] as RefreshController,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildListItems(
      OrderStatus orderStatus, RefreshController refreshController) {
    return BlocConsumer<OrderBloc, OrderState>(listener: (context, state) {
      if (state is OrderLoadFailure) {
        Ui.showError(context, state.error.error);
      }

      if (state is OrderRefresh || state is OrderLoading) {
        Ui.showLoading();
      } else {
        Ui.hideLoading();
      }

      if (state is OrderLoadSuccess) {
        if (refreshController.isRefresh) {
          refreshController.refreshCompleted();
        }
      }
    }, builder: (context, state) {
      List<OrderModel> data = state.orders;

      return Refresher(
        anicontroller: _anicontroller,
        scaleController: _scaleController,
        refresh: refreshController,
        onRefresh: (_) {
          context.read<OrderBloc>().add(
                OrderLoadEvent(
                  orderStatus: orderStatus,
                  isRefresh: true,
                ),
              );
        },
        child: data.isEmpty
            ? const PlaceholderPage()
            : ListView.builder(
                itemBuilder: (context, index) {
                  final order = data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/order_detail',
                        arguments: {
                          'order_no': order.orderNo,
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      margin: const EdgeInsets.all(10),
                      height: 120.h,
                      decoration: BoxDecoration(
                        //color: Colors.white30,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  //color: Colors.blue,
                                  ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RText(
                                    text: order.relationProduct.productName,
                                    size: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  RText(
                                    text: order.copywriterInfo.orderStatusText,
                                    color: Pallete.redDeepColor,
                                    size: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //margin: EdgeInsets.only(
                              //  //bottom: 10.h,
                              //),
                              decoration: BoxDecoration(
                                //color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            child: CachedNetworkImage(
                                                imageUrl: order.relationProduct
                                                    .productLogo),
                                          ),
                                          Ui.kWidth10(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RText(
                                                textAlign: TextAlign.left,
                                                text: order.orderAmount,
                                                size: 15.sp,
                                              ),
                                              RText(
                                                textAlign: TextAlign.left,
                                                text: order
                                                    .copywriterInfo.moneyText,
                                                size: 15.sp,
                                              ),
                                            ],
                                          ),

                                          //UI.kWidth10(),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //Text("asdad"),
                                                  RText(
                                                    text: order.copywriterInfo
                                                        .dateText,
                                                    size: 14.sp,
                                                  ),
                                                  Ui.kHeight5(),
                                                  RText(
                                                    text: order.showTime,
                                                    size: 14.sp,
                                                    color: Colors.red,
                                                  ),
                                                  //RichText(
                                                  //  overflow: TextOverflow.ellipsis,
                                                  //  text: TextSpan(
                                                  //    style: const TextStyle(
                                                  //      color: Pallete.blackColor,
                                                  //    ),
                                                  //    text: order.copywriterInfo.dateText,
                                                  //    children: [
                                                  //      WidgetSpan(
                                                  //        child: SizedBox(
                                                  //          width: 3.w,
                                                  //        ),
                                                  //      ),
                                                  //      TextSpan(
                                                  //        text: order.showTime,
                                                  //      ),
                                                  //    ],
                                                  //  ),
                                                  //),
                                                  //FilledButton(
                                                  //  onPressed: () {},
                                                  //  child: const Text(
                                                  //    "立即还款",
                                                  //  ),
                                                  //),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //const Divider(
                                    //  color: Colors.black12,
                                    //),
                                    //Expanded(
                                    //  child: Padding(
                                    //    padding: EdgeInsets.only(right: 8.0.w, bottom: 8.h),
                                    //    child: Row(
                                    //      crossAxisAlignment:
                                    //          CrossAxisAlignment.end,
                                    //      mainAxisAlignment: MainAxisAlignment.end,
                                    //      children: [
                                    //        OutlinedButton(
                                    //            onPressed: () {},
                                    //            child: Text(S.current.immediate_repayment)),
                                    //      ],
                                    //    ),
                                    //  ),
                                    //),
                                    //UI.kHeight5(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.length,
              ),
      );
    });
  }
}
