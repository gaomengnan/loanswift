import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/refresher.dart';
import 'package:loanswift/core/constants/ui.dart';
import 'package:loanswift/features/presentation/views/home/banner.dart';
import 'package:loanswift/features/presentation/views/home/bill.dart';
import 'package:loanswift/features/presentation/views/home/quota.dart';
import 'package:loanswift/features/presentation/views/home/suggestion.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../core/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late AnimationController _anicontroller, _scaleController;
  //final RefreshController _refreshController = RefreshController();
  //int count = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_refreshController.dispose();
    //_scaleController.dispose();
    //_footerController.dispose();
    //_anicontroller.dispose();
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
              text: "Hi~ ${S.current.welcome_you}",
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
          child: Refresher(
            child: CustomScrollView(
              slivers: [
                // Appbar
                //BuildAppBar(),
                // banner
                const BuildBanner(),

                // 查看额度
                const BuildQuota(),

                /*   Bill Amount */
                const BuildBill(),

                // 借钱攻略

                const BuildSuggestion(),

                SliverPadding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                ),

                /*  Apps  */

                //BuildAppList(),

                SliverToBoxAdapter(child: FilledButton(onPressed: (){
                  Navigator.of(context).pushNamed('/my_order');
                }, child: Text("my_order"),),),
              ],
            ),
          )),
    );
  }
}
