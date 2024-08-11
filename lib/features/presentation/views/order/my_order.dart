import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/refresher.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/theme.dart';

import 'package:loanswift/core/common/widgets/widgets.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});
  static const routerName = "/my_order";

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
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
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          indicator: null,
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
          tabs: const [
            Tab(
              text: "全部",
            ),
            Tab(
              text: "未偿还",
            ),
            Tab(
              text: "申请中",
            ),
            Tab(
              text: "已偿还",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListItems(),
          _buildListItems(),
          _buildListItems(),
          _buildListItems(),
        ],
      ),
    );
  }

  Widget _buildListItems() {
    return Refresher(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/order_detail',
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              margin: const EdgeInsets.all(10),
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: "应用程序",
                            size: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          AppText(
                            text: "过期",
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
                      margin: EdgeInsets.only(
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius:
                                  BorderRadius.circular(8.0.sp), // 圆角半径
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8.0.sp), // 设置圆角
                              child: const Icon(
                                IconlyBold.play,
                              ),
                            ),
                          ),
                          title: AppText(
                            textAlign: TextAlign.left,
                            text: "60,0000",
                            size: 16.sp,
                          ),
                          subtitle: AppText(
                            textAlign: TextAlign.left,
                            //size: 16.sp,
                            text: "贷款",
                          ),
                          trailing: Column(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Pallete.blackColor,
                                    ),
                                    text: "Due Date",
                                    children: [
                                      WidgetSpan(
                                        child: SizedBox(
                                          width: 3.w,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: "14-09-2024",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "立即还款",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
