import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loanswift/core/constants/ui.dart';
import 'package:loanswift/features/presentation/views/home/appbar.dart';
import 'package:loanswift/features/presentation/views/home/banner.dart';
import 'package:loanswift/features/presentation/views/home/bill.dart';
import 'package:loanswift/features/presentation/views/home/quota.dart';
import 'package:loanswift/features/presentation/views/home/suggestion.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/common/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _anicontroller, _scaleController;
  late AnimationController _footerController;
  final RefreshController _refreshController = RefreshController();
  int count = 20;

  @override
  void initState() {
    _anicontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _scaleController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);

    _refreshController.headerMode?.addListener(() {
      if (_refreshController.headerStatus == RefreshStatus.idle) {
        _scaleController.value = 0.0;
        _anicontroller.reset();
      } else if (_refreshController.headerStatus == RefreshStatus.refreshing) {
        _anicontroller.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scaleController.dispose();
    _footerController.dispose();
    _anicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.primaryColor,
        leadingWidth: ScreenUtil().screenWidth,
        elevation: 0,
        toolbarHeight: 50.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              color: Pallete.primaryColor,
            ),
          ),
        ),
        actions: [
          const Icon(
            IconlyBold.message,
          ),
          UI.kWidth20(),
        ],
        leading: Row(
          children: [
            UI.kWidth20(),
            AppText(
              text: "Hi~ 欢迎你",
              size: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      //backgroundColor: Pallete.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //stops: [0.0, 0.3, 0.6],
                colors: [
                  Pallete.primaryColor,
                  Pallete.primaryColor,
                  Pallete.backgroundColor,
                ]),
          ),
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SmartRefresher(
            header: const ClassicHeader(
              textStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            enablePullDown: true,
            enablePullUp: false,
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 1000));
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              await Future.delayed(const Duration(milliseconds: 1000));
              count += 4;
              setState(() {});
              _refreshController.loadComplete();
            },
            controller: _refreshController,
            child: const CustomScrollView(
              slivers: [
                // Appbar
                //BuildAppBar(),
                // banner
                BuildBanner(),
                // 查看额度
                BuildQuota(),

                BuildBill(),
                // 借钱攻略
                BuildSuggestion(),
              ],
            ),
          )),
    );
  }
}
